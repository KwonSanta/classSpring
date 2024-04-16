<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>고객 나라 조사 [중복 제거]</h3>
<table>
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
</table>
</body>
</html>
