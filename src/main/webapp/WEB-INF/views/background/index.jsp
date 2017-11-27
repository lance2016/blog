<%@ page import="com.lance.bean.User" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: lance
  Date: 2017/11/21
  Time: 12:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>lance的博客</title>
    <!--alert css-->
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <!--下面两个放反了结果出问题了-->
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/alertify.core.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/alertify.default.css">
    <script src="<%=basePath%>js/jquery-1.9.1.min.js"></script>
    <script src="<%=basePath%>js/bootstrap-paginator.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>js/alertify.min.js" type="text/javascript"></script><!--alertify提醒-->
    <script type="text/javascript" src="<%=basePath%>js/ckeditor/ckeditor.js"></script>
    <style>
        .container{
            padding: 0px;
        }
    </style>

    <%--为了避免js顺序加载出现问题，统一把用到的js放在了index页面--%>
</head>
<body style="background-color: #ffffff">
<%User user= (User) session.getAttribute("account");%>
<div class="container" style="background-color:#f8f8f8"; >
    <!--导航栏-->
    <div class="container" id="topBar" >

    </div>

    <div class="container" id="con" style="padding: 5px">
        <!--侧边栏-->
       <div id="left" class="col-md-2" >
           侧边栏加载
       </div>

        <!--加载页面-->
        <div class="col-md-10 " id="right" >
            加载内容
        </div>
        <div class="col-md-5 col-md-offset-7"><ul id='paginationBlog'></ul></div>
    </div>
</div>


<script>

    //初始化
    $(document).ready(function(){
        load("topBar","#topBar");//顶部导航栏
        load("userSidebar","#left");//左侧导航栏
        listAllUsers();//右侧内容,默认显示所有成员
        $("#con").height(document.documentElement.clientHeight-85);

    });





    //切换active 导航栏
    $(document).ready(function(){
        $('ul.nav.navbar-nav > li').click(function (e) {
            $('ul.nav.navbar-nav > li').removeClass('active');
            $(this).addClass('active');

        });
    });

    //利用ajax不更新切换右侧div内容
    function  load(testUrl,locate) {
        $("#paginationBlog").hide();
        $.ajax({
            url:"<%=basePath%>user/getJsp?tpl="+testUrl,
            async:false,
            type:"get",
            dataType:"html",
            success:function(msg){
                $(locate).html(msg);
            }
        });
    }


    /*
    * 用户管理jq
     */


    //获取查询到的全部用户，并拼接显示
    function listAllUsers() {
        var state=new Array(4);
        state[0]="active"; state[1]="success"; state[2]="warning";state[3]="danger";
        $.ajax({
            type:"POST",
            url:"<%=basePath%>user/getAllUsers",
            dataType:"json",
            success:function(data){
                var user="<div class='col-md-12'><table class='table table-striped text-center'> <caption>所有用户</caption> <thead> <tr> <th class='col-md-2 text-center'>Id</th> <th class='col-md-2 text-center'>账号</th> <th class='col-md-2 text-center'>昵称</th> <th class='col-md-4 text-center'>访问时间</th> <th class='col-md-1 text-center'>删除</th> <th class='col-md-1 text-center'>修改</th> </tr> </thead> <tbody>";
                $.each( data, function(index, content){
                    user=user+"<tr class="+state[index%4]+"><td>"+content['id']+"</td><td>"+content['username']+"</td><td>"+content['nickname']+"</td><td>"+content["visittime"]+"</td><td><a href='#' onclick='deleteUser("+content['id']+")'>删除</a></td><td><a href='#' onclick='getUser("+content['id']+")'>修改</a> </td></tr>";
                });
                user=user+"</tbody></table></div>";
                $("#right").html(user);
                load("userSidebar","#left");//同时加载左侧侧边栏
            },
            error: function (data) {
                console.info("error: " + data.responseText);
            }
        });
    }


    //获取用户，用于更新
    function  getUser(id) {
        //div切换到update页面。然后把ajax获得的值赋值给表单
        $.ajax({
            type:"POST",
            url:"<%=basePath%>user/getUserById?id="+id,
            dataType:"json",
            success:function(data){
                load("updateUser","#right");
                $("#id").val(data.id);
                $("#username").val(data.username);
                $("#nickname").val(data.nickname);
            },
            error: function (data) {
                console.info("error: " + data.responseText);
            }
        });

    }

    //删除用户
    function deleteUser(id) {
        alertify.set({
            labels : {
                ok     : "确定",
                cancel : "取消"
            },
            delay : 3000,
            buttonReverse : false,
            buttonFocus   : "ok"
        });
        alertify.confirm("确认删除?", function (e) {

            if (e) {
                $.ajax({
                    type:"POST",
                    url:"<%=basePath%>user/deleteUserById?id="+id,
                    dataType:"json",
                    success:function(data){
                        if(data==1){
                            alertify.success("删除成功");
                            listAllUsers();//重新加载一遍
                        }

                        else if(data==0){
                            alertify.error("删除失败");
                        }else{
                            alertify.warn("发生了一些错误");
                        }
                    },
                    error: function (data) {
                        console.info("error: " + data.responseText);
                    }
                });
            } else {
                alertify.log("取消删除");
            }
        });
    }


