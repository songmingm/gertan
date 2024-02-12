package org.kogg.common.configs;

import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
public class CustomException extends RuntimeException {

    private String message;

    public CustomException(String message) {
        this.message = message;
    }

}
