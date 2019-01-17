package org.ysu.ylj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class helloController {
    @RequestMapping("hello.do")
    public  String hello(ModelMap map){
        map.addAttribute("test",1);
        System.out.println("进入Controller");
        return "index";
    }
}
