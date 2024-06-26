package com.study.mapper;

import com.study.domain.MyBean254Customer;
import com.study.domain.MyBean254Products;
import com.study.domain.MyBean258Employee;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.ArrayList;
import java.util.List;

@Mapper
public interface Mapper02 {

    @Select("SELECT NOW()")
    String selectNow();

    // 조회 결과의 컬럼명과
    // 리턴 타입의 객체 프로퍼티명이 같으면
    // 값을 바인딩 해줌
    @Select("""
            SELECT ContactName, Address, City, Country
            FROM Customers
            WHERE CustomerID = 1
            """)
    // interface 는 public 이니깐 자동 생략
    MyBean254Customer selectOneCustomer();

    @Select("""
            SELECT *
            FROM Customers
            WHERE CustomerID = 1
            """)
    MyBean254Customer selectOneCustomer2();

    @Select("""
            SELECT CustomerID id,
                   CustomerName,
                   ContactName,
                   Address,
                   City,
                   Country,
                   PostalCode
            FROM Customers
            WHERE CustomerID = #{id}
            """)
    MyBean254Customer selectOneCustomer3();

    @Select("""
            SELECT EmployeeID id,
                   LastName,
                   FirstName,
                   BirthDate,
                   Photo,
                   Notes
            FROM Employees
            WHERE EmployeeID = 2
            """)
    MyBean258Employee selectOneEmployee1();

    @Select("""
            SELECT EmployeeID id,
                   LastName,
                   FirstName,
                   BirthDate,
                   Photo,
                   Notes
            FROM Employees
            WHERE EmployeeID = #{id}
            """)
    MyBean258Employee selectOneEmployee2(Integer id);

    @Select("""
            SELECT CustomerID id,
                   CustomerName,
                   ContactName,
                   Address,
                   City,
                   Country,
                   PostalCode
            FROM Customers
            WHERE CustomerID = #{id}
            """)
    MyBean254Customer selectOneCustomer4(Integer id);

    @Select("""
            SELECT CustomerID id,
                   CustomerName,
                   ContactName,
                   Address,
                   City,
                   Country,
                   PostalCode            
            FROM Customers
            """)
    List<MyBean254Customer> selectAllCustomer1();

    @Select("""
            SELECT EmployeeID id,
                   LastName,
                   FirstName,
                   BirthDate,
                   Photo,
                   Notes
            FROM Employees
            ORDER BY BirthDate DESC
            """)
    List<MyBean258Employee> selectAllEmployee1();

    @Select("""
            SELECT CustomerID id,
                   CustomerName,
                   ContactName,
                   Address,
                   City,
                   Country,
                   PostalCode         
            FROM   Customers
            WHERE  Country = #{country1}
            OR     Country = #{country2}
            ORDER BY Country
            """)
    List<MyBean254Customer> selectCustomersByCountry(String country1, String country2);

    @Select("""
            SELECT *
            FROM Products
            WHERE Price BETWEEN #{from} AND #{to}
            ORDER BY Price
            """)
    List<MyBean254Products> selectMinMaxProducts(Double from, Double to);
}