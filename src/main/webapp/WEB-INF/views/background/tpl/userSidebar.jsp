<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="page-sidebar col-md-12" >
    <ul class="nav nav-pills nav-stacked">
        <li id="listAllUsers" class="active"><a href="#"  style="text-decoration: none"  onclick="listAllUsers()">显示所有用户</a></li>
        <li  id="addUser"><a href="#" style="text-decoration: none" onclick="load('addUser','#right')">增加用户</a></li>
    </ul>

</div>
