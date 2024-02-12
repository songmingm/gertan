package org.kogg.common.enums;

import com.baomidou.mybatisplus.annotation.EnumValue;
import lombok.Getter;

@Getter
public enum GenderEnum implements BaseEnum<Integer>{

    PRIVATE(-1,"保密"),
    MALE(1, "男"),
    FEMALE(0, "女");

    GenderEnum(int key, String value) {
        this.key = key;
        this.value = value;
    }
    @EnumValue//标记数据库存的值是code
    private final int key;
    private final String value;

    @Override
    public Integer getKey() {
        return key;
    }
}
