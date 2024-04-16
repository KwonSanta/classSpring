package com.study.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

@Controller
@RequestMapping("main23")
public class Controller23 {

    @RequestMapping("sub1")
    public void method1(Model model) throws Exception {
        var list = new ArrayList<String>();

        // 요청 파라미터 분석/가공
        // 비즈니스 로직 실행
        String sql = """
                SELECT FirstName FROM Employees
                """;
        // todo: JDBC 동작 방식
        // todo: 1. db와 연결
        String url = "jdbc:mariadb://localhost:3306/w3schools";
        String user = "root";
        String password = "1234";
        Connection con = DriverManager.getConnection(url, user, password); // java.sql import
        // todo: 2. 실행 준비
        Statement statement = con.createStatement();
        // todo: 3. 쿼리 실행
        /*   🔥🔥🔥
             query 날려서 나온결과를 ResultSet 이 가지게 됨
             내부적으로 cursor 를 가짐 : 현재 행을 가르키는 cursor
             first cursor 는 첫번째 행의 이전을 가르킴
             next : cursor 를 다음 줄로 옮기는 메소드
             더이상 가르키는 행이 없을 때 false 리턴
        */
        ResultSet resultSet = statement.executeQuery(sql);
        // todo: 5. 자원 닫기
        try (resultSet; statement; con){
            // todo: 4. 결과 가공
            while (resultSet.next()) {              // 각 행을 탐색
                String name = resultSet.getString(1); // 첫번째 column 값 얻기
                list.add(name);
            }
        }

        // todo: 모델에 결과 넣고
        model.addAttribute("nameList", list);

        // todo: view 로 포워딩
    }
}
