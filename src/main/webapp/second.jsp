<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
    <head>
        <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body style="background-color: white">
    <a href="<%=basePath%>" >返回</a>
        <div class="container">
            <div id="head" class="col-md-12">
                title
            </div>
            </hr>
            <div id="intro" class="col-md-12">
                author  date  visitTimes
            </div>
            <div id="content" class="col-md-12">
                test
            </div>
        </div>
    </body>
<script>

</script>
</html>

