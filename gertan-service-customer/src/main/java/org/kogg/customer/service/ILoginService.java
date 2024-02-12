package org.kogg.customer.service;

import org.kogg.common.models.customer.CustomerLoginParam;
import org.kogg.common.models.customer.CustomerRegisterParam;

public interface ILoginService {

    void logout(String email);

    boolean isRegister(String email);

    String loginByPwd(CustomerLoginParam param);

    boolean register(CustomerRegisterParam param);
}
