package org.kogg.customer.controller;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.kogg.common.models.base.ResponseEntity;
import org.kogg.common.models.customer.CustomerLoginParam;
import org.kogg.common.models.customer.CustomerRegisterParam;
import org.kogg.customer.service.ILoginService;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

@Tag(name = "用户服务")
@RestController("customer")
public class CustomerController {

    private final ILoginService customerService;

    public CustomerController(ILoginService customerService) {
        this.customerService = customerService;
    }

    @Operation(summary = "用户注册")
    @PostMapping("register")
    public ResponseEntity<String> register(@Validated @RequestBody CustomerRegisterParam param) {

        boolean isRegisterFlag = customerService.isRegister(param.getEmail());
        if (isRegisterFlag) {
            return ResponseEntity.error("邮箱已经被注册");
        }

        boolean flag = customerService.register(param);
        return flag ? ResponseEntity.success() : ResponseEntity.error("用户注册失败");
    }

    @Operation(summary = "用户登录")
    @PostMapping("login")
    public ResponseEntity<String> login(@Validated @RequestBody CustomerLoginParam param) {
        String accessToken = customerService.loginByPwd(param);
        // todo 异步记录设备登录信息
        return ResponseEntity.success(accessToken);
    }

    @Operation(summary = "退出登录")
    @PostMapping("logout")
    public ResponseEntity<String> logout(HttpServletRequest request) {
//        customerService.logout();
        return ResponseEntity.success();
    }

}
