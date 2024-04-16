<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    table {
        border-collapse: collapse;
    }
    th, td {
        border: 1px solid black;
    }
</style>
<body>
<h3>고객 목록</h3>
<table>
    <thead>
    <tr>
        <th>#</th>
        <th>customer name</th>
        <th>city</th>
        <th>country</th>
    </tr>
    </thead>
    <tbody>
        <c:forEach items="${customers}" var="customer" varStatus="st">
            <tr>
                <td>${st.count}</td>
                <td>${customer.customerName}</td>
                <td>${customer.city}</td>
                <td>${customer.country}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>
