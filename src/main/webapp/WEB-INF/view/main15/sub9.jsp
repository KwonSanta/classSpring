<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%-- el 의 내장 객체 param : request parameter 를 key, value 쌍으로 저장한 Map--%>
<div>name : ${param.name}</div> <%-- $param["name]--%>
<div>age : ${param.age}</div> <%-- $param["age]--%>
<div>city : ${param.city}</div>  <%-- $param["city]--%>
<div>address : ${param.address}</div> <%-- $param["address]--%>
<div>model : ${param.model}</div> <%-- $param["model]--%>

<hr>
<%-- 요청 주소에 적절한 query string 작성 --%>
<div>title : ${param.title}</div>
<div>content : ${param.content}</div>
<div>car : ${param.car}</div>

<hr>
<%-- ?q=bts&song=dynamite&company=하이브 --%>
<div>${param.q}</div>
<div>${param.song}</div>
<div>${param.company}</div>
</body>
</html>
