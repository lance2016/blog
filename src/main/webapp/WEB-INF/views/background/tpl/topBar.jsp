<%@ page import="com.lance.bean.User" %><%--
  Created by IntelliJ IDEA.
  User: lance
  Date: 2017/11/22
  Time: 15:12
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
<%User user= (User) session.getAttribute("account"); %>
<nav class="navbar navbar-default navbar-static-top" >
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">Lance's Blog</a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li><a href="<%=basePath%>" style="text-decoration: none" >Home</a></li>
                <li class="active" style="text-decoration: none" ><a href=""><%=user.getNickname()%></a></li>
                <li><a href="#" style="text-decoration: none" >Blogs</a></li>
                <li><a href="#" style="text-decoration: none" >Album</a></li>
                <li><a href="<%=basePath%>user/logout" style="text-decoration: none" >注销</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        设置 <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#">注销</a></li>
                        <li><a href="#">切换用户</a></li>
                        <li class="divider"></li>
                        <li><a href="#">分离的链接</a></li>
                        <li class="divider"></li>
                        <li><a href="#">另一个分离的链接</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
</body>
</html>
