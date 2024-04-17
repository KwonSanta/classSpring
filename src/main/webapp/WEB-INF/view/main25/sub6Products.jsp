<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    table, th ,td {
        border-collapse: collapse;
        border: 1px solid black;
    }
</style>
<body>
<h3>상품 목록</h3>
<form>
    이름
    <input value="${prevSearch}" size="50" type="text" placeholder="조회할 상품의 이름을 입력하세요." name="search">
    <%-- form 내의 button 요소는 submit 버튼 역할을 함 --%>
    <button>조회</button>
<%--    <input type="submit" value="조회">--%>
</form>
<hr>
<c:if test="${empty productList}" var="emptyProducts">
    <p>조회 된 상품이 없습니다.</p>
</c:if>
<c:if test="${not emptyProducts}">
    <table>
        <thead>
        <tr>
            <th>ProductID</th>
            <th>ProductName</th>
            <th>SupplierID</th>
            <th>CategoryID</th>
            <th>Unit</th>
            <th>Price</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${productList}" var="customer">
            <tr>
                <td>${customer.productId}</td>
                <td>${customer.productName}</td>
                <td>${customer.supplierId}</td>
                <td>${customer.categoryId}</td>
                <td>${customer.unit}</td>
                <td>${customer.price}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>

</body>
</html>
