package org.kogg.gateway.configs;


import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Nacos配置中心中的配置项
 *
 * @author songming
 */
@Data
@ConfigurationProperties(prefix = "gateway")
@Component
public class NacosConfProperties {

    /**
     * 网关白名单
     */
    private List<String> whiteURL;

    /**
     * 是否开启网关认证服务
     */
    private Boolean whetherEnableAuthentication;
}
