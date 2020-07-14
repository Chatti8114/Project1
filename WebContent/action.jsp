<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019-12-07
  Time: 오전 12:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    String[] a = request.getParameterValues("test");
%>

<%= a[0] %>
<%= a[1] %>
<%= a[2] %>


</body>
</html>
