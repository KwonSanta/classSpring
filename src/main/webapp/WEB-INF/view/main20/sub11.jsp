<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form action="/main20/sub12">
    <input type="text" name="type">
    <br>
    <textarea name="content"></textarea>
    <br>
    <select name="city">
        <option value="london">London</option>
        <option value="seoul">Seoul</option>
        <option value="chicago">Chicago</option>
    </select>
    <br>
    <input type="submit">
</form>
<hr>

<%-- radio button --%>
<form action="/main20/sub13">
    <%--div>div*3>input:r[name=city]--%>
        <div>
            <div>
                <input type="radio" name="city" value="seoul">
                서울
            </div>
            <div>
                <input type="radio" name="city" value="london">
                런던
            </div>
            <div>
                <input type="radio" name="city" value="incheon">
                인천
            </div>
            <div>
                <input type="submit">
            </div>
        </div>
</form>
<hr>

<%-- checkbox --%>
<%--form>div*3>input:c[name=foods]--%>
<form action="/main20/sub14">
    <div>
        <input type="checkbox" name="foods" value="pizza">
        피자
    </div>
    <div>
        <input type="checkbox" name="foods" value="noodle">
        국수
    </div>
    <div>
        <input type="checkbox" name="foods" value="burger">
        햄버거
    </div>
    <div>
        <input type="submit">
    </div>
</form>

<%--실습--%>
<form action="/main20/sub15">
    type
    <div>
        <select name="type">
            <option value="type1">type1</option>
            <option value="type2">type2</option>
            <option value="type3">type3</option>
        </select>
    </div>
    <br>
    phone
    <div>
        <div>
            <input type="radio" name="phone" value="iphone">
            iphone
        </div>
        <div>
            <input type="radio" name="phone" value="galaxy">
            galaxy
        </div>
        <div>
            <input type="radio" name="phone" value="google">
            google
        </div>
    </div>
    <br>
    book
    <div>
        <div>
            <input type="checkbox" name="book" value="book1">
            book1
        </div>
        <div>
            <input type="checkbox" name="book" value="book2">
            book2
        </div>
        <div>
            <input type="checkbox" name="book" value="book3">
            book3
        </div>
    </div>
    <div>
        <input type="submit">
    </div>
</form>
</body>
</html>
