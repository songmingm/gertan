package org.kogg.common.models.customer;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import java.time.LocalDateTime;

@Data
@Schema(description = "用户注册")
public class CustomerRegisterParam {

    @Schema(description = "邮箱", nullable = true, example = "john@example.com")
    @Email(message = "请输入有效的邮箱地址")
    @NotBlank(message = "邮箱不能为空")
    private String email;

    @Schema(description = "用户名", nullable = true)
    private String userName;

    @Schema(description = "性别")
    private Integer gender;

    @Schema(description = "密码",nullable = true)
    @NotBlank(message = "密码不能为空")
    private String password;

    @Schema(description = "确认密码",nullable = true)
    @NotBlank(message = "确认密码不能为空")
    private String confirmPassword;

    @Schema(description = "出生日期")
    private LocalDateTime birthday;
}
