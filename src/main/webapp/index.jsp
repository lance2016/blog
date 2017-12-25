<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>lance的博客</title>
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <meta content="Bodo - Simple One Page Personal" name="description">
    <meta content="BdgPixel" name="author">
    <!--Fav-->
    <link rel="icon" href="<%=basePath%>images/fate.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="<%=basePath%>images/fate.ico" type="image/x-icon" />
    <!--styles-->
    <%--<link href="css/bootstrap.min.css" rel="stylesheet">--%>
    <link href="<%=basePath%>css/owl.carousel.css" rel="stylesheet">
    <link href="<%=basePath%>css/owl.theme.css" rel="stylesheet">
    <link href="<%=basePath%>css/magnific-popup.css" rel="stylesheet">
    <link href="<%=basePath%>css/style.css" rel="stylesheet">
    <link href="<%=basePath%>css/responsive.css" rel="stylesheet">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">

    <!--font-awesome 核心我CSS 文件-->
    <link href="//cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

    <!--fonts google-->
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,700' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,300,500,700' rel='stylesheet' type='text/css'>
    <!--alert css-->
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/alertify.default.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/alertify.core.css">
    <!--gallery-->
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/htmleaf-demo.css">
    <link rel="stylesheet" href="<%=basePath%>css/baguetteBox.min.css">
    <link rel="stylesheet" href="<%=basePath%>css/thumbnail-gallery.css">
    <link rel="stylesheet" href="<%=basePath%>css/index.css">
    <script src="<%=basePath%>js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="<%=basePath%>js/html5shiv.min.js"></script>
    <![endif]-->




</head>
<body id="index">
<!--PRELOADER-->
<div id="preloader">
    <div id="status">
        <img alt="logo" src="<%=basePath%>images/logo-big.png">
    </div>
</div>
<!--/.PRELOADER END-->

<!--HEADER -->
<div class="header">
    <div class="for-sticky">
        <!--LOGO-->
        <div class="col-md-2 col-xs-6 logo">
            <a href="<%=basePath%>user/admin"><img alt="logo" class="logo-nav" src="<%=basePath%>images/logo.png" ></a>
        </div>
        <!--/.LOGO END-->
        <!--log in-->
        <div class="col-md-2 col-md-offset-8">
            <%--<a href="javascript:void(0);" data-toggle="modal" id="login" data-target="#myModal" style="line-height:50px;color:cornflowerblue;text-decoration: none">--%>
                <%--log in--%>
            <%--</a>--%>
        </div>
    </div>
    <div class="menu-wrap">
        <nav class="menu">
            <div class="menu-list">
                <a data-scroll="" href="#home" class="active">
                    <span>Home</span>
                </a>

                <a data-scroll="" href="#blog">
                    <span>Blog</span>
                </a>
                <a data-scroll="" href="#album">
                    <span>Album</span>
                </a>
                <a data-scroll="" href="#contact">
                    <span>Contact</span>
                </a>
                <a  href="<%=basePath%>user/admin">
                    <span>Background</span>
                </a>
                <a  href="javascript:void(0);" data-toggle="modal"  data-target="#myModal" style="color:cornflowerblue;text-decoration: none;">
                    <span>login</span>
                </a>
                <a  href="<%=basePath%>logout" >
                    <span>logout</span>
                </a>

            </div>
        </nav>
        <button class="close-button" id="close-button">Close Menu</button>
    </div>
    <button class="menu-button" id="open-button">
        <span></span>
        <span></span>
        <span></span>
    </button><!--/.for-sticky-->
</div>
<!--/.HEADER END-->

