package org.kogg.common.utils;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * token工具
 *
 * @author songming
 */
public class JwtUtil {

    /**
     * 盐
     */
    private final static String SECRET = "gertan";

    /**
     * 用户身份，1:普通用户，2:超级vip
     */
    public static final String IDENTITY = "identity";

    /**
     * 令牌类型，accessToken，refreshToken
     */
    public static final String JWT_TOKEN_TYPE = "tokenType";

    /**
     * 失效时间 24h
     */
    private static final long EXPIRATION_TIME = 86400000L;


    /**
     * 生成token
     *
     * @param identity  身份
     * @param tokenType 令牌类型
     * @return token
     */
    public static String generatorToken(Long id, Integer identity, String tokenType) {
        Map<String, Object> claims = new HashMap<>();
        claims.put("ID", id);
        claims.put(IDENTITY, identity);
        claims.put(JWT_TOKEN_TYPE, tokenType);
        return Jwts.builder()
                .signWith(SignatureAlgorithm.HS512, SECRET)
                .setClaims(claims)
                .setExpiration(new Date(System.currentTimeMillis() + EXPIRATION_TIME))
                .compact();
    }

    /**
     * 校验token
     *
     * @param token token
     * @return 是否合法
     */
    public static boolean validateToken(String token) {
        try {
            Claims claims = parseToken(token);
            return !claims.getExpiration().before(new Date());
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * 解析令牌信息
     *
     * @param token token令牌
     * @return claims载体
     */
    public static Claims parseToken(String token) {
        return Jwts.parser()
                .setSigningKey(SECRET)
                .parseClaimsJws(token)
                .getBody();
    }
}
