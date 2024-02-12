package org.kogg.common.models.base;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;
import org.kogg.common.enums.CommonStatusEnum;

@Accessors(chain = true)
@Data
@Schema(description = "响应信息")
public class ResponseEntity<T> {

    @Schema(description = "状态码")
    private int status;

    @Schema(description = "响应信息")
    private String message;

    @Schema(description = "响应数据")
    private T data;

    @Schema(description = "时间戳")
    private long timestamp;


    /**
     * 成功响应的方法
     */
    public static <T> ResponseEntity<T> success() {
        return new ResponseEntity<T>()
                .setStatus(CommonStatusEnum.SUCCESS.getCode())
                .setMessage(CommonStatusEnum.SUCCESS.getValue())
                .setTimestamp(System.currentTimeMillis());
    }

    public static <T> ResponseEntity<T> success(T data) {
        return new ResponseEntity<T>()
                .setStatus(CommonStatusEnum.SUCCESS.getCode())
                .setMessage(CommonStatusEnum.SUCCESS.getValue())
                .setData(data)
                .setTimestamp(System.currentTimeMillis());
    }

    /**
     * 失败：统一的失败
     */
    public static <T> ResponseEntity<T> error(String message) {
        return new ResponseEntity<T>()
                .setStatus(CommonStatusEnum.ERROR.getCode())
                .setMessage(message)
                .setTimestamp(System.currentTimeMillis());
    }

    /**
     * 失败：自定义失败 错误码和提示信息
     */
    public static <T> ResponseEntity<T> error(int code, String message) {
        return new ResponseEntity<T>()
                .setStatus(code)
                .setMessage(message)
                .setTimestamp(System.currentTimeMillis());
    }

    public static <T> ResponseEntity<T> error(CommonStatusEnum commonStatusEnum) {
        return new ResponseEntity<T>()
                .setStatus(commonStatusEnum.getCode())
                .setMessage(commonStatusEnum.getValue())
                .setTimestamp(System.currentTimeMillis());
    }

}