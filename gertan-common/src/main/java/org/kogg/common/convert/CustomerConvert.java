package org.kogg.common.convert;

import org.kogg.common.enums.BaseEnum;
import org.kogg.common.enums.GenderEnum;
import org.kogg.common.enums.IdentityEnum;
import org.kogg.common.models.customer.CustomerRegisterParam;
import org.kogg.common.models.customer.CustomerEntity;
import org.mapstruct.*;
import org.mapstruct.factory.Mappers;
import org.springframework.util.ObjectUtils;

/**
 * 用户的对象映射转换
 */
@Mapper
public interface CustomerConvert {

    CustomerConvert INSTANCE = Mappers.getMapper(CustomerConvert.class);

    @Mapping(source = "gender", target = "gender", qualifiedByName = "mapGender")
    @Mapping(target = "userName",defaultValue = "我是来自哥谭的小丑~")
    @Mapping(target = "identity", ignore = true)
    CustomerEntity dtoToEntity(CustomerRegisterParam param);

    @Named("mapGender")
    default GenderEnum mapGender(Integer gender) {
        if (ObjectUtils.isEmpty(gender)){
            return GenderEnum.PRIVATE;
        }
        return BaseEnum.getByKey(gender, GenderEnum.class);
    }

    /**
     * 这段代码是当source中没有target的属性但是需要填充source中的属性
     * 注意⚠️：需要将@Mapper中source的ignore设置true，防止自动映射被填充null
     * @param entity source 对象
     */
    @BeforeMapping
    default void setDefaultValues(@MappingTarget CustomerEntity entity) {
        // 设置默认的身份
        entity.setIdentity(IdentityEnum.COMMON);
    }
}
