package org.kogg.common.enums;

public interface BaseEnum<K> {
    /**
     * 获取枚举 key
     *
     * @return 枚举 key
     */
    K getKey();


    /**
     * 通过枚举 key 获取枚举值
     *
     * @param key 枚举 key
     * @return 枚举值
     */
    static <K, E extends Enum<E> & BaseEnum<K>> E getByKey(K key, Class<E> enumClass) {
        for (E enumValue : enumClass.getEnumConstants()) {
            if (enumValue.getKey().equals(key)) {
                return enumValue;
            }
        }
        return null;
    }

}
