<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="page-sidebar" id="userSidebar" >
    <ul class="nav nav-pills nav-stacked">
        <li id="listAllUsers" class="active"><a href="javascript:void(0)"  style="text-decoration: none"  onclick="listAllUsers()">显示所有用户</a></li>
        <li  id="addUser"><a href="javascript:void(0)" style="text-decoration: none"  onclick="load('addUser','#right')">增加用户</a></li>
    </ul>

</div>

<!--放在index.jsp里面，会出错，没找到原因-->
<script>
    //切换active 侧边栏  因为有两个 ul.nav ，所以前面再加一个父类
    $(document).ready(function(){
        $('.page-sidebar ul.nav > li').click(function (e) {
            $('.page-sidebar ul.nav > li').removeClass('active');
            $(this).addClass('active');
        });
    });
</script>