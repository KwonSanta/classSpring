package com.study.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping()
public class Controller40 {

    @RequestMapping("/api/someurl")
    public void method1() {
        System.out.println("Controller40.method1");
    }

    @PostMapping("/api/someurl")
    public void method2() {
        System.out.println("Controller40.method2");
    }

    // todo : get, post  /api/someurl2
    //        요청 처리 메소드 작성
    @RequestMapping("/api/someurl2")
    public void method3() {
        System.out.println("Controller40.method3");
    }

    @PostMapping("/api/someurl2")
    public void method4() {
        System.out.println("Controller40.method4");
    }
}
