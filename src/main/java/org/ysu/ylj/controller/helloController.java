package org.ysu.ylj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.ysu.ylj.pojo.Table1;
import org.ysu.ylj.service.Interface.ITestService;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class helloController {
    @Resource
    ITestService testService;

    @RequestMapping("hello.do")
    public  String hello(ModelMap map){
        map.addAttribute("test",1);
        System.out.println("进入Controller");
        List<Table1> table1s=testService.getTables();
        return "index";
    }
}