/*
******   博客管理 jq
*
 */


    //  获取查询到的全部博客，并拼接显示
    function listAllBlogs() {

        var state=new Array(4);
        state[0]="active"; state[1]="success"; state[2]="warning";state[3]="danger";
        var totalpage=0;
            $.ajax({
                type:"POST",
                url:"<%=basePath%>blog/getTotalPage?pageSize=5",
                dataType:"json",
            success:function (data) {
                totalpage=data;
            }
        });
            $.ajax({
                type:"POST",
                url:"<%=basePath%>blog/listAllBlogs?page=1",
                dataType:"json",
                success:function(data){
                    var user="<table class='table table-striped text-center'> <caption>所有博客</caption> <thead> <tr> <th class='col-md-2 text-center'>Id</th> <th class='col-md-2 text-center'>标题</th> <th class='col-md-2 text-center'>作者</th> <th class='col-md-3 text-center'>修改时间</th><th class='col-md-1 text-center'>置顶</th> <th class='col-md-1 text-center'>删除</th> <th class='col-md-1 text-center'>修改</th> </tr> </thead> <tbody>";
                    $.each( data, function(index, content){
                        user=user+"<tr class="+state[index%4]+"><td>"+content['id']+"</td><td>"+content['blogname']+"</td><td>"+content['author']+"</td><td>"+content["date"]+"</td><td>"+content['hot']+"</td>"+"<td><a href='#' onclick='deleteBlog("+content['id']+")'>删除</a></td><td><a href='#' onclick='getBlog("+content['id']+")'>修改</a> </td></tr>";
                    });
                    user=user+"</tbody></table>";
                    $("#right").html(user);
                    load("blogSidebar", "#left");//同时加载左侧侧边栏
                    var options = {
                        bootstrapMajorVersion: 3, //版本
                        currentPage:1, //当前页数
                        totalPages: totalpage, //总页数
                        itemTexts: function (type, page, current) {
                            switch (type) {
                                case "first":
                                    return "首页";
                                case "prev":
                                    return "上一页";
                                case "next":
                                    return "下一页";
                                case "last":
                                    return "末页";
                                case "page":
                                    return page;
                            }
                        },  onPageClicked: function (event, originalEvent, type, page) {
                            $.ajax({
                                type: "POST",
                                url: "<%=basePath%>blog/listAllBlogs?page=" + page,
                                dataType: "json",
                                success: function (data) {
                                    var user = "<table class='table table-striped text-center'> <caption>所有博客</caption> <thead> <tr> <th class='col-md-2 text-center'>Id</th> <th class='col-md-2 text-center'>标题</th> <th class='col-md-2 text-center'>作者</th> <th class='col-md-3 text-center'>修改时间</th><th class='col-md-1 text-center'>置顶</th> <th class='col-md-1 text-center'>删除</th> <th class='col-md-1 text-center'>修改</th> </tr> </thead> <tbody>";
                                    $.each(data, function (index, content) {
                                        user = user + "<tr class=" + state[index % 4] + "><td>" + content['id'] + "</td><td>" + content['blogname'] + "</td><td>" + content['author'] + "</td><td>" + content["date"] + "</td><td>" + content['hot'] + "</td>" + "<td><a href='#' onclick='deleteBlog(" + content['id'] + ")'>删除</a></td><td><a href='#' onclick='getBlog(" + content['id'] + ")'>修改</a> </td></tr>";
                                    });
                                    user = user + "</tbody></table> ";
                                    $("#right").html(user);
                                    load("blogSidebar", "#left");//同时加载左侧侧边栏
                                    $("#paginationBlog").show();  //在load方法里执行隐藏pagnationBlog的操作，只有需要分页的页面才调用显示
                                    var options = {
                                        bootstrapMajorVersion: 3, //版本
                                        currentPage: page, //当前页数
                                        totalPages: totalpage, //总页数
                                        itemTexts: function (type, page, current) {
                                            switch (type) {
                                                case "first":
                                                    return "首页";
                                                case "prev":
                                                    return "上一页";
                                                case "next":
                                                    return "下一页";
                                                case "last":
                                                    return "末页";
                                                case "page":
                                                    return page;
                                            }
                                        }
                                    }
                                }

                            });
                        }
                    };
                    $('#paginationBlog').bootstrapPaginator(options);
                    $("#paginationBlog").show();
                },
                error: function (data) {
                    console.info("error: " + data.responseText);
                }
            });
    }

    //删除博客
    function deleteBlog(id) {
        alertify.set({
            labels : {
                ok     : "确定",
                cancel : "取消"
            },
            delay : 3000,
            buttonReverse : false,
            buttonFocus   : "ok"
        });
        alertify.confirm("确认删除"+id+"?", function (e) {

            if (e) {
                $.ajax({
                    type:"POST",
                    url:"<%=basePath%>blog/deleteBlogById?id="+id,
                    dataType:"json",
                    success:function(data){
                        if(data==1){
                            alertify.success("删除成功");
                            listAllBlogs();//重新加载一遍
                        }

                        else if(data==0){
                            alertify.error("删除失败");
                        }else{
                            alertify.warn("发生了一些错误");
                        }
                    },
                    error: function (data) {
                        console.info("error: " + data.responseText);
                    }
                });
            } else {
                alertify.log("取消删除");
            }
        });
    }

    //获取博客，加载页面
    function getBlog(id) {
        $("paginationBlog").hide();
        $.ajax({
            type:"POST",
            url:"<%=basePath%>blog/getBlogById?id="+id,
            dataType:"json",
            success:function(data){
                load("addBlog","#right");
                $("#blogname").val(data.blogname);
                $("#author").val(data.author);
                CKEDITOR.instances.blogcontent.setData(data.blogcontent);
                $("#hot").val(data.hot);
                $("#imgname").val(data.imgname);
                $("#img").attr("src","<%=basePath%>images/"+data.imgname);
                $("#btn").text("更新");
                $('#btn').attr("onclick","updateBlog("+id+")");
            },
            error: function (data) {
                console.info("error: " + data.responseText);
            }
        });

    }


    function  updateBlog(id) {
        var data={
            'blogname':     $("#blogname").val(),
            'author':       $("#author").val(),
            'blogcontent':CKEDITOR.instances.blogcontent.getData(),
            'hot':          $("#hot").val(),
            'imgname':      $("#imgname").val()
        };

        $.ajax({
            type:"POST",
            url:"<%=basePath%>blog/updateBlog?id="+id,
            dataType:"json",
            data:data,
            beforeSend: function () {
                // 禁用按钮防止重复提交
                $("#btn").attr({ disabled: "disabled" });
            },
            success:function(data){
                if(data==1)
                    alertify.success("修改成功");
                else if(data==0){
                    alertify.log("请填写完整");
                }else
                    console.log("发生了点问题，返回值"+data);
            }, complete: function () {
                $("#btn").removeAttr("disabled");
            },
            error: function (data) {
                alertify.error("修改失败");
                console.info("error: " + data.responseText);
            }
        });

    }




    //message管理

    function listAllMessages() {
        var state=new Array(4);
        var isread=new Array(2);
        var color=new Array(2);
        color[0]='red',color[1]='green';
        state[0]="active"; state[1]="success"; state[2]="warning";state[3]="danger";
        isread[0]='未读',isread[1]='已读'
        var totalpage=0;
        $.ajax({
            type:"POST",
            url:"<%=basePath%>message/getTotalPage?pageSize=10",
            dataType:"json",
            success:function (data) {
                totalpage=data;
            }
        });
        $.ajax({
            type:"POST",
            url:"<%=basePath%>message/listAllMessages?page=1",
            dataType:"json",
            success:function(data){
                var user="<table class='table table-striped text-center' style='padding:50px'> <caption>所有留言</caption> <thead> <tr> <th class='col-md-2 text-center'>状态</th> <th class='col-md-2 text-center'>姓名</th> <th class='col-md-3 text-center'>时间</th> <th class='col-md-3 text-center'>邮箱</th> <th class='col-md-1 text-center'>删除</th> <th class='col-md-1 text-center'>查看</th> </tr> </thead> <tbody>";
                $.each( data, function(index, content){
                    user=user+"<tr class="+state[index%4]+"><td>"+ "<span class='badge' style='background-color:"+color[content['isread']]+"'>"+isread[content['isread']]+"</span></td><td>"+content['name']+"</td><td>"+content['createtime']+"</td><td>"+content["email"]+"</td><td><a href='#' onclick='deleteMessage("+content['id']+")'>删除</a></td><td><a href='#' onclick='getMessage("+content['id']+")'>查看</a> </td></tr>";
                });
                user=user+"</tbody></table>";
                $("#right").empty();
                $("#right").append(user);
                load("messageSidebar", "#left");//同时加载左侧侧边栏
                var options = {
                    bootstrapMajorVersion: 3, //版本
                    currentPage:1, //当前页数
                    totalPages: totalpage, //总页数
                    itemTexts: function (type, page, current) {
                        switch (type) {
                            case "first":
                                return "首页";
                            case "prev":
                                return "上一页";
                            case "next":
                                return "下一页";
                            case "last":
                                return "末页";
                            case "page":
                                return page;
                        }
                    },  onPageClicked: function (event, originalEvent, type, page) {
                        $.ajax({
                            type: "POST",
                            url: "<%=basePath%>message/listAllMessages?page=" + page,
                            dataType: "json",
                            success: function (data) {
                                var user="<table class='table table-striped text-center' style='padding:50px'> <caption>所有留言</caption> <thead> <tr> <th class='col-md-2 text-center'>状态</th> <th class='col-md-2 text-center'>姓名</th> <th class='col-md-3 text-center'>时间</th> <th class='col-md-3 text-center'>邮箱</th> <th class='col-md-1 text-center'>删除</th> <th class='col-md-1 text-center'>查看</th> </tr> </thead> <tbody>";
                                $.each( data, function(index, content){
                                    user=user+"<tr class="+state[index%4]+"><td>"+ "<span class='badge' style='background-color: red'>"+isread[content['isread']]+"</span></td><td>"+content['name']+"</td><td>"+content['createtime']+"</td><td>"+content["email"]+"</td><td><a href='#' onclick='deleteMessage("+content['id']+")'>删除</a></td><td><a href='#' onclick='getMessage("+content['id']+")'>查看</a> </td></tr>";
                                });
                                user = user + "</tbody></table> ";
                                $("#right").html(user);
                                load("messageSidebar", "#left");//同时加载左侧侧边栏
                                $("#paginationBlog").show();  //在load方法里执行隐藏pagnationBlog的操作，只有需要分页的页面才调用显示
                                var options = {
                                    bootstrapMajorVersion: 3, //版本
                                    currentPage: page, //当前页数
                                    totalPages: totalpage, //总页数
                                    itemTexts: function (type, page, current) {
                                        switch (type) {
                                            case "first":
                                                return "首页";
                                            case "prev":
                                                return "上一页";
                                            case "next":
                                                return "下一页";
                                            case "last":
                                                return "末页";
                                            case "page":
                                                return page;
                                        }
                                    }
                                }
                            }

                        });
                    }
                };
                $('#paginationBlog').bootstrapPaginator(options);
                $("#paginationBlog").show();
            },
            error: function (data) {
                console.info("error: " + data.responseText);
            }
        });
    }

    function listUnreadMessages() {
        var state=new Array(4);
        var isread=new Array(2);
        var color=new Array(2);
        color[0]='red',color[1]='green';
        state[0]="active"; state[1]="success"; state[2]="warning";state[3]="danger";
        isread[0]='未读',isread[1]='已读'
        var totalpage=0;
        $.ajax({
            type:"POST",
            url:"<%=basePath%>message/getUnreadPage?pageSize=10",
            dataType:"json",
            success:function (data) {
                totalpage=data;
            }
        });
        $.ajax({
            type:"POST",
            url:"<%=basePath%>message/listUnreadMessages?page=1",
            dataType:"json",
            success:function(data){
                var user="<table class='table table-striped text-center' style='padding:50px'> <caption>所有留言</caption> <thead> <tr> <th class='col-md-2 text-center'>状态</th> <th class='col-md-2 text-center'>姓名</th> <th class='col-md-3 text-center'>时间</th> <th class='col-md-3 text-center'>邮箱</th> <th class='col-md-1 text-center'>删除</th> <th class='col-md-1 text-center'>查看</th> </tr> </thead> <tbody>";
                $.each( data, function(index, content){
                    user=user+"<tr class="+state[index%4]+"><td>"+ "<span class='badge' style='background-color:"+color[content['isread']]+"'>"+isread[content['isread']]+"</span></td><td>"+content['name']+"</td><td>"+content['createtime']+"</td><td>"+content["email"]+"</td><td><a href='#' onclick='deleteMessage("+content['id']+")'>删除</a></td><td><a href='#' onclick='getMessage("+content['id']+")'>查看</a> </td></tr>";
                });
                user=user+"</tbody></table>";
                $("#right").empty();
                $("#right").append(user);
                load("messageSidebar", "#left");//同时加载左侧侧边栏
                var options = {
                    bootstrapMajorVersion: 3, //版本
                    currentPage:1, //当前页数
                    totalPages: totalpage, //总页数
                    itemTexts: function (type, page, current) {
                        switch (type) {
                            case "first":
                                return "首页";
                            case "prev":
                                return "上一页";
                            case "next":
                                return "下一页";
                            case "last":
                                return "末页";
                            case "page":
                                return page;
                        }
                    },  onPageClicked: function (event, originalEvent, type, page) {
                        $.ajax({
                            type: "POST",
                            url: "<%=basePath%>message/listUnreadMessages?page=" + page,
                            dataType: "json",
                            success: function (data) {
                                var user="<table class='table table-striped text-center' style='padding:50px'> <caption>所有留言</caption> <thead> <tr> <th class='col-md-2 text-center'>状态</th> <th class='col-md-2 text-center'>姓名</th> <th class='col-md-3 text-center'>时间</th> <th class='col-md-3 text-center'>邮箱</th> <th class='col-md-1 text-center'>删除</th> <th class='col-md-1 text-center'>查看</th> </tr> </thead> <tbody>";
                                $.each( data, function(index, content){
                                    user=user+"<tr class="+state[index%4]+"><td>"+ "<span class='badge' style='background-color: red'>"+isread[content['isread']]+"</span></td><td>"+content['name']+"</td><td>"+content['createtime']+"</td><td>"+content["email"]+"</td><td><a href='#' onclick='deleteMessage("+content['id']+")'>删除</a></td><td><a href='#' onclick='getMessage("+content['id']+")'>查看</a> </td></tr>";
                                });
                                user = user + "</tbody></table> ";
                                $("#right").html(user);
                                load("messageSidebar", "#left");//同时加载左侧侧边栏
                                $("#paginationBlog").show();  //在load方法里执行隐藏pagnationBlog的操作，只有需要分页的页面才调用显示
                                var options = {
                                    bootstrapMajorVersion: 3, //版本
                                    currentPage: page, //当前页数
                                    totalPages: totalpage, //总页数
                                    itemTexts: function (type, page, current) {
                                        switch (type) {
                                            case "first":
                                                return "首页";
                                            case "prev":
                                                return "上一页";
                                            case "next":
                                                return "下一页";
                                            case "last":
                                                return "末页";
                                            case "page":
                                                return page;
                                        }
                                    }
                                }
                            }

                        });
                    }
                };
                $('#paginationBlog').bootstrapPaginator(options);
                $("#paginationBlog").show();
            },
            error: function (data) {
                console.info("error: " + data.responseText);
            }
        });
    }


    //获取已读消息

    function listReadMessages() {
        var state=new Array(4);
        var isread=new Array(2);
        var color=new Array(2);
        color[0]='red',color[1]='green';
        state[0]="active"; state[1]="success"; state[2]="warning";state[3]="danger";
        isread[0]='未读',isread[1]='已读'

        var totalpage=0;
        $.ajax({
            type:"POST",
            url:"<%=basePath%>message/getReadPage?pageSize=10",
            dataType:"json",
            success:function (data) {
                totalpage=data;
            }
        });
        $.ajax({
            type:"POST",
            url:"<%=basePath%>message/listReadMessages?page=1",
            dataType:"json",
            success:function(data){
                var user="<table class='table table-striped text-center' style='padding:50px'> <caption>所有留言</caption> <thead> <tr> <th class='col-md-2 text-center'>状态</th> <th class='col-md-2 text-center'>姓名</th> <th class='col-md-3 text-center'>时间</th> <th class='col-md-3 text-center'>邮箱</th> <th class='col-md-1 text-center'>删除</th> <th class='col-md-1 text-center'>查看</th> </tr> </thead> <tbody>";
                $.each( data, function(index, content){
                    user=user+"<tr class="+state[index%4]+"><td>"+ "<span class='badge' style='background-color:"+color[content['isread']]+"'>"+isread[content['isread']]+"</span></td><td>"+content['name']+"</td><td>"+content['createtime']+"</td><td>"+content["email"]+"</td><td><a href='#' onclick='deleteMessage("+content['id']+")'>删除</a></td><td><a href='#' onclick='getMessage("+content['id']+")'>查看</a> </td></tr>";
                });
                user=user+"</tbody></table>";
                $("#right").empty();
                $("#right").append(user);
                load("messageSidebar", "#left");//同时加载左侧侧边栏
                var options = {
                    bootstrapMajorVersion: 3, //版本
                    currentPage:1, //当前页数
                    totalPages: totalpage, //总页数
                    itemTexts: function (type, page, current) {
                        switch (type) {
                            case "first":
                                return "首页";
                            case "prev":
                                return "上一页";
                            case "next":
                                return "下一页";
                            case "last":
                                return "末页";
                            case "page":
                                return page;
                        }
                    },  onPageClicked: function (event, originalEvent, type, page) {
                        $.ajax({
                            type: "POST",
                            url: "<%=basePath%>message/listReadMessages?page=" + page,
                            dataType: "json",
                            success: function (data) {
                                var user="<table class='table table-striped text-center' style='padding:50px'> <caption>所有留言</caption> <thead> <tr> <th class='col-md-2 text-center'>状态</th> <th class='col-md-2 text-center'>姓名</th> <th class='col-md-3 text-center'>时间</th> <th class='col-md-3 text-center'>邮箱</th> <th class='col-md-1 text-center'>删除</th> <th class='col-md-1 text-center'>查看</th> </tr> </thead> <tbody>";
                                $.each( data, function(index, content){
                                    user=user+"<tr class="+state[index%4]+"><td>"+ "<span class='badge' style='background-color: red'>"+isread[content['isread']]+"</span></td><td>"+content['name']+"</td><td>"+content['createtime']+"</td><td>"+content["email"]+"</td><td><a href='#' onclick='deleteMessage("+content['id']+")'>删除</a></td><td><a href='#' onclick='getMessage("+content['id']+")'>查看</a> </td></tr>";
                                });
                                user = user + "</tbody></table> ";
                                $("#right").html(user);
                                load("messageSidebar", "#left");//同时加载左侧侧边栏
                                $("#paginationBlog").show();  //在load方法里执行隐藏pagnationBlog的操作，只有需要分页的页面才调用显示
                                var options = {
                                    bootstrapMajorVersion: 3, //版本
                                    currentPage: page, //当前页数
                                    totalPages: totalpage, //总页数
                                    itemTexts: function (type, page, current) {
                                        switch (type) {
                                            case "first":
                                                return "首页";
                                            case "prev":
                                                return "上一页";
                                            case "next":
                                                return "下一页";
                                            case "last":
                                                return "末页";
                                            case "page":
                                                return page;
                                        }
                                    }
                                }
                            }

                        });
                    }
                };
                $('#paginationBlog').bootstrapPaginator(options);
                $("#paginationBlog").show();
            },
            error: function (data) {
                console.info("error: " + data.responseText);
            }
        });
    }


    //删除message
    function deleteMessage(id) {
        $.ajax({
            type:"POST",
            url:"<%=basePath%>message/deleteMessage?id="+id,
            dataType:"json",
            success:function (data) {
                if(data==1){
                    alertify.success("删除成功");
                    listAllMessages();
                    checkUnread();//更新当前未读消息
                }

                else
                    alertify.error("删除失败");
            }
        });
    }

    //查看message
    function  getMessage(id) {
        $.ajax({
            type:"POST",
            url:"<%=basePath%>message/getMessage?id="+id,
            dataType:"json",
            success:function (data) {
                if(data.isread==0){
                    updateMessageState(data.id);

                    checkUnread();
                }
                $("#right").empty();
                $("#paginationBlog").hide();
                var html='<div class="col-md-10"><div class="col-md-12 text-center"><h4>留言人:'+data.name+'</h4></div><div class="col-md-12 text-center">邮箱:'+data.email+'<div class="col-md-12 text-center">留言时间：'+data.createtime+'<div class="col-md-12 text-center">内容'+data.content+'</div>';
                $("#right").append(html);

            }
        });
    }

    //message只允许修改状态，即已读和未读
    function updateMessageState(id) {
        $.ajax({
            type: "POST",
            url: "<%=basePath%>message/updateMessageState?id=" + id,
            dataType: "json",
            success: function (data) {
                if(data==1)
                    alertify.success("已阅");
            }
        });
    }

</script>









</body>
</html>