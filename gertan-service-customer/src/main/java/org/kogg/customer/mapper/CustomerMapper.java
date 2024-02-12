package org.kogg.customer.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.kogg.common.models.customer.CustomerEntity;

@Mapper
public interface CustomerMapper extends BaseMapper<CustomerEntity> {
}
