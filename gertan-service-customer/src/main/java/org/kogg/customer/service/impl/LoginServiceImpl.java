package org.kogg.customer.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.ObjectUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.google.gson.Gson;
import org.kogg.common.configs.CustomException;
import org.kogg.common.convert.CustomerConvert;
import org.kogg.common.enums.IdentityEnum;
import org.kogg.common.models.customer.CustomerEntity;
import org.kogg.common.models.customer.CustomerLoginParam;
import org.kogg.common.models.customer.CustomerRegisterParam;
import org.kogg.common.models.customer.LoginContext;
import org.kogg.common.utils.JwtUtil;
import org.kogg.common.utils.PasswordUtil;
import org.kogg.common.utils.RedisUtil;
import org.kogg.customer.mapper.CustomerMapper;
import org.kogg.customer.service.ILoginService;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Objects;
import java.util.concurrent.TimeUnit;

@Service
public class LoginServiceImpl implements ILoginService {

    private final CustomerMapper customerMapper;

    private final RedisUtil redisUtil;

    private final Gson gson = new Gson();

    private final String key = "customer:login:";

    public LoginServiceImpl(CustomerMapper customerMapper, RedisUtil redisUtil) {
        this.customerMapper = customerMapper;
        this.redisUtil = redisUtil;
    }


    @Override
    public void logout(String email) {
        redisUtil.delete(key + email);
    }

    @Override
    public boolean isRegister(String email) {
        LambdaQueryWrapper<CustomerEntity> wrapper = Wrappers.<CustomerEntity>lambdaQuery();
        Long count = customerMapper.selectCount(wrapper.eq(CustomerEntity::getEmail, email));
        return count > 0;
    }

    /**
     * 登录并记录登录的设备信息和时间
     *
     * @param param param
     * @return access_token
     */
    @Override
    public String loginByPwd(CustomerLoginParam param) {

        LambdaQueryWrapper<CustomerEntity> wrapper = Wrappers.<CustomerEntity>lambdaQuery();
        wrapper.eq(CustomerEntity::getEmail, param.getEmail());
        CustomerEntity loginCustomer = customerMapper.selectOne(wrapper);

        // 判断邮箱是否注册
        if (ObjectUtils.isNull(loginCustomer)) {
            throw new CustomException("邮箱还没有注册");
        }
        if (redisUtil.exists(key + param.getEmail())) {
            throw new CustomException("用户已经登录");
        }
        // 判断用户状态是否封禁
        IdentityEnum identity = loginCustomer.getIdentity();
        if (identity == IdentityEnum.BLOCKED) {
            throw new CustomException("用户状态异常");
        }
        boolean verified = PasswordUtil.verifyPassword(param.getPassword(), loginCustomer.getPassword());
        if (verified) {
            String accessToken = JwtUtil.generatorToken(loginCustomer.getId(), identity.getKey(), "accessToken");
            LoginContext context = LoginContext.builder().token(accessToken)
                    .id(loginCustomer.getId())
                    .identity(loginCustomer.getIdentity())
                    .email(loginCustomer.getEmail())
                    .userName(loginCustomer.getUserName())
                    .loginTime(LocalDateTime.now())
                    .build();
            context.setToken(accessToken);
            redisUtil.set(key + param.getEmail(), gson.toJson(context), 24, TimeUnit.HOURS);
            return accessToken;
        } else {
            return null;
        }
    }

    @Override
    public boolean register(CustomerRegisterParam param) {
        if (!Objects.equals(param.getPassword(), param.getConfirmPassword())) {
            return false;
        }
        CustomerEntity customerEntity = CustomerConvert.INSTANCE.dtoToEntity(param);
        // 密码密文存储
        String hashPassword = PasswordUtil.hashPassword(customerEntity.getPassword());
        customerEntity.setPassword(hashPassword);
        int row = customerMapper.insert(customerEntity);
        return row > 0;
    }
}
