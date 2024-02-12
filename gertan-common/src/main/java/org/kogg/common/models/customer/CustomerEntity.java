package org.kogg.common.models.customer;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.kogg.common.enums.GenderEnum;
import org.kogg.common.enums.IdentityEnum;
import org.kogg.common.models.base.BaseEntity;

import java.time.LocalDate;

@EqualsAndHashCode(callSuper = true)
@TableName("customer")
@Data
public class CustomerEntity extends BaseEntity {

    /**
     * 用户名
     */
    private String userName;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 密码
     */
    private String password;

    /**
     * 性别
     */
    private GenderEnum gender;

    /**
     * 出生年月
     */
    private LocalDate birthday;

    /**
     * 用户身份
     */
    private IdentityEnum identity;

}
