<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
    <style>
        table, tr, th, td {
            border-collapse: collapse;
            border: 1px solid black;
        }
    </style>
</head>

<body>
<h3>테이블 내용 추가</h3>
<form action="" method="post">
    <div>
        Title
        <input type="text" name="title" value="홍길동전(기본값)">
    </div>
    <div>
        Name
        <input type="text" name="name" value="홍길동(기본값)">
    </div>
    <div>
        Age
        <input type="number" name="age" value="20">
    </div>
    <div>
        Price
        <input type="number" name="price" value="300" step="0.1">
    </div>
    <div>
        Published
        <input type="date" name="published" value="2024-04-24">
    </div>
    <div>
        Inserted
        <input type="datetime-local" name="inserted" value="2024-04-24T16:13:33">
    </div>
    <div>
        <input type="submit" value="추가">
    </div>
</form>
<hr>
<h3>my_table10 조회</h3>
<table>
    <thead>
    <tr>
        <th>title</th>
        <th>name</th>
        <th>age</th>
        <th>price</th>
        <th>published</th>
        <th>inserted</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${datas}" var="data">
        <tr>
            <td>${data.title}</td>
            <td>${data.name}</td>
            <td>${data.age}</td>
            <td>${data.price}</td>
            <td>${data.published}</td>
            <td>${data.inserted}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
