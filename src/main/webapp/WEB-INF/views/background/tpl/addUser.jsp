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
    <script>
        //清空输入
        function clearInput(){
            $("#username").val("");
            $("#nickname").val("");
            $("#password").val("");
            $("#password2").val("");
        }
        //增加用户
        function addUser(){
            var data = {
                'username':$("#username").val(),
                'nickname':$("#nickname").val(),
                'password':$("#password").val(),
                'password2':$("#password2").val()};
            $.ajax({
                type:"POST",
                url:"<%=basePath%>user/addUser",
                dataType:"json",
                //contentType:"application/json", //不能添加这个头
                data:data, //这里不能进行JSON.stringify,发送请求的数据在:form data
                beforeSend: function () {
                    // 禁用按钮防止重复提交
                    $("#btn").attr({ disabled: "disabled" });
                },
                success:function(data){
                    if(data==1){
                        alertify.success("添加成功");
                        $("#username").val("");
                        $("#nickname").val("");
                        $("#password").val("");
                        $("#password2").val("");
                    }
                    else if(data==0){
                        alertify.error("请完善信息");
                    }
                    else if(data==-1){
                        alertify.error("账号已存在");
                    }else if(data==-2){
                        alertify.error("两次密码不一致");
                    }

                }, complete: function () {
                    $("#btn").removeAttr("disabled");
                },
                error: function (data) {
                    console.info("error: " + data.responseText);
                }
            });
        }
    </script>
</head>
<body>

<form role="form" class="col-md-10 col-md-offset-1">
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

    <div class="form-group">
        <label for="password">密码</label>
        <input type="password" class="form-control" id="password" name="password"
               placeholder="请输入密码">
    </div>

    <div class="form-group">
        <label for="password2">确认密码</label>
        <input type="password" class="form-control" id="password2" name="password2"
               placeholder="请确认密码">
    </div>



<%--<div class="form-group">--%>
        <%--<label for="password">确认密码</label>--%>
        <%--<input type="text" class="form-control" id="password" name="password"--%>
               <%--placeholder="请输入密码">--%>
    <%--</div>--%>
    <%--<div class="form-group">--%>
        <%--<label for="inputfile">文件输入</label>--%>
        <%--<input type="file" id="inputfile">--%>
        <%--<p class="help-block">这里是块级帮助文本的实例。</p>--%>
    <%--</div>--%>
    <%--<div class="checkbox">--%>
        <%--<label>--%>
            <%--<input type="checkbox"> 请打勾--%>
        <%--</label>--%>
    <%--</div>--%>
    <div style="padding-top: 100px">
        <!--此处用button，会出现问题，所以用a来代替-->
        <a href="#" id="clearInput" onclick="clearInput()" class="btn btn-danger col-md-1 col-md-offset-5">清空</a>
        <button type="submit" id="btn" onclick="addUser()" class="btn btn-success col-md-1 col-md-offset-1">提交</button>
    </div>

</form>

</body>
</html>