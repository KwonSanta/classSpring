<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:import url="/WEB-INF/fragment/navbar5.jsp">
    <c:param name="current" value="keyboard"/>
</c:import>
<h3>키보드</h3>
<p>키보드 설명</p>
<form action="">
    <input type="text" name="product" value="키보드" readonly/>
    <input type="number" value="1" min="1" max="10" name="quantity"/>
    <button>장바구니 추가</button>
</form>
</body>
</html>