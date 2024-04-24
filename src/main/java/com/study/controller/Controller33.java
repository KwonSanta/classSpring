package com.study.controller;

import com.study.domain.MyBean331;
import com.study.domain.MyBean332;
import com.study.domain.MyBean333;
import com.study.mapper.Mapper04;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequestMapping("main33")
@RequiredArgsConstructor
public class Controller33 {

    private final Mapper04 mapper;

    @GetMapping("sub1")
    public void method1() {
        List<MyBean331> obj = mapper.select1();
        obj.forEach(System.out::println);
    }

    @GetMapping("sub2")
    public void method2() {
        List<MyBean332> obj = mapper.select2();
        obj.forEach(System.out::println);
    }

    // todo : 세번째 메소드 작성
    //      mapper.select3() 호출한 결과 출력
    //      List<MyBean333> 타입으로 받아서 출력
    //      SELECT * FROM my_table10
    @GetMapping("sub3")
    public void method3() {
        List<MyBean333> obj = mapper.select3();
        obj.forEach(System.out::println);
    }

    @GetMapping("sub4")
    public void method4() {
        mapper.insert1("hello world", "54321", "876.54", "2024-01-01", "2024-02-02 14:14:14");
    }

    @GetMapping("sub5")
    public void method5() {
        String strVal = "hello mybatis";
        Integer intVal = 7890;
        Double doubleVal = 3.14;
        LocalDate dataVal = LocalDate.parse("1988-01-08");
        LocalDateTime dateTimeVal = LocalDateTime.parse("1977-07-07T12:14:14");
        mapper.insert2(strVal, intVal, doubleVal, dataVal, dateTimeVal);
    }

    // todo : 6번 메소드 만들어서
    //      my_table10 에 레코드 추가하기
    @GetMapping("sub6")
    public void method6() {
        String title = "테스트_제목";
        String name = "이름";
        Integer age = 20;
        Double price = 30.14;
        LocalDate published = LocalDate.parse("1991-02-05");
        LocalDateTime inserted = LocalDateTime.parse("1992-02-05T12:34:56");
        mapper.insert3(title, name, age, price, published, inserted);
    }

    @GetMapping("sub7")
    public void method7() {
        MyBean332 obj = new MyBean332();
        obj.setStringCol("hello \uD83D\uDD25");
        obj.setIntCol(7890);
        obj.setDateCol(LocalDate.parse("2020-09-09"));
        obj.setDateTimeCol(LocalDateTime.parse("2020-09-09T13:13:13"));
        obj.setDecCol(99.78);

        mapper.insert4(obj);
    }

    // todo : 8번째 메소드 작성
    //  my_table10 에 레코드 추가하기
    //  MyBean333 활용
    @GetMapping("sub8")
    public void method8() {
        MyBean333 obj = new MyBean333();
        obj.setAge(10);
        obj.setTitle("제목");
        obj.setName("이름");
        obj.setPrice(30000.00);
        obj.setPublished(LocalDate.parse("1919-09-09"));
        obj.setInserted(LocalDateTime.parse("2024-01-02T12:34:56"));

        int i = mapper.insert5(obj);
        System.out.println("i = " + i + "명이 추가 되었습니다.");
        System.out.println(obj.toString());
    }

    @GetMapping("sub9")
    public void select9(Model model) {
        List<MyBean332> list = mapper.select2();
        model.addAttribute("datas", list);
    }

    @PostMapping("sub9")
    public String insert9(String str,
                          String intVal,
                          String realVal,
                          String dateVal,
                          String dateTimeVal) {
        mapper.insert1(str, intVal, realVal, dateVal, dateTimeVal);

        return "redirect:/main33/sub9";
    }

    // sub10 : sub9 파라미터들의 타입까지 맞춰서 주고 받기
    @GetMapping("sub10")
    public String select10(Model model) {
        List<MyBean332> list = mapper.select2();
        model.addAttribute("datas", list);

        return "/main33/sub9";
    }

    @PostMapping("sub10")
    public String insert10(String str,
                           Integer intVal,
                           Double realVal,
                           LocalDate dateVal,
                           LocalDateTime dateTimeVal) {
        mapper.insert2(str, intVal, realVal, dateVal, dateTimeVal);
        return "redirect:/main33/sub10";
    }

    @GetMapping("sub11")
    public String select11(Model model) {
        List<MyBean332> list = mapper.select2();
        model.addAttribute("datas", list);


        return "/main33/sub11";
    }

    @PostMapping("sub11")
    public String insert11(MyBean332 data) {
        System.out.println("data = " + data);
        mapper.insert4(data);
        return "redirect:/main33/sub11";
    }

    // todo : 아래 두 개의 메소드를 잘 수정해서
    //      my_table10 레코드를 조회 및 입력 로직 완성
    @GetMapping("sub12")
    public String select12(Model model) {
        List<MyBean333> obj =  mapper.select3();
        model.addAttribute("datas", obj);

        return "/main33/sub12";
    }

    @PostMapping("sub12")
    public String insert12(MyBean333 data) {
        mapper.insert5(data);
        return "redirect:/main33/sub12";
    }
}
