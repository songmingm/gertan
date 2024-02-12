package org.kogg.common.configs;

import org.kogg.common.enums.CommonStatusEnum;
import org.kogg.common.models.base.ResponseEntity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * 全局异常处理器
 *
 * @author songming
 */
@RestControllerAdvice
public class GlobalExceptionHandler {

    private static final Logger LOGGER = LoggerFactory.getLogger(GlobalExceptionHandler.class);

    /**
     * 参数校验异常捕获，只会返回一个错误信息
     */
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<String> paramExceptionHandler(MethodArgumentNotValidException ex) {
        BindingResult bindingResult = ex.getBindingResult();
        if (bindingResult.hasErrors()) {
            FieldError firstError = bindingResult.getFieldErrors().get(0);
            String fieldName = firstError.getField();
            String errorMessage = firstError.getDefaultMessage();
            LOGGER.error("Params Exception：{}：{}", fieldName, ex.getMessage());
            return ResponseEntity.error(fieldName + ": " + errorMessage);
        }
        // 没有参数错误信息，返回内部错误
        return ResponseEntity.error(CommonStatusEnum.INTERNAL_SERVER_ERROR);
    }

    @ExceptionHandler(Exception.class)
    public ResponseEntity<String> exceptionHandler(Exception e) {
        LOGGER.error("Exception: {}", e.getMessage());
        return ResponseEntity.error(CommonStatusEnum.INTERNAL_SERVER_ERROR);
    }


    /**
     * 自定义业务异常
     */
    @ExceptionHandler(CustomException.class)
    public ResponseEntity<String> customerExceptionHandler(CustomException e){
        return ResponseEntity.error(e.getMessage());
    }

}
