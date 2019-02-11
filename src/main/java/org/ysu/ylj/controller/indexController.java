package org.ysu.ylj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("index")
public class indexController {
    @RequestMapping("index.do")
    public String getIndex(){
        return "index/index";
    }
}
