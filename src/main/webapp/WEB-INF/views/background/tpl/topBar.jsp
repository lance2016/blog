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
                <%--<li><a href="javascript:void(0)" style="text-decoration: none" >Album</a></li>--%>
                <li><a href="javascript:void(0)" style="text-decoration: none" onclick="listAllMessages()">Message <span class="badge" id="messageNum" style="background-color: red">50</span></a></li>

                <li class="dropdown">
                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
                        设置 <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="<%=basePath%>user/logout" style="text-decoration: none" >注销</a></li>
                        <li><a href="javascript:void(0);">切换用户</a></li>
                        <li class="divider"></li>
                        <li><a href="javascript:void(0);">分离的链接</a></li>
                        <li class="divider"></li>
                        <li><a href="javascript:void(0);">另一个分离的链接</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <form class="navbar-form  pull-right" role="search" >
            <div class="form-group" class="offset-md-1">
                <select class="form-control" id="searchItem">
                    <option value="blogs" selected>blog</option>
                    <option value="message">message</option>
                    <option value="user">user</option>
                </select>
            </div>
            <div class="form-group">
                <input type="text" id="textSearch" class="form-control" placeholder="Search">
            </div>
            <button type="submit" id="btnSearch" class="btn btn-default">搜索</button>
        </form>
    </div>
</nav>

<script>
    $(document).ready(function () {
        checkUnread();
    });

    function  checkUnread() {
        $.ajax({
            type: "POST",
            url: "<%=basePath%>message/getUnread",
            dataType: "json",
            success: function (data) {
                if(data!=0)
                    $("#messageNum").text(data);
                else
                    $("#messageNum").text();
            }
        });
    }
</script>