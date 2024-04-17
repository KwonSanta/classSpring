<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    table {
        border-collapse: collapse;
        border: 1px solid black;
    }
    th, td {
        text-align: center;
        border: 1px solid black;
    }
    th {
        background-color: deepskyblue;
    }
</style>
<body>
<h3>고객 나라 조사 [중복 제거]</h3>
<table>
    <thead>
        <tr>
            <th>#</th>
            <th>Country</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${countries}" var="country" varStatus="st">
           <tr>
               <td>
                   ${st.count}
               </td>
               <td>
                   ${country}
               </td>
           </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>
