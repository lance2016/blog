<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/alertify.default.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/alertify.core.css">
    <title>登录</title>
    <script type="text/javascript" src="<%=basePath%>js/jquery-3.2.1.min.js"></script>

   <style>


       .form-horizontal{
           background: #fff;
           padding-bottom: 80px;
           border-radius: 15px;
           text-align: center;
       }



       .form-horizontal .form-group{
           padding: 0 40px;
           margin: 0 0 25px 0;
           position: relative;
       }

       .form-horizontal .form-control{
           background: #f0f0f0;
           border: none;
           border-radius: 20px;
           box-shadow: none;
           padding: 0 20px 0 45px;
           height: 40px;
           transition: all 0.3s ease 0s;
       }
       .form-horizontal .heading{
           display: block;
           font-size: 35px;
           font-weight: 700;
           padding: 35px 0;
           border-bottom: 1px solid #f0f0f0;
           margin-bottom: 30px;
       }

       .form-horizontal .form-control:focus{
           background: #e0e0e0;
           box-shadow: none;
           outline: 0 none;
       }

       .form-horizontal .form-group i{
           position: absolute;
           top: 12px;
           left: 60px;
           font-size: 17px;
           color: #c8c8c8;
           transition : all 0.5s ease 0s;
       }





       .form-horizontal .form-control:focus + i{
           color: #00b4ef;
       }
       .form-horizontal .main-checkbox label{
           width: 20px;
           height: 20px;
           position: absolute;
           top: 0;
           left: 0;
           cursor: pointer;
       }
       .form-horizontal .main-checkbox label:after{
           content: "";
           width: 10px;
           height: 5px;
           position: absolute;
           top: 5px;
           left: 4px;
           border: 3px solid #fff;
           border-top: none;
           border-right: none;
           background: transparent;
           opacity: 0;
           -webkit-transform: rotate(-45deg);
           transform: rotate(-45deg);
       }
       .form-horizontal .main-checkbox input[type=checkbox]{
           visibility: hidden;
       }
       .form-horizontal .main-checkbox input[type=checkbox]:checked + label:after{
           opacity: 1;
       }

       .fa-eye{
           position: absolute;
          right:70px;
           top:13px;
       }

       .form-horizontal .main-checkbox{
           float: left;
           width: 20px;
           height: 20px;
           background: #11a3fc;
           border-radius: 50%;
           position: relative;
           margin: 5px 0 0 5px;
           border: 1px solid #11a3fc;
       }
       .form-horizontal .main-checkbox label{
           width: 20px;
           height: 20px;
           position: absolute;
           top: 0;
           left: 0;
           cursor: pointer;
       }
       .form-horizontal .main-checkbox label:after{
           content: "";
           width: 10px;
           height: 5px;
           position: absolute;
           top: 5px;
           left: 4px;
           border: 3px solid #fff;
           border-top: none;
           border-right: none;
           background: transparent;
           opacity: 0;
           -webkit-transform: rotate(-45deg);
           transform: rotate(-45deg);
       }
       .form-horizontal .main-checkbox input[type=checkbox]{
           visibility: hidden;
       }
       .form-horizontal .main-checkbox input[type=checkbox]:checked + label:after{
           opacity: 1;
       }
       .form-horizontal .text{
           float: left;
           margin-left: 7px;
           line-height: 20px;
           padding-top: 5px;
           text-transform: capitalize;
       }
       .warning-text{
           text-align:center;
           border:2px solid #a1a1a1;
           padding:10px 40px;
           background: #aa1111;
           color: black;
           font-size: 14px;
           border-radius:25px;
           -moz-border-radius:25px; /* 老的 Firefox */
       }



   </style>
