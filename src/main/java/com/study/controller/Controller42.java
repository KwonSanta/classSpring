package com.study.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/api/main42")
public class Controller42 {

    @GetMapping("sub1")
    @ResponseBody // 이게 없으면 view 로 해석함
    public String method1() {
        return "어떤 데이터";
    }

    @GetMapping("sub2")
    @ResponseBody
    public String method2() {
        return "이강인";
    }
}
