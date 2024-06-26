package com.study.mapper;

import lombok.Data;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface Mapper05 {

    @Data
    static class EmployeeIncome {
        private Integer employeeId;
        private String lastName;
        private String firstName;
        private Double income;
    }

    @Select("""
            SELECT e.EmployeeId,
                   e.LastName,
                   e.FirstName,
                   SUM(od.Quantity * p.Price) AS income
            FROM Orders o JOIN Employees e ON o.EmployeeId = e.EmployeeId
                          JOIN OrderDetails od ON o.OrderId = od.OrderId
                          JOIN Products p ON od.ProductId = p.ProductId
            WHERE o.OrderDate BETWEEN #{from} AND #{to}
            GROUP BY e.EmployeeId
            ORDER BY income DESC
            """)
    List<EmployeeIncome> selectIncomeList(String from, String to);

    @Data
    public class CustomerPurchaseAmount {
        private Integer id;
        private String name;
        private String address;
        private Double amount;
    }

    @Select("""
            SELECT c.CustomerId               customer_id,
                   c.CustomerName             name,
                   c.Address                  address,
                   SUM(p.Price * od.Quantity) amount
            FROM Orders o 
            JOIN OrderDetails od ON o.OrderId = od.OrderId
            JOIN Products p ON p.ProductId = od.ProductId
            JOIN Customers c ON c.CustomerId = o.CustomerId
            WHERE o.OrderDate BETWEEN #{start} AND #{end}
            GROUP BY c.CustomerId
            ORDER BY amount DESC
            """)
    List<CustomerPurchaseAmount> selectPurchaseList(String start, String end);
}