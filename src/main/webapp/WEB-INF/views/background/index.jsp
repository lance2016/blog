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
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/alertify.default.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/alertify.core.css">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/bgcss.css">
    <script src="<%=basePath%>js/alertify.min.js" type="text/javascript"></script><!--alertify提醒-->
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
        //初始化
        $(document).ready(function(){
            test("topBar","#topBar");//顶部导航栏
           test("addUser","#right");//右边
        });



        //切换active 侧边栏  因为有两个 ul.nav ，所以前面再加一个父类
        $(document).ready(function(){
            $('.page-sidebar ul.nav > li').click(function (e) {
                e.preventDefault();
                $('.page-sidebar ul.nav > li').removeClass('active');
                $(this).addClass('active');

            });
        });
        //切换active 导航栏
        $(document).ready(function(){
            $('ul.nav.navbar-nav > li').click(function (e) {
                e.preventDefault();
                $('ul.nav.navbar-nav > li').removeClass('active');
                $(this).addClass('active');

            });
        });

        //利用ajax不更新切换右侧div内容
        function  test(testUrl,locate) {
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

    </script>

</head>
<body>
<%User user= (User) session.getAttribute("account");%>
<div class="container">
    <!--导航栏-->
    <div class="col-md-12" id="topBar">

    </div>


    <div class="col-md-12">

        <!--侧边栏-->
        <div class="page-sidebar col-md-2" >

            <ul class="nav nav-pills nav-stacked">
                <li class="active"><a href="#"  style="text-decoration: none" onclick="test('addUser','#right')">增加用户</a></li>
                <li ><a href="#" style="text-decoration: none"  onclick="test('listAllUser','#right')">显示所有用户</a></li>
            </ul>

        </div>



        <!--加载页面-->
        <div class="col-md-9 col-md-offset-1" id="right"  >

                加载在这里

        </div>
    </div>
</div>





</body>
</html>