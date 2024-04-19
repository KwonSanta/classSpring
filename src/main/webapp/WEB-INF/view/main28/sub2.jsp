<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
    <c:if test="${not empty message}">
        <div style="padding: 20px; background-color: skyblue">
                ${message}
        </div>
    </c:if>
</div>
<h3>직원 정보 입력</h3>
<form action="" method="post">
    <div>
        LastName<input type="text" name="lastName">
    </div>
    <div>
        FirstName<input type="text" name="firstName">
    </div>
    <div>
        BirthDate<input type="text" name="birthDate">
    </div>
    <div>
        Photo<input type="text" name="photo">
    </div>
    <div>
        Notes<input type="text" name="notes">
    </div>
    <div>
        <input type="submit" value="등록">
    </div>
</form>
</body>
</html>
