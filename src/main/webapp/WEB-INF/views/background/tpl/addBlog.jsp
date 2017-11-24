<%--
  Created by IntelliJ IDEA.
  User: lance
  Date: 2017/11/22
  Time: 14:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>增加用户</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/ckeditor/ckeditor.js"></script>

    <style>
        .container{
            padding: 0px;
        }
    </style>
</head>
<body>

<form role="form" class="col-md-10 col-md-offset-1">
    <div class="form-group">
        <label for="blogname">标题</label>
        <input type="text" class="form-control" id="blogname" name="blogname"
               placeholder="请输入标题">
    </div>

    <div class="form-group">
        <label for="author">作者</label>
        <input type="text" class="form-control" id="author" name="author"
               placeholder="请输入作者">
    </div>



    <label for="hot">是否置顶</label>
    <select class="form-control" id="hot" name="hot">
        <option value="0">不置顶</option>
        <option value="1">置顶</option>
    </select>

    <div class="form-group">
        <label for="blogcontent">文章内容</label>
        <textarea  name="opinion" rows="10" cols="38" id="blogcontent"></textarea>
    </div>




    <div style="padding-top: 20px">
        <!--此处用button，会出现问题，所以用a来代替-->
        <a href="javascript:void(0)" id="clearInput" onclick="clearInput()" class="btn btn-danger col-md-1 col-md-offset-9">清空</a>
        <button type="submit" id="btn" onclick="addBlog()" class="btn btn-success col-md-1 col-md-offset-1">提交</button>
    </div>

</form>


<script type="text/javascript">
    var editors=CKEDITOR.replace('blogcontent');

    //清空输入
    function clearInput(){
        $("#blogname").val("");
        $("#blogContent").val("");
        $("#author").val("");
        $("#hot").val("0");
        CKEDITOR.instances.blogcontent.setData('');

    }
    //增加用户
    function addBlog(){
        var data = {
            'blogname':     $("#blogname").val(),
            'author':       $("#author").val(),
            'blogcontent':CKEDITOR.instances.blogcontent.getData(),
            'hot':          $("#hot").val()
        };
        $.ajax({
            type:"POST",
            url:"<%=basePath%>blog/addBlog",
            dataType:"json",
            //contentType:"application/json", //不能添加这个头
            data:data, //这里不能进行JSON.stringify,发送请求的数据在:form data

            success:function(data){
                if(data==1){
                    alertify.success("添加成功");
                   clearInput();
                }
                else
                    alertify.error("两次密码不一致");

            },
            error: function (data) {
                console.info("error: " + data.responseText);
            }
        });
    }
</script>


</body>
</html>