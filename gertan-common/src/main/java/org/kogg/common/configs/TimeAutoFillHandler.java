package org.kogg.common.configs;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.context.annotation.Configuration;

import java.time.LocalDateTime;

/**
 * mybatis-plus 时间自动填充
 */
@Configuration
public class TimeAutoFillHandler implements MetaObjectHandler {

    public static String gmtCreate = "gmtCreate";
    public static String gmtModified = "gmtModified";

    @Override
    public void insertFill(MetaObject metaObject) {
        this.strictInsertFill(metaObject, gmtCreate, LocalDateTime::now, LocalDateTime.class);
        this.strictInsertFill(metaObject, gmtModified, LocalDateTime::now, LocalDateTime.class);
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        this.strictUpdateFill(metaObject, gmtModified, LocalDateTime::now, LocalDateTime.class);
    }
}
