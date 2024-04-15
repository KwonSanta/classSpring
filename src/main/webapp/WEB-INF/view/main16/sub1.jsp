<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%-- 파일경로 : /로 시작하지 않으면 상대경로 (현재경로 기준) --%>
<c:import url="navbar1.jsp" />

<%-- 파일경로 : /로 시작하면 절대경로 (기준 : webapp 폴더) --%>
<c:import url="/WEB-INF/view/main16/navbar1.jsp"/>

<c:import url="../../fragment/footer1.jsp"/>
<c:import url="/WEB-INF/fragment/footer1.jsp"/>
</body>
</html>
