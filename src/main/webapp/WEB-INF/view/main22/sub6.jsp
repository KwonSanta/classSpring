<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
    <c:if test="${param.condi eq 'fail'}">
        로그인에 실패하였습니다.
    </c:if>
</div>
<form action="/main22/sub7" method="post">
    <div>
        ID
        <input type="text" name="id">
    </div>
    <div>
        PW
        <input type="text" name="password">
    </div>
    <div>
        <input type="submit" value="로그인">
    </div>
</form>
</body>
</html>