<!--CONTENT WRAP-->
<div class="content-wrap">
    <!--CONTENT-->
    <div class="content">
        <!--HOME-->
        <section id="home">
            <div class="container">
                <div class="row">
                    <div class="wrap-hero-content">
                        <div class="hero-content">
                            <h1>
                                <a href="javascript:void(0);" data-toggle="modal"  data-target="#myModal" style="line-height:50px;color:cornflowerblue;text-decoration: none">Hello</a>
                            </h1>
                            <br>
                            <span class="typed"></span>
                        </div>
                    </div>
                    <div class="mouse-icon margin-20">
                        <div class="scroll"></div>
                    </div>
                </div>
            </div>
        </section>
        <!--/.HOME END-->




        <!--BLOG-->
        <section class="grey-bg" id="blog">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h3 class="title-small-center text-center item-title" >
                            <span><a href="<%=basePath%>blog/getSecond">Blog</a></span>
                        </h3>
                        <div class="row">
                            <div class="col-md-6 col-md-offset-3">
                                <p class="content-details text-center text-muted">
                                    Keep a record of what happened every single day
                                </p>
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
        <!--/.BLOG END-->



        <!--album start style.css-->
        <selection id="album" class="white-bg" >
            <div class="container">

                <div class="col-md-12">
                    <h3 class="title-small-center text-center item-title">
                        <span><a href="#">Album</a></span>
                    </h3>
                    <div class="row">
                        <div class="col-md-6 col-md-offset-3">
                            <p class="content-details text-center text-muted">
                                Keep a record of what happened every single day
                            </p>
                        </div>
                    </div>
                </div>


                <div class="tz-gallery">

                    <div class="row">

                        <div class="col-sm-6 col-md-4">
                            <div class="thumbnail">
                                <a class="lightbox" href="images/park.jpg">
                                    <img src="<%=basePath%>images/park.jpg" alt="Park">
                                </a>
                                <div class="caption">
                                    <h3>Thumbnail label</h3>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>

            </div>


        </selection>

        <!--CONTACT-->
        <section id="contact" class="grey-bg">
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <h3 class="title-small item-title">
                            <span><a href="#">Contact Me</a></span>
                        </h3>
                        <p class="content-detail text-muted">
                            如果想联系我，请在右方留言<br/>
                            If you want to contact me, leave a message on the right
                        </p>

                    </div>
                    <div class="col-md-9 content-right">
                            <div class="group">
                                <input required="" type="text" id="messageName" placeholder="姓名（Name)">
                            </div>
                            <div class="group">
                                <input required="" type="email" id="messageEmail" placeholder="邮箱(Email)">
                            </div>
                            <div class="group">
                                <textarea required="" id="contentMessage" placeholder="留言(Message)"></textarea>
                            </div>
                            <button onclick="sendMessage()" id="messageBtn" class="btn btn-default pull-right btn-success" >留言(Send Message)</button>
                    </div>
                </div>
            </div>
        </section>
        <!--CONTACT END-->


        <!--FOOTER-->
        <footer>
            <div class="footer-top">
                <ul class="socials">
                    <li class="facebook">
                        <a href="#" data-hover="暂不提供">新浪微博</a>
                    </li>
                    <li class="twitter">
                        <a href="#" data-hover="暂不提供">微信</a>
                    </li>
                    <li class="zhifu">
                        <a href="#" data-hover="点击向我付款">支付</a>
                    </li>
                </ul>
            </div>

            <div class="white-bg" >
                <div class="container">

                    <a href="javascript:alert('欢迎访问我的博客');"> <img src="<%=basePath%>images/lance.png" width="120px" alt="logo bottom" class="center-block" /></a>

                </div>
            </div>
        </footer>
        <!--/.FOOTER-END-->

        <!--/.CONTENT END-->
    </div>
    <!--/.CONTENT-WRAP END-->
</div>

<style>

    .form-horizontal{
        background: #fff;
        padding-bottom: 40px;
        border-radius: 15px;
        text-align: center;
    }

    .form-horizontal .form-group{
        padding: 0 40px;
        margin: 0 0 20px 0;
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
    .form-horizontal .fa-eye{
        display: inline-block;
        position: absolute;
        top: 12px;
        right: 60px;
        font-size: 20px;
        color: #808080;
        transition: all 0.5s ease 0s;
    }
    .form-horizontal .fa-eye:hover{
        color: #000;
    }


</style>

<!--登陆 -->

<!-- 登录模态框（Modal） -->
<!--data-backdrop="static" data-keyboard="false"   点击空白和按esc键不退出-->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"  data-backdrop="static" data-keyboard="false" >
    <div class="modal-dialog"  >
        <div class="modal-content" style="width: 300px;padding-bottom: 20px;margin: 30% auto;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                        <span onclick="changeState('login');" style="color: #0f74a8;font-size:20px;line-height: 30px"; class="col-md-6 text-right"> 登陆</span>
                        <span onclick="changeState('register');" style="color: #0f74a8;font-size: 20px;line-height: 30px"; class="col-md-5 text-left">注册</span>
            </div>
            <div class="modal-body"  >

                    <form class="form-horizontal"  id="login" style="display: block" onsubmit="return false;" >

                                        <div class="form-group">
                                            <input type="email" class="form-control" id="username" placeholder="用户名或电子邮件">
                                            <i class="fa fa-user"></i>
                                        </div>
                                        <div class="form-group help">
                                            <input type="password" class="form-control" id="password" placeholder="密　码">
                                            <i class="fa fa-lock"></i>
                                            <a href="javascript:void(0)"  onmousedown='checkPassword()' onmouseup="backPassword()" class="fa fa-eye"></a>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" id="code" placeholder="验证码">
                                            <i class="fa fa-picture-o" aria-hidden="true"></i>
                                        </div>
                                        <div class="col-md-10 col-md-offset-1" style="margin-top:0px">
                                            <img class="imgObj" alt="验证码"  onclick="changeImg()"  src="<%=basePath%>user/code" />
                                        </div>
                                        <input type="reset" value="清空" class="btn btn-danger col-md-3 col-md-offset-2" >
                                        <button type="submit"   id="btn" onclick="login();" class="btn btn-default col-md-3 col-md-offset-2 btn-success"  >登录</button>
                                    </form>

                    <form class="form-horizontal" id="register" style="display: none" onsubmit="return false;">

                        <div class="form-group">
                            <input type="text" class="form-control" id="uname" placeholder="用户名或电子邮件">
                            <i class="fa fa-user"></i>
                        </div>
                        <div class="form-group help">
                            <input type="text" class="form-control" id="pwd" placeholder="密码" >
                            <i class="fa fa-lock"></i>
                            <a href="#" class="fa fa-eye"></a>
                        </div>
                        <div class="form-group help">
                            <input type="text" class="form-control" id="pwd2" placeholder="确认密码">
                            <i class="fa fa-lock"></i>
                            <a href="#" class="fa fa-eye"></a>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" id="code2" placeholder="验证码">
                            <i class="fa fa-picture-o" aria-hidden="true"></i>
                        </div>
                        <div class="col-md-6 col-md-offset-3 text-left" style="padding-top: 0px" >
                            <img class="imgObj" alt="验证码" class="col-md-5 col-md-offset-2" onclick="changeImg()"  src="<%=basePath%>user/code" />
                        </div>
                        <input type="reset" value="清空" class="btn btn-danger col-md-3 col-md-offset-2">
                        <button type="submit"  id="btnR" onclick="register();" class="btn btn-default col-md-3 col-md-offset-2 btn-success"  >注册</button>
                </form>




              </div><!-- /.modal-content -->
        </div>


    </div><!-- /.modal -->
</div>


</body>
<script type="text/javascript" src="<%=basePath%>js/baguetteBox.min.js"></script>
<script src="<%=basePath%>js/jquery.appear.js" type="text/javascript"></script>
<script src="<%=basePath%>js/bootstrap.min.js" type="text/javascript"></script>
<script src="<%=basePath%>js/classie.js" type="text/javascript"></script>
<script src="<%=basePath%>js/owl.carousel.min.js" type="text/javascript"></script>
<script src="<%=basePath%>js/jquery.magnific-popup.min.js" type="text/javascript"></script>
<script src="<%=basePath%>js/masonry.pkgd.min.js" type="text/javascript"></script>
<script src="<%=basePath%>js/masonry.js" type="text/javascript"></script>
<script src="<%=basePath%>js/smooth-scroll.min.js" type="text/javascript"></script>
<script src="<%=basePath%>js/typed.js" type="text/javascript"></script>
<script src="<%=basePath%>js/main.js" type="text/javascript"></script>
<script src="<%=basePath%>js/alertify.min.js" type="text/javascript"></script><!--alertify提醒-->

<script>

    function checkPassword(){
        $("#password").attr("type","text");

    }
    function backPassword(){
        $("#password").attr("type","password");
    }
    //切换登录注册
    function changeState(state){
        changeImg();
        if(state=="login"){
            $("#register").css("display","none");
            $("#login").css("display","block");
        }else{
            $("#register").css("display","block");
            $("#login").css("display","none");
        }
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
    //清空输入
    function clearInput(){
        $("#username").val("");
        $("#password").val("");
    }
    //注册
    function register(){
        var data = {
            'username':$("#uname").val(),
            'password':$("#pwd").val(),
            'password2':$("#pwd2").val(),
            'code2'    :$("#code2").val()};
        $.ajax({
            type: "POST",
            url: "<%=basePath%>user/register",
            dataType: "json",
            //contentType:"application/json", //不能添加这个头
            data: data, //这里不能进行JSON.stringify,发送请求的数据在:form data
            beforeSend: function () {
                // 禁用按钮防止重复提交
                $("#btn2").attr({disabled: "disabled"});
            },
            success: function (data) {
                changeImg();
                if (data == 1) {
                    alertify.success("注册成功");
                } else if(data==-2)
                    alertify.error("信息不完整");
                else if(data==-1)
                    alertify.error("两次密码不一致");
                else if(data==0)
                    alertify.error("验证码错误");
                else if(data==2)
                    alertify.error("该账号已注册");
            }, complete: function () {
                $("#btn").removeAttr("disabled");
            },
            error: function (data) {
                console.info("error: " + data.responseText);
            }
        });
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

//加载blog
    $(document).ready(function () {
       getAllBlogs();
    });

    function getAllBlogs() {
        $.ajax({
            type:"POST",
            url:"<%=basePath%>blog/getBlogForIndex",
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
    //利用ajax不更新切换右侧div内容
    function  load(testUrl,locate) {
        $.ajax({
            url:"<%=basePath%>blog/getJsp?tpl="+testUrl,
            async:false,
            type:"get",
            dataType:"html",
            success:function(msg){
                $(locate).empty();
                $(locate).append(msg);
            }

        });
    }

    function sendMessage() {
        var data={
            name:$("#messageName").val(),
            email:$("#messageEmail").val(),
            content:$("#contentMessage").val()
        };
        $.ajax({
            url:"<%=basePath%>message/saveMessage",
            async:true,
            type:"POST",
            dataType:"json",
            data:data,
            beforeSend: function () {
                // 禁用按钮防止重复提交
                $("#messageBtn").attr({ disabled: "disabled" });
            },
            success:function(data){
               if(data==1)
                   alertify.success("保存成功");
               else if(data==-1)
                   alertify.log("邮箱格式不正确");
                else if(data==0)
                   alertify.error("信息不完整");
            },complete: function () {
                $("#messageBtn").removeAttr("disabled");
            },

        });
    }
    baguetteBox.run('.tz-gallery');
    //模态框消失后清空表单内容
    $(function () { $('#myModal').on('hide.bs.modal', function () {
        clearInput();
    });
    });
</script>

</html>