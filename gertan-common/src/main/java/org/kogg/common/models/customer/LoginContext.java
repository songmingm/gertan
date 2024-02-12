package org.kogg.common.models.customer;

import lombok.Builder;
import lombok.Data;
import org.kogg.common.enums.IdentityEnum;

import java.time.LocalDateTime;

/**
 * 用户成功登录的上下文信息
 *
 * @author songmm
 */
@Data
@Builder
public class LoginContext {

    private String token;

    private Long id;

    private String userName;

    private String email;

    private LocalDateTime loginTime;

    private IdentityEnum identity;

}
