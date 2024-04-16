<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${not empty message}">
    <div style="padding: 20px; background-color: lightgreen">
        ${message}
    </div>
</c:if>
<h1>Lorem ipsum dolor.</h1>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ex molestiae nam sunt tempore voluptatum. Deserunt
    distinctio ex obcaecati quisquam? Cumque doloribus ipsa ipsum laborum minima pariatur quo sint sunt tenetur?
</p>
</body>
</html>
