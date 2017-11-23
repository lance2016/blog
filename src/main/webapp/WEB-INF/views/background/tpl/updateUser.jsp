<%--
  Created by IntelliJ IDEA.
  User: lance
  Date: 2017/11/23
  Time: 8:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>Title</title>
    <script>
        //更新用户
        function  updateUser() {
            var data={
                'username':$("#username").val(),
                'nickname':$("#nickname").val()
            };
            $.ajax({
                type:"POST",
                url:"<%=basePath%>user/updateUser?id="+$("#id").val(),
                dataType:"json",
                data:data,
                success:function(data){
                    if(data==1)
                         alertify.success("修改成功");
                    else
                        console.log("发生了点问题，返回值"+data);
                },
                error: function (data) {
                    alertify.error("修改失败");
                    console.info("error: " + data.responseText);
                }
            });

        }
    </script>
</head>
<body>
    <form role="form" class="col-md-10 col-md-offset-1">
        <div class="form-group">
            <label for="id">id</label>
            <input type="text" class="form-control" id="id" name="id"
                   placeholder="请输入id">
        </div>
        <div class="form-group">
            <label for="username">用户名</label>
            <input type="text" class="form-control" id="username" name="username"
                   placeholder="请输入用户名">
        </div>

        <div class="form-group">
            <label for="nickname">昵称</label>
            <input type="text" class="form-control" id="nickname" name="nickname"
                   placeholder="请输入昵称">
        </div>
        <div style="padding-top: 100px">
            <!--此处用button，会出现问题，所以用a来代替-->
            <a href="#" id="clearInput" onclick="listAllUsers()" class="btn btn-danger col-md-1 col-md-offset-5">返回</a>
            <button type="submit" id="btn" onclick="updateUser()" class="btn btn-success col-md-1 col-md-offset-1">修改</button>
        </div>

    </form>

</body>
</html>
