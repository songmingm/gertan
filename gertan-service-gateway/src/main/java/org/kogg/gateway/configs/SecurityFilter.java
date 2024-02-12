package org.kogg.gateway.configs;

import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.kogg.common.enums.CommonStatusEnum;
import org.kogg.common.models.base.ResponseEntity;
import org.kogg.common.utils.JwtUtil;
import org.kogg.common.utils.RedisUtil;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.core.io.buffer.DataBuffer;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;
import org.springframework.util.StringUtils;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import java.util.List;

/**
 * 网关层对jwt进行校验
 *
 * @author songming
 */
@Component
@Slf4j
public class SecurityFilter implements GlobalFilter, Ordered {

    private final NacosConfProperties nacosConfProperties;

    private final RedisUtil redisUtil;

    private final AntPathMatcher antPathMatcher = new AntPathMatcher();

    private final Gson gson = new Gson();

    public SecurityFilter(NacosConfProperties nacosConfProperties, RedisUtil redisUtil) {
        this.nacosConfProperties = nacosConfProperties;
        this.redisUtil = redisUtil;
    }

    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {

        // 判断是否需要认证
        Boolean authentication = nacosConfProperties.getWhetherEnableAuthentication();
        if (!authentication)
            return chain.filter(exchange);

        String url = exchange.getRequest().getURI().getPath();
        // 获取请求URL路径，白名单放行
        List<String> whiteURLs = nacosConfProperties.getWhiteURL();
        for (String whiteURL : whiteURLs) {
            if (antPathMatcher.match(whiteURL, url))
                return chain.filter(exchange);
        }

        String token = exchange.getRequest().getHeaders().getFirst("Authorization");
        if (!StringUtils.hasText(token))
            return noPower(exchange, CommonStatusEnum.TOKEN_NULL);

        try {
            boolean validateToken = JwtUtil.validateToken(token);
            // 处理身份信息
            if (!validateToken)
                return noPower(exchange, CommonStatusEnum.TOKEN_ERROR);
        } catch (Exception e) {
            return noPower(exchange, CommonStatusEnum.TOKEN_ERROR);
        }

        return chain.filter(exchange);
    }

    @Override
    public int getOrder() {
        return 0;
    }


    /**
     * 没有访问权限
     */
    private Mono<Void> noPower(ServerWebExchange exchange, CommonStatusEnum statusEnum) {
        ServerHttpResponse response = exchange.getResponse();
        response.getHeaders().add("Content-Type", "text/plain;charset=UTF-8");

        String error = gson.toJson(ResponseEntity.error(statusEnum));
        DataBuffer buffer = response.bufferFactory().wrap(error.getBytes());
        return response.writeWith(Mono.just(buffer));
    }
}
