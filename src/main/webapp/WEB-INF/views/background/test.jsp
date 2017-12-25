<%--
  Created by IntelliJ IDEA.
  User: lance
  Date: 2017/12/24
  Time: 9:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/LanceBlog/logout">logout</a>
<a href="<%=basePath%>logout">logout</a>
</body>
</html>
