<%--
  Created by IntelliJ IDEA.
  User: lance
  Date: 2017/11/21
  Time: 12:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Bootstrap 实例 - 面包屑导航</title>


    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(function() {
            alert("ajax一级准备！");
            $.ajax({
                url: "localhost:8080/blog/user/ajaxTest",
                type: "post",
                success: function (data) {
                    alert(data.key);
                }

            });
        });
    </script>
</head>
<body>

<ol class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li><a href="#">2013</a></li>
    <li class="active">十一月</li>
</ol>

</body>
</html>