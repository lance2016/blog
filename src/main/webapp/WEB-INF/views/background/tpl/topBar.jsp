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

<%User user= (User) session.getAttribute("account"); %>
<nav class="navbar navbar-default navbar-static-top container" >
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="<%=basePath%>">Lance's Blog</a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li class="active" style="text-decoration: none" ><a href="javascript:void(0)" onclick="listAllUsers()"><%=user.getNickname()%></a></li>
                <li><a href="javascript:void(0)" onclick="listAllBlogs()" style="text-decoration: none" >Blogs</a></li>
                <li><a href="javascript:void(0)" style="text-decoration: none" >Album</a></li>
                <li><a href="<%=basePath%>user/logout" style="text-decoration: none" >注销</a></li>
                <li class="dropdown">
                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
                        设置 <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="javascript:void(0);">注销</a></li>
                        <li><a href="javascript:void(0);">切换用户</a></li>
                        <li class="divider"></li>
                        <li><a href="javascript:void(0);">分离的链接</a></li>
                        <li class="divider"></li>
                        <li><a href="javascript:void(0);">另一个分离的链接</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
