package org.kogg.common.enums;

import lombok.Getter;

/**
 * 通用返回体信息常量
 */
@Getter
public enum CommonStatusEnum {

    SUCCESS(1000, "Success"),
    ERROR(-999, "Error"),
    INTERNAL_SERVER_ERROR(-998, "Internal Server Error"),
    PARAM_ERROR(1007,"参数校验异常"),
    CAPTCHA_ERROR(1099, "验证码不正确"),
    TOKEN_NULL(1100, "未查询到认证信息"),
    TOKEN_ERROR(1199, "令牌不合法"),
    USER_NOT_EXISTS(1200, "当前用户不存在"),
    CONNECT_FAIL(1801, "请勿重复建立连接");

    private final int code;
    private final String value;

    CommonStatusEnum(int code, String value) {
        this.code = code;
        this.value = value;
    }
}
