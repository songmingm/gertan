package org.kogg.common.enums;

import com.baomidou.mybatisplus.annotation.EnumValue;
import lombok.Getter;

@Getter
public enum IdentityEnum implements BaseEnum<Integer>{


    COMMON(0,"普通用户"),
    VIP(1, "VIP用户"),
    BLOCKED(-1, "封禁用户");

    IdentityEnum(int key, String value) {
        this.key = key;
        this.value = value;
    }
    @EnumValue//标记数据库存的值是key
    private final int key;
    private final String value;

    @Override
    public Integer getKey() {
        return key;
    }
}
