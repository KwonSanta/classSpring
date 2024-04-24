package com.study.controller;

import com.study.domain.MyBean254Customer;
import com.study.domain.MyBean258Employee;
import com.study.domain.MyBean333;
import com.study.mapper.Mapper02;
import com.study.mapper.Mapper03;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("main32")
public class Controller32 {

    private final Mapper03 mapper;
    private final Mapper02 mapper02;

    @GetMapping("sub1")
    public void method1() {
        int rowCount = mapper.deleteOneCustomer();
        System.out.println(rowCount + "명의 고객 삭제됨");
    }

    // /main32/sub2?cid=5
    @RequestMapping("sub2")
    public void method2(Integer cid) {
        int rowCount = mapper.deleteOneCustomerById(cid);
        System.out.println(rowCount + "명의 고객 삭제됨");
    }

    // todo :
    //    /main32/sub3?eid=2
    //    2번 직원 삭제하는 메소드와 mapper에 메소드 작성하기
    @RequestMapping("sub3")
    public void method3(Integer eid) {
        int rowCount = mapper.deleteOneCustomerById(eid);
        System.out.println(rowCount + "명의 고객 삭제됨");
    }

    // /main32/sub4?name=흥민&contactName=캡틴&city=런던&country=한국&address=토트넘
    @GetMapping("sub4")
    public void method4(MyBean254Customer customer) {
        int i = mapper.insertCustomer(customer);
    }


    // todo : 직원 입력 코드 작성해보기 [전체 코드]
    @GetMapping("sub5")
    public void method5() {
        // form 이 있는 view 포워딩
    }

    @PostMapping("sub5")
    public String method6(MyBean258Employee employee, RedirectAttributes rttr) {
        int rowCount = mapper.insertEmployee(employee);

        if (rowCount > 0) {
            rttr.addFlashAttribute("message", rowCount + "명 직원이 입력 되었습니다.");
        } else {
            rttr.addFlashAttribute("message", "입력되지 않았습니다.");
        }
        return "redirect:/main32/sub5";
    }

    // 조회 후 업데이트 (안바뀐것도 업데이트)
    @GetMapping("sub6")
    public void method6(@RequestParam(value = "id", required = false) Integer eid,
                        Model model) {
        if (eid != null) {
            MyBean258Employee e = mapper02.selectOneEmployee2(eid);
            model.addAttribute("employee", e);
        }
    }

    @PostMapping("sub6/update")
    public String method7(MyBean258Employee employee, RedirectAttributes rttr) {
        int i = mapper.updateEmployee(employee);

        if (i > 0) {
            rttr.addFlashAttribute("message", i + "명 직원이 수정되었습니다");
        } else {
            rttr.addFlashAttribute("message", "입력되지 않았습니다.");
        }

        rttr.addAttribute("id", employee.getId());
        return "redirect:/main32/sub6";
    }

    // todo : 고객 조회 후 수정
    // /main32/sub7
    // /main32/sub7?id=3
    @GetMapping("sub7")
    public void method8(Integer id, Model model) {

        if (id != null) {
            // todo : 조회하기
            MyBean254Customer c = mapper02.selectOneCustomer4(id);
            model.addAttribute("customer", c);
        }
    }

    @PostMapping("sub7/update")
    public String method9(MyBean254Customer customer, RedirectAttributes rttr) {

        mapper.updateCustomer(customer);
        rttr.addAttribute("id", customer.getId());
        rttr.addAttribute("name", customer.getCustomerName());
//        rttr.addFlashAttribute("id", customer.getId());
//        rttr.addFlashAttribute("name", customer.getCustomerName());
        return "redirect:/main32/sub7";
    }
}
