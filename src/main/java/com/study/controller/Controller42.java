package com.study.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

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

    @GetMapping("sub3")
    @ResponseBody
    public Map<String, Object> method3() {
        return Map.of("name", "흥민",
                "age", 22,
                "married", true,
                "info", Map.of("team", "토트넘",
                        "location", "런던"),
                "item", List.of("축구공", "운동화", "유니폼"));
    }

    @GetMapping("sub4")
    @ResponseBody
    public Map<String, Object> method4() {
        return Map.of("name", "model-X",
                "color", "blue",
                "company", "tesla",
                "model", List.of("model-x", "model-3", "model-s"));
    }

}
