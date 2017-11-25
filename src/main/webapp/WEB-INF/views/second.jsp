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
    <script>
        $(document).ready(function () {
            $("#con").height(document.documentElement.clientHeight);
        });

    </script>
    <style>
        /*分割线*/
        .mask {
            overflow: hidden;
            height: 20px;
        }
        .mask:after {
            content: '';
            display: block;
            margin: -25px auto 0;
            width: 100%;
            height: 25px;
            border-radius: 125px/12px;
            box-shadow: 0 0 8px black;
        }
        #link{
            position: absolute;

        }
        a,a:link,a:hover{
            text-decoration: none;
        }
    </style>
</head>
<body style="background-color: #f6f6f6">

<div class="container" id="con" style="background-color: #fff;">
    <div id="head" class="col-md-12 text-center">
       <h3  style="padding: 20px 0px 10px 0px"> ${blog.blogname}</h3>
        <div class="mask"></div>

    </div>

    <div class="col-md-2">&nbsp;</div>
    <div id="intro" style="color:grey;font-size: 12px" class="col-md-8  text-center">
       作者：${blog.author}  |   日期：${blog.date.substring(0,10)}  | 访问次数：${blog.visittime}
    </div>
    <div class="col-md-1 col-md-offset-1">
        <a href="javascript:history.go(-1);">返回</a>
    </div>
    <div id="content" class="col-md-12" style="padding: 10px 50px 0 50px">
        ${blog.blogcontent}
    </div>
</div>
</body>
<script>

</script>
</html>

