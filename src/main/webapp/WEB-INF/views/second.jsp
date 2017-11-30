<%--
  Created by IntelliJ IDEA.
  User: lance
  Date: 2017/11/26
  Time: 19:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>blog</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="icon" href="<%=basePath%>images/fate.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="<%=basePath%>images/fate.ico" type="image/x-icon" />
    <link rel="stylesheet" href="<%=basePath%>/css/second.css">
    <!--styles-->
    <%--<link href="css/bootstrap.min.css" rel="stylesheet">--%>


    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body style="background-color: white">
<div class="container" style="background-color: #f8f8f8;padding: 0px;margin: 0 auto;">
    <section class="grey-bg" id="blog">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h3 class="title-small-center text-center item-title" >
                        <span><a href="<%=basePath%>blog/getMore">Blog</a></span>
                    </h3>
                    <div class="row">
                        <div class="col-md-6 col-md-offset-3">
                            <p class="content-details text-center text-muted">
                                Keep a record of what happened every single day
                            </p>
                        </div>
                        <div class="col-md-1 col-md-offset-1">
                            <a href="javascript:history.go(-1);">返回</a>
                        </div>
                    </div>
                    <!--GRID BLOG-->
                    <div class="grid" id="blogs">
                        加载博客，默认加载前6条
                    </div>
                    <!--/.GRID BLOG END-->
                </div>
            </div>
        </div>
    </section>
</div>

<script>
    $(document).ready(function () {
        getAllBlogs();
    });

    function getAllBlogs() {
        $.ajax({
        type:"POST",
        url:"<%=basePath%>blog/getBlogForSecond",
        dataType:"json",
        success:function(data){
            var blogContent="";
            $.each( data, function(index, content){
            //注意，参数名是bean类的参数名
            var date=content['date'].substring(0,10);//时间只显示日期
            blogContent=blogContent+'<div class="grid-item"> <div class="wrap-article"> <img class="img-circle text-center" src="<%=basePath%>images/'+content["imgname"]+'"> <p class="subtitle fancy"> <span>'+date+'</span> </p> <a href="<%=basePath%>blog/getBlog?id='+content["id"]+'";> <h3 class="title">'+content['blogname']+'</h3> </a> <div class="content-blog">'+content["blogcontent"]+'</div> </div> </div> </div>';
        });
            $("#blogs").empty();
         $("#blogs").append(blogContent);
        },
         error: function (data) {
              console.info("error: " + data.responseText);
         }
     });

    }

</script>
</body>
</html>
