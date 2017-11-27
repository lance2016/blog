<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="page-sidebar" >
    <ul class="nav nav-pills nav-stacked">
        <li id="listAllBlogs" class="active"><a href="javascript:void(0)" id="blogLinkA" style="text-decoration: none"  onclick="listAllBlogs()">显示所有博客</a></li>
        <li id="addBlog"><a href="javascript:void(0)"  id="blogLingB" style="text-decoration: none" onclick="load('addBlog','#right')">增加博客</a></li>

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