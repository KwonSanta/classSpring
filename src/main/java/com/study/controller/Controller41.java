package com.study.controller;

import com.study.domain.MyBean142;
import com.study.domain.MyBean411;
import com.study.domain.MyBean412;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
@RequestMapping("/api/main41")
public class Controller41 {

    @PostMapping("sub1")
    public void sub1(@RequestBody Map<String, Object> map) {
        // @RequestBody
        // 역직렬화(parsing, decoding) : JSON -> Map
        System.out.println("map = " + map);
    }
    
    @PostMapping("sub2")
    public void sub2(@RequestBody Map<String, Object> data) {
        System.out.println("data = " + data);
    }

    @PostMapping("sub3")
    public void sub3(@RequestBody Map<String, Object> map) {
        System.out.println("map = " + map);
    }

    @PostMapping("sub4")
    public void sub4(@RequestBody Map<String, Object> data) {
        System.out.println("data = " + data);
    }

    @PostMapping("sub5")
    public void sub5(@RequestBody Map<String, Object> data) {
        System.out.println("data = " + data);
        Object name = data.get("name");
        System.out.println("name.getClass() = " + name.getClass());

        Object age = data.get("age");
        System.out.println("age.getClass() = " + age.getClass());

        Object item = data.get("item");
        System.out.println("item.getClass() = " + item.getClass());

        Object married = data.get("married");
        System.out.println("married.getClass() = " + married.getClass());

        Object team = data.get("team");
        System.out.println("team.getClass() = " + team.getClass());

    }

    @PostMapping("sub6")
    public void sub6(@RequestBody MyBean411 myBean411) {
        System.out.println("myBean411 = " + myBean411);
    }

    @PostMapping("sub7")
    public void sub7(@RequestBody MyBean412 myBean412) {
        System.out.println("myBean412 = " + myBean412);
    }
}
