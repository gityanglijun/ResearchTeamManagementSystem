package org.ysu.ylj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("register")
public class registerController {
    @RequestMapping("userRegister.do")
    public String Register(){
        System.out.println("进入用户注册控制");
        return "register/userRegister";
    }
}
