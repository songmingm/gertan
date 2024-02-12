package org.kogg.common.models.customer;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

@TableName("customer_device_relation")
@Data
public class CustomerDeviceRelationEntity {

    /**
     * Customer的ID
     */
    private Long customerId;

    /**
     * Device的ID
     */
    private Long deviceId;

    /**
     * 关系表记录的创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;
}
