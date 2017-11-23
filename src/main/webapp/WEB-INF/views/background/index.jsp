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
    <title>Bootstrap 实例 - 面包屑导航</title>
    <!--alert css-->
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <!--下面两个放反了结果出问题了-->
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/alertify.core.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/alertify.default.css">

    <style>
        .container{
            padding: 0px;
        }
    </style>
    <%--<link rel="stylesheet" type="text/css" href="<%=basePath%>css/bgcss.css">--%>
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
           侧边栏加载在这里
       </div>

        <!--加载页面-->
        <div class="col-md-10 " id="right" >

            加载在这里

        </div>
    </div>
</div>


<script src="<%=basePath%>js/jquery-1.9.1.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="<%=basePath%>js/alertify.min.js" type="text/javascript"></script><!--alertify提醒-->
<script>
    //初始化
    $(document).ready(function(){
        load("topBar","#topBar");//顶部导航栏
        load("userSidebar","#left");//左侧导航栏
        listAllUsers();//右侧内容,默认显示所有成员
        $("#con").height(document.documentElement.clientHeight-85);

    });



    //切换active 侧边栏  因为有两个 ul.nav ，所以前面再加一个父类
    $(document).ready(function(){
        $('.page-sidebar ul.nav > li').click(function (e) {
            //  e.preventDefault();
            $('.page-sidebar ul.nav > li').removeClass('active');
            $(this).addClass('active');

        });
    });
    //切换active 导航栏
    $(document).ready(function(){
        $('ul.nav.navbar-nav > li').click(function (e) {
            //  e.preventDefault();
            $('ul.nav.navbar-nav > li').removeClass('active');
            $(this).addClass('active');

        });
    });

    //利用ajax不更新切换右侧div内容
    function  load(testUrl,locate) {
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


    //  获取查询到的全部用户，并拼接显示
    function listAllUsers() {
        var state=new Array(4);
        state[0]="active"; state[1]="success"; state[2]="warning";state[3]="danger";
        $.ajax({
            type:"POST",
            url:"<%=basePath%>user/getAllUsers",
            dataType:"json",
            success:function(data){

                var user="<table class='table table-striped text-center'> <caption>所有用户</caption> <thead> <tr> <th class='col-md-2 text-center'>Id</th> <th class='col-md-2 text-center'>账号</th> <th class='col-md-2 text-center'>昵称</th> <th class='col-md-4 text-center'>访问时间</th> <th class='col-md-1 text-center'>删除</th> <th class='col-md-1 text-center'>修改</th> </tr> </thead> <tbody>";
                $.each( data, function(index, content){
                    user=user+"<tr class="+state[index%4]+"><td>"+content['id']+"</td><td>"+content['username']+"</td><td>"+content['nickname']+"</td><td>"+content["visittime"]+"</td><td><a href='#' onclick='deleteUser("+content['id']+")'>删除</a></td><td><a href='#' onclick='getUser("+content['id']+")'>修改</a> </td></tr>";

                    //alert( "item #" + index + " its value is: " + content["id"] );
                });
                user=user+"</tbody></table>";
                $("#right").html(user);
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



</script>
</body>
</html>