</head>
<body onload='document.f.username.focus();' style="padding-top: 200px;">
<div class="container">
    <form class="form-horizontal col-md-4 col-md-offset-4"  action='<%=basePath%>user/login'  onsubmit="return false;" method="post" name="f" style="display: block;background-color: #0f74a8"  >

        <span class="heading">用户登录</span>
        <div class="form-group">
            <input type="text" class="form-control" id="username" name="username" placeholder="用户名或电子邮件">
            <i class="fa fa-user"></i>
        </div>

        <div class="form-group help">
            <input type="password" class="form-control" id="password"  name="password" placeholder="密　码">
            <i class="fa fa-lock"></i>
            <a href="javascript:void(0)"  onmousedown='checkPassword()' onmouseup="backPassword()" class="fa fa-eye"></a>
        </div>

        <div class="form-group">
            <input type="text" class="form-control" id="code" name="code" placeholder="验证码">
            <i class="fa fa-picture-o" aria-hidden="true"></i>
        </div>
        <img class="imgObj" alt="验证码"  onclick="changeImg()"   src="<%=basePath%>user/code" />



        <div class="form-group">
            <div class="main-checkbox">
                <input id="remember-me" name="remember-me" type="checkbox" checked="checked"/>
                <label for="remember-me"></label>
            </div>
            <span class="text">Remember me</span>
            <input type="reset" value="清空" class="btn btn-danger col-md-2 col-md-offset-1" >
            <button type="submit"   id="btn" onclick="login();" class="btn btn-default col-md-2 col-md-offset-1 btn-success"  >登录</button>
        </div>



        <div class="col-md-10 col-md-offset-1 warning-text">
            <c:if test="${param.logout=='logout'}"><div class="logout">已注销</div></c:if>
            <c:if test="${param.error=='error'}" ><div class="danger">有错误，请重试</div></c:if>
        </div>

    </form>


</div>

</body>
</html>
<script src="<%=basePath%>js/alertify.min.js" type="text/javascript"></script><!--alertify提醒-->
<script>

    function clearInput(){
        $("#username").val("");
        $("#password").val("");
    }

    function checkPassword(){
        $("#password").attr("type","text");

    }
    function backPassword(){
        $("#password").attr("type","password");
    }


    //更新二维码
    function changeImg() {
        var src = $(".imgObj").attr("src");
        $.ajax({
            type:"GET",
            url:"${pageContext.request.contextPath}/user/code",
            success:function () {
                src=convertUrl(src);
                $('.imgObj').attr("src",src);
            },error:function (jqXHR) {
                console.info("error: " + jqXHR.responseText);
                //   alert(jqXHR.error);

            }
        });
    }
    //添加时间戳
    function convertUrl(url) {
        var timestamp = (new Date()).valueOf();
        if (url.indexOf("?") >= 0) {
            url = url + "&t=" + timestamp;
        } else {
            url = url + "?t=" + timestamp;
        }
        return url;
    }

    //登录
    function login(){
        var data = {
            'username':$("#username").val(),
            'password':$("#password").val(),
            'code'    :$("#code").val()};
        $.ajax({
            type:"POST",
            url:"<%=basePath%>user/login",
            dataType:"json",
            //contentType:"application/json", //不能添加这个头
            data:data, //这里不能进行JSON.stringify,发送请求的数据在:form data
            beforeSend: function () {
                // 禁用按钮防止重复提交
                $("#btn").attr({ disabled: "disabled" });
            },
            success:function(data){
                changeImg();
                if(data=="1"){
                    //跳转页面
                    clearInput();
                    alertify.success("登陆成功");
                    setTimeout(function () {
                            window.location.href="${pageContext.request.contextPath}/user/admin";
                        },
                        500);
                }
                else if(data=="0"){
                    alertify.error("用户名或密码错误");
                }
                else if(data=="-1"){
                    alertify.error("验证码错误");
                }else if(data=="-2"){
                    alertify.error("输入信息不完整");
                }else if(data=="-3"){
                    alertify.error("该账号未注册");
                }else if(data=='-4')
                    alertify.error("没有权限");


            }, complete: function () {
                $("#btn").removeAttr("disabled");
            },
            error: function (data) {
                console.info("error: " + data.responseText);
            }

        });
    }

</script>