package org.ysu.ylj.controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@Controller
@RequestMapping("login")
public class loginController {
    @RequestMapping("userLogin.do")
    public String login(){
        System.out.println("进入用户登陆控制");
        return "login/userLogin";
    }
}
