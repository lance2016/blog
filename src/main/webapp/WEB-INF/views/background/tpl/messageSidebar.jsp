<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="page-sidebar" id="userSidebar" >
    <ul class="nav nav-pills nav-stacked">
        <li id="unread" class="active"><a href="javascript:void(0)"  style="text-decoration: none"  onclick="listAllMessages()">全部消息</a></li>
        <li  id="all"><a href="javascript:void(0)" style="text-decoration: none"  onclick="listUnreadMessages()">未读消息</a></li>
        <li  id="read"><a href="javascript:void(0)" style="text-decoration: none"  onclick="listReadMessages()">已读消息</a></li>
    </ul>
</div>

<script>
    //切换active 侧边栏  因为有两个 ul.nav ，所以前面再加一个父类
    $(document).ready(function(){
        $('.page-sidebar ul.nav > li').click(function (e) {
            //  e.preventDefault();
            $('.page-sidebar ul.nav > li').removeClass('active');
            $(this).addClass('active');
        });
    });
</script>



