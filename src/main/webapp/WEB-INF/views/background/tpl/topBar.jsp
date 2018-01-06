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
                <li class="active" id="userLi" style="text-decoration: none" ><a href="javascript:void(0)" onclick="listAllUsers()"><%=user.getNickname()%></a></li>
                <li id="blogLi"><a href="javascript:void(0)" onclick="listAllBlogs()" style="text-decoration: none" >Blogs</a></li>
                <%--<li><a href="javascript:void(0)" style="text-decoration: none" >Album</a></li>--%>
                <li id="messageLi"><a href="javascript:void(0)" style="text-decoration: none" onclick="listAllMessages()">Message <span class="badge" id="messageNum" style="background-color: red">50</span></a></li>

                <li class="dropdown">
                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
                        设置 <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="<%=basePath%>logout" style="text-decoration: none" >注销</a></li>
                        <li><a href="javascript:void(0);">切换用户</a></li>
                        <li class="divider"></li>
                        <li><a href="javascript:void(0);" onclick="load('upload','#right')">上传文件</a></li>
                        <li class="divider"></li>
                        <li><a href="javascript:void(0);" onclick="load('download','#right')">下载文件</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <form class="navbar-form  pull-right" role="search" onsubmit="return false;" >
            <div class="form-group" class="offset-md-1">
                <select class="form-control" id="searchItem">
                    <option value="blog" selected>blog</option>
                    <option value="message">message</option>
                    <option value="user">user</option>
                </select>
            </div>
            <div class="form-group">
                <input type="text" id="textSearch" class="form-control" placeholder="Search">
            </div>
            <button type="submit" id="btnSearch" onclick="search()" class="btn btn-default">搜索</button>
        </form>
    </div>
</nav>

<script>
    $(document).ready(function () {
        checkUnread();
    });
    function search(){
        var realurl;
        var item=$("#searchItem").val();
        if(item=="user")
            realurl="<%=basePath%>user/searchUser";
        else if(item=="blog")
            realurl="<%=basePath%>blog/searchBlog";
        else if(item=="message")
            realurl="<%=basePath%>message/searchMessage";
        var data={
            'criteria':$("#textSearch").val()
        };
        $.ajax({
            type: "POST",
            url: realurl,
            dataType: "json",
            data:data,
            success:function (data) {
                var state=new Array(4);
                var isread=new Array(2);
                var color=new Array(2);
                color[0]='red',color[1]='green';
                state[0]="active"; state[1]="success"; state[2]="warning";state[3]="danger";
                isread[0]='未读',isread[1]='已读'
                if(item=="user"){
                    var user="<div class='col-md-12'><table class='table table-striped text-center'> <caption>所有用户</caption> <thead> <tr> <th class='col-md-2 text-center'>Id</th> <th class='col-md-2 text-center'>账号</th> <th class='col-md-2 text-center'>昵称</th> <th class='col-md-4 text-center'>访问时间</th> <th class='col-md-1 text-center'>删除</th> <th class='col-md-1 text-center'>修改</th> </tr> </thead> <tbody>";
                    $.each( data, function(index, content){
                        user=user+"<tr class="+state[index%4]+"><td>"+content['id']+"</td><td>"+content['username']+"</td><td>"+content['nickname']+"</td><td>"+content["visittime"]+"</td><td><a href='#' onclick='deleteUser("+content['id']+")'>删除</a></td><td><a href='#' onclick='getUser("+content['id']+")'>修改</a> </td></tr>";
                    });
                    user=user+"</tbody></table></div>";
                    $("#right").empty();
                    $("#right").append(user);
                    load("userSidebar","#left");//同时加载左侧侧边栏
                    $("#messageLi").removeClass('active');
                    $("#blogLi").removeClass('active');
                    $("#userLi").addClass('active');
                    if(data==""){
                        alertify.error("查询失败");
                        $("#right").append("<h3 class='text-center' style='color:red'>暂无相关数据</h3>");
                    }
                    else{
                        $("#right").textSearch($("#textSearch").val());
                        alertify.success("查询成功");
                    }

                }else if(item=="blog"){
                    var blog="<table class='table table-striped text-center'> <caption>所有博客</caption> <thead> <tr> <th class='col-md-2 text-center'>Id</th> <th class='col-md-2 text-center'>标题</th> <th class='col-md-2 text-center'>作者</th> <th class='col-md-3 text-center'>修改时间</th><th class='col-md-1 text-center'>置顶</th> <th class='col-md-1 text-center'>删除</th> <th class='col-md-1 text-center'>修改</th> </tr> </thead> <tbody>";
                    $.each( data, function(index, content){
                        blog=blog+"<tr class="+state[index%4]+"><td>"+content['id']+"</td><td>"+content['blogname']+"</td><td>"+content['author']+"</td><td>"+content["date"]+"</td><td>"+content['hot']+"</td>"+"<td><a href='#' onclick='deleteBlog("+content['id']+")'>删除</a></td><td><a href='#' onclick='getBlog("+content['id']+")'>修改</a> </td></tr>";
                    });
                    blog=blog+"</tbody></table>";
                    $("#right").empty();
                    $("#right").append(blog);
                    load("blogSidebar", "#left");//同时加载左侧侧边栏
                        $("#userLi").removeClass('active');
                        $("#messageLi").removeClass('active');
                        $("#blogLi").addClass('active');
                    if(data==""){
                        alertify.error("查询失败");
                        $("#right").append("<h3 class='text-center' style='color:red'>暂无相关数据</h3>");
                    }
                    else{
                        $("#right").textSearch($("#textSearch").val());
                        alertify.success("查询成功");
                    }
                }else if(item=="message"){
                    var message="<table class='table table-striped text-center' style='padding:50px'> <caption>所有留言</caption> <thead> <tr> <th class='col-md-2 text-center'>状态</th> <th class='col-md-2 text-center'>姓名</th> <th class='col-md-3 text-center'>时间</th> <th class='col-md-3 text-center'>邮箱</th> <th class='col-md-1 text-center'>删除</th> <th class='col-md-1 text-center'>查看</th> </tr> </thead> <tbody>";
                    $.each( data, function(index, content){
                        message=message+"<tr class="+state[index%4]+"><td>"+ "<span class='badge' style='background-color:"+color[content['isread']]+"'>"+isread[content['isread']]+"</span></td><td>"+content['name']+"</td><td>"+content['createtime']+"</td><td>"+content["email"]+"</td><td><a href='#' onclick='deleteMessage("+content['id']+")'>删除</a></td><td><a href='#' onclick='getMessage("+content['id']+")'>查看</a> </td></tr>";
                    });
                    message=message+"</tbody></table>";
                    $("#right").empty();
                    $("#right").append(message);
                    load("messageSidebar", "#left");//同时加载左侧侧边栏
                        $("#userLi").removeClass('active');
                        $("#blogLi").removeClass('active');
                        $("#messageLi").addClass('active');

                    if(data==""){
                        alertify.error("查询失败");
                        $("#right").append("<h3 class='text-center' style='color:red'>暂无相关数据</h3>");
                    }
                    else{
                        $("#right").textSearch($("#textSearch").val());
                        alertify.success("查询成功");
                    }
                }
            }
        });

    }
    function  checkUnread() {
        $.ajax({
            type: "POST",
            url: "<%=basePath%>message/getUnread",
            dataType: "json",
            success: function (data) {
                if(data!=0)
                    $("#messageNum").text(data);
                else
                    $("#messageNum").text("");
            }
        });
    }
</script>