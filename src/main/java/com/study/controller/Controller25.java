package com.study.controller;

import com.study.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;

@Controller
@RequestMapping("main25")
public class Controller25 {

    @Autowired
    private DataSource dataSource;

    @GetMapping("sub1")
    public void method1(@RequestParam(value = "name", required = false) String searchName, Model model) throws SQLException {
        var list = new ArrayList<MyBean251>();
        String sql = STR."""
                SELECT *
                FROM Employees
                WHERE LastName = '\{searchName}'
                """;
        Connection conn = dataSource.getConnection();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        try (conn; stmt; rs) {
            while (rs.next()) {
                String id = rs.getString(1);
                String lastName = rs.getString(2);
                String firstName = rs.getString(3);
                String birthDate = rs.getString(4);
                String photo = rs.getString(5);
                String notes = rs.getString(6);

                MyBean251 obj = new MyBean251(id, lastName, firstName, birthDate, photo, notes);
                list.add(obj);
            }
        }
        model.addAttribute("employees", list);
    }

    @GetMapping("sub2")
    public void method2(@RequestParam(value = "name", required = false) String search,
                        Model model) throws SQLException {
        // todo: name 요청 파라미터로와 일치하는 상품명으로 상품(Products) 조회
        //  예) SELECT * FROM Products WHERE ProductName = 'Chais'
        var list = new ArrayList<MyBean252>();
        String sql = STR."""
                SELECT ProductID, ProductName, Unit, Price
                FROM Products
                WHERE ProductName = '\{search}'
                """;
        Connection conn = dataSource.getConnection();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        try (conn; stmt; rs) {
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String unit = rs.getString(3);
                Double price = rs.getDouble(4);

                MyBean252 obj = new MyBean252(id, name, unit, price);
                list.add(obj);
            }
        }
        model.addAttribute("products", list);
    }

    // PreparedStatement 로 바꿔서 실습
    @GetMapping("sub3")
    public void method3(String search, Model model) throws SQLException {
        var list = new ArrayList<MyBean252>();
        String oldsql = STR."""
                SELECT ProductID, ProductName, Unit, Price
                FROM Products
                WHERE ProductName = '\{search}'
                """;
        String sql = """
                SELECT *
                FROM Products
                WHERE ProductName = ?
                """;
        Connection conn = dataSource.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        // 첫번째 파라미터 : 물음표 위치
        // 두번째 파라미터 : 넣을 값
        pstmt.setString(1, search);
        ResultSet rs = pstmt.executeQuery();
        while (rs.next()) {
            MyBean252 row = new MyBean252(rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getDouble(4));
            list.add(row);
        }
        model.addAttribute("products", list);
    }

    // todo: 고객 이름을 입력 받아서 고객 정보 조회
    //      sub4 메소드와 sub4.jsp 작성
    //      예) SELECT * FROM Customers WHERE CustomerName = ?
    @GetMapping("sub4")
    public String method4(String search, Model model) throws SQLException {
        var list = new ArrayList<MyBean253Customer>();
        String sql = """
                SELECT *
                FROM Customers
                WHERE CustomerName = ?
                """;
        Connection conn = dataSource.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, search);
        ResultSet rs = pstmt.executeQuery();
        while (rs.next()) {
            MyBean253Customer obj = new MyBean253Customer(rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getString(5),
                    rs.getString(6),
                    rs.getString(7));
            list.add(obj);
        }
        model.addAttribute("customerList", list);
        model.addAttribute("prevSearch", search);

        return "main25/sub4CustomerList";
    }

    //
    @GetMapping("sub5")
    public String method5(String search, Model model) throws SQLException {
        var list = new ArrayList<MyBean253Customer>();
        String sql = """
                SELECT * FROM Customers
                WHERE CustomerName LIKE ?                
                """;
        String keyword = "%" + search + "%";
        Connection conn = dataSource.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, keyword);
        ResultSet rs = pstmt.executeQuery();

        try (conn; pstmt; rs) {
            while (rs.next()) {
                MyBean253Customer obj = new MyBean253Customer(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7));
                list.add(obj);
            }
        }
        model.addAttribute("customerList", list);
        model.addAttribute("prevSearch", search);

        return "main25/sub4CustomerList";
    }

    // todo: 상품명으로 상품들 조회 메소드 작성
    @GetMapping("sub6")
    public String method6(String search, Model model) throws SQLException {
        var list = new ArrayList<MyBean254Products>();
        String sql = """
                SELECT *
                FROM Products
                WHERE ProductName LIKE ?
                """;
        String keyword = "%" + search + "%";

        Connection conn = dataSource.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, keyword);
        ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {

        }
        model.addAttribute("productList", list);
        model.addAttribute("prevSearch", search);

        return "main25/sub6Products";
    }

    // 조회 문자열이 contactName 또는 customerName 에 포함된 고객들 조회
    @GetMapping("sub7")
    public String method7(String search, Model model) throws SQLException {
        var list = new ArrayList<MyBean253Customer>();
        String sql = """
                SELECT *
                FROM Customers
                WHERE CustomerName LIKE ?
                   OR ContactName LIKE ?
                """;
        String keyword = "%" + search + "%";
        Connection conn = dataSource.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, keyword);
        pstmt.setString(2, keyword);
        ResultSet rs = pstmt.executeQuery();
        try (conn; pstmt; rs) {
            while (rs.next()) {
                MyBean253Customer obj = new MyBean253Customer(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7));
                list.add(obj);
            }
            model.addAttribute("customerList", list);

        }
        return "main25/sub4CustomerList";
    }

    // todo: 조회 문자열이 last name 또는 first name 에 포함 된 직원들 조회 메소드 작성
    @GetMapping("sub8")
    public String method8(String search, Model model) throws SQLException {
        var list = new ArrayList<MyBean258Employees>();
        String sql = """
                SELECT *
                FROM Employees
                WHERE lastName LIKE ?
                   OR firstName LIKE ?
                """;
        String keyword = "%" + search + "%";
        Connection conn = dataSource.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, keyword);
        pstmt.setString(2, keyword);
        ResultSet rs = pstmt.executeQuery();

        try (conn; pstmt; rs) {
            while (rs.next()) {
                MyBean258Employees obj = new MyBean258Employees(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6));
                list.add(obj);
            }
        }
        model.addAttribute("employeeList", list);
        model.addAttribute("prevSearch", search);

        return "main25/sub8Employees";
    }
}
