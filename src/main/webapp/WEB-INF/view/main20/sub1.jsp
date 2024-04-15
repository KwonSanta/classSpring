<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>


    <%-- 텍스트 인풋 --%>
<div><input type="text"></div>

    <%-- 수 입력 --%>
<div><input type="number"></div>

    <%-- 날짜 입력 --%>
<div><input type="date"></div>

    <%--날짜,시간 입력--%>
<div><input type="datetime-local"></div>

    <%--파일 입력--%>
<div><input type="file"></div>

    <%--암호입력--%>
<div><input type="password"></div>

    <%--radio button--%>
<div>
    <div>
        <input type="radio" name="food"> 바나나
    </div>
    <div>
        <input type="radio" name="food"> 커피
    </div>
    <div>
        <input type="radio" name="food"> 피자
    </div>
</div>

<%--div>div*3>input[type=checkbox][name=food]>lorem1--%>
<%--checkbox--%>
<div>
    <div>
        <input type="checkbox" name="food">
        Lorem.
    </div>
    <div>
        <input type="checkbox" name="food">
        Laborum.
    </div>
    <div>
        <input type="checkbox" name="food">
        Illum.
    </div>
</div>




</body>
</html>
