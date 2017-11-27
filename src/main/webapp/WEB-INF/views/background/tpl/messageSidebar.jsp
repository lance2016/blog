<%--
  Created by IntelliJ IDEA.
  User: lance
  Date: 2017/11/27
  Time: 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="page-sidebar" id="userSidebar" >
    <ul class="nav nav-pills nav-stacked">
        <li id="unread" class="active"><a href="javascript:void(0)"  id="userLinkA" style="text-decoration: none"  onclick="listAllMessages()">全部消息</a></li>
        <li  id="all"><a href="javascript:void(0)" style="text-decoration: none"  onclick="listUnreadMessages()">未读消息</a></li>
        <li  id="read"><a href="javascript:void(0)" style="text-decoration: none"  onclick="listReadMessages()">已读消息</a></li>
    </ul>
</div>
</body>
</html>
