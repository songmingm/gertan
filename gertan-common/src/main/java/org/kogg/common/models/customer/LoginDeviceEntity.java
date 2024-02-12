package org.kogg.common.models.customer;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.kogg.common.models.base.BaseEntity;

@EqualsAndHashCode(callSuper = true)
@Data
@TableName("login_device")
public class LoginDeviceEntity extends BaseEntity {

    /**
     * ip地址
     */
    private String ipAddress;

    /**
     * 浏览器名称和版本号
     */
    private String browser;

    /**
     * 操作系统名称和版本号
     */
    private String operatingSystem;
}
