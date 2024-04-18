package com.study.controller;

import com.study.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;

@Controller
@RequestMapping("main26")
public class Controller26 {

    @Autowired
    private DataSource dataSource;

    @GetMapping("sub1")
    public String method1(String start, String end, Model model) throws SQLException {

        // todo : 메소드 작성
        //        between 활용
        var list = new ArrayList<MyBean261Orders>();
        String sql = """
                SELECT *
                FROM Orders
                WHERE OrderDate BETWEEN ? AND ?
                """;
        Connection conn = dataSource.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, start);
        ps.setString(2, end);
        ResultSet rs = ps.executeQuery();

        try (conn; ps; rs) {
            while (rs.next()) {
                MyBean261Orders obj = new MyBean261Orders(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getInt(5));
                list.add(obj);
            }
        }
        model.addAttribute("orderList", list);
        model.addAttribute("prevStart", start);
        model.addAttribute("prevEnd", end);

        return "main26/sub1OrderList";
    }

    @GetMapping("sub2")
    public String method2(String[] country, Model model) throws Exception {
        Connection conn = dataSource.getConnection();
        if (country != null && country.length > 0) {
            String questionMarks = "";
            for (int i = 0; i < country.length; i++) {
                questionMarks = questionMarks + "?";
                if (i != country.length - 1) {
                    questionMarks = questionMarks + ",";
                }
            }
            String customerSql = STR."""
                SELECT *
                FROM Customers
                WHERE Country IN (\{questionMarks})
                """;
            var customerList = new ArrayList<MyBean254Customer>();
            PreparedStatement pstmt = conn.prepareStatement(customerSql);
            for (int i = 0; i < country.length; i++) {
                pstmt.setString((i + 1), country[i]);
            }
            ResultSet resultSet = pstmt.executeQuery();
            try (pstmt; resultSet) {
                while (resultSet.next()) {
                    MyBean254Customer data = new MyBean254Customer();
                    data.setId(resultSet.getInt(1));
                    data.setCustomerName(resultSet.getString(2));
                    data.setContactName(resultSet.getString(3));
                    data.setAddress(resultSet.getString(4));
                    data.setCity(resultSet.getString(5));
                    data.setPostalCode(resultSet.getString(6));
                    data.setCountry(resultSet.getString(7));
                    customerList.add(data);
                }
                model.addAttribute("customerList", customerList);
            }
        }
        String sql = """
                SELECT DISTINCT Country
                FROM Customers
                """;
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        var countryList = new ArrayList<String>();
        try (stmt; rs; conn) {
            while (rs.next()) {
                countryList.add(rs.getString(1));
            }
            model.addAttribute("countryList", countryList);
        }
        return "main25/sub4CustomerList";
    }

    @GetMapping("sub3")
    public String method3(@RequestParam(value = "category", required = false) String[] categorySelect,
                          Model model) throws Exception {
        Connection conn = dataSource.getConnection();
        String categorySql = "SELECT * FROM Categories";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(categorySql);
        var categoryList = new ArrayList<MyBean263Category>();
        try (rs; stmt;) {
            while (rs.next()) {
                MyBean263Category myBean263Category = new MyBean263Category();
                myBean263Category.setId(rs.getInt(1));
                myBean263Category.setName(rs.getString(2));
                categoryList.add(myBean263Category);
            }
            model.addAttribute("categoryList", categoryList);
        }

        if (categorySelect != null && categorySelect.length > 0) {
            String questionMarks = "";
            for (int i = 0; i < categorySelect.length; i++) {
                questionMarks = questionMarks + "?";
                if (i != categorySelect.length - 1) {
                    questionMarks = questionMarks + ",";
                }
            }
            // todo : 상품 조회 결과가 카테고리, 가격순으로 조회되도록 코드 수정
            String productSql = STR."""
                    SELECT *
                    FROM Products
                    WHERE CategoryID IN (\{questionMarks})
                    ORDER BY CategoryID, Price
                    """;
            var productList = new ArrayList<MyBean254Products>();
            PreparedStatement pstmt = conn.prepareStatement(productSql);
            for (int i = 0; i < categorySelect.length; i++) {
                pstmt.setString((i + 1), categorySelect[i]);
            }
            ResultSet resultSet = pstmt.executeQuery();
            try (pstmt; resultSet;) {
                while (resultSet.next()) {
                    MyBean254Products data = new MyBean254Products();
                    data.setProductId(resultSet.getInt(1));
                    data.setProductName(resultSet.getString(2));
                    data.setSupplierId(resultSet.getInt(3));
                    data.setCategoryId(resultSet.getInt(4));
                    data.setUnit(resultSet.getString(5));
                    data.setPrice(resultSet.getDouble(6));

                    productList.add(data);
                }
                model.addAttribute("productList", productList);
            }
        }


        return "main25/sub6ProductList";
    }

}
