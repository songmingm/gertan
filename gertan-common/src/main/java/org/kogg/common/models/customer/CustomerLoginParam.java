package org.kogg.common.models.customer;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

@Schema(description = "用户登录")
@Data
public class CustomerLoginParam {

    @Schema(description = "邮箱", nullable = true, example = "john@example.com")
    @Email(message = "请输入有效的邮箱地址")
    @NotBlank(message = "邮箱不能为空")
    private String email;

    @Schema(description = "密码",nullable = true)
    @NotBlank(message = "密码不能为空")
    private String password;

}
