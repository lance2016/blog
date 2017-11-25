<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>个人主页</title>
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
                <a data-scroll="" href="<%=basePath%>user/admin">
                    <span>Background</span>
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
                            <span><a href="#">Blog</a></span>
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
                            <div class="grid-item">
                                <div class="wrap-article">
                                    <img alt="blog-1" class="img-circle text-center" src="<%=basePath%>images/blog-1.png">
                                    <p class="subtitle fancy">
                                        <span>09/01/2015</span>
                                    </p>
                                    <a href="#">
                                        <h3 class="title">
                                            Popular Design in 2015
                                        </h3>
                                    </a>
                                    <p class="content-blog">
                                        Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation.
                                    </p>
                                </div>
                            </div>

                            <div class="grid-item">
                                <div class="wrap-article">
                                    <img alt="blog-4" class="img-circle text-center" src="<%=basePath%>images/blog-4.jpg">
                                    <p class="subtitle fancy">
                                        <span>08/20/2015</span>
                                    </p>
                                    <a href="#">
                                        <h3 class="title">
                                            Just Start
                                        </h3>
                                    </a>
                                    <div class="content-blog">
                                        Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
                                    </div>
                                </div>
                            </div>

                            <div class="grid-item">
                                <div class="wrap-article">
                                    <img alt="blog6" class="img-circle text-center" src="<%=basePath%>images/blog-6.jpg">
                                    <p class="subtitle fancy">
                                        <span>08/11/2015</span>
                                    </p>
                                    <a href="#">
                                        <h3 class="title">
                                            The Huffington Post
                                        </h3>
                                    </a>
                                    <p class="content-blog">
                                        Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
                                    </p>
                                </div>
                            </div>

                            <div class="grid-item">
                                <div class="wrap-article">
                                    <img alt="blog2" class="img-circle text-center" src="<%=basePath%>images/blog-2.jpg">
                                    <p class="subtitle fancy">
                                        <span>08/03/2015</span>
                                    </p>
                                    <a href="#">
                                        <h3 class="title">
                                            Manuk!
                                        </h3>
                                    </a>
                                    <p class="content-blog">
                                        Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
                                    </p>
                                </div>
                            </div>

                            <div class="grid-item">
                                <div class="wrap-article">
                                    <img alt="blog5" class="img-circle text-center" src="<%=basePath%>images/blog-5.jpg">
                                    <p class="subtitle fancy">
                                        <span>07/26/2015</span>
                                    </p>
                                    <a href="#">
                                        <h3 class="title">
                                            Do Web Designer Really Need To Know UI/UX Design and Backend Code too?
                                        </h3>
                                    </a>
                                    <p class="content-blog">
                                        Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
                                    </p>
                                </div>
                            </div>

                            <div class="grid-item">
                                <div class="wrap-article">
                                    <img alt="blog-3" class="img-circle text-center" src="<%=basePath%>images/blog-3.jpg">
                                    <p class="subtitle fancy">
                                        <span>08/03/2015</span>
                                    </p>
                                    <a href="#">
                                        <h3 class="title">
                                            Somewhere Place
                                        </h3>
                                    </a>
                                    <p class="content-blog">
                                        Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit.
                                    </p>
                                </div>
                            </div>

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
                        <div class="col-sm-6 col-md-4">
                            <div class="thumbnail">
                                <a class="lightbox" href="images/bridge.jpg">
                                    <img src="<%=basePath%>images/bridge.jpg" alt="Bridge">
                                </a>
                                <div class="caption">
                                    <h3>Thumbnail label</h3>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-4">
                            <div class="thumbnail">
                                <a class="lightbox" href="images/tunnel.jpg">
                                    <img src="<%=basePath%>images/tunnel.jpg" alt="Tunnel">
                                </a>
                                <div class="caption">
                                    <h3>Thumbnail label</h3>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-4">
                            <div class="thumbnail">
                                <a class="lightbox" href="images/coast.jpg">
                                    <img src="<%=basePath%>images/coast.jpg" alt="Coast">
                                </a>
                                <div class="caption">
                                    <h3>Thumbnail label</h3>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-4">
                            <div class="thumbnail">
                                <a class="lightbox" href="images/rails.jpg">
                                    <img src="<%=basePath%>images/rails.jpg" alt="Rails">
                                </a>
                                <div class="caption">
                                    <h3>Thumbnail label</h3>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-4">
                            <div class="thumbnail">
                                <a class="lightbox" href="images/traffic.jpg">
                                    <img src="<%=basePath%>images/traffic.jpg" alt="Traffic">
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
                        <form>
                            <div class="group">
                                <input required="" type="text"><span class="highlight"></span><span class="bar"></span><label>姓名(Name)</label>
                            </div>
                            <div class="group">
                                <input required="" type="email"><span class="highlight"></span><span class="bar"></span><label>邮箱(Email)</label>
                            </div>
                            <div class="group">
                                <textarea required=""></textarea><span class="highlight"></span><span class="bar"></span><label>留言(Message)</label>
                            </div>
                            <input id="sendMessage" name="sendMessage" type="submit" value="留言(Send Message)">
                        </form>
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



<!--登陆 -->

<!-- 登录模态框（Modal） -->
<!--data-backdrop="static" data-keyboard="false"   点击空白和按esc键不退出-->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"  data-backdrop="static" data-keyboard="false" >
    <div class="modal-dialog"  >
        <div class="modal-content" style="width: 300px;padding-bottom: 40px;padding-left: 10px;padding-right: 10px;margin: 30% auto;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title text-primary" id="myModalLabel">
                    登陆
                </h4>
            </div>
            <div class="modal-body">
                    <div class="form-group">
                        <input type="text" class="form-control" name="username" id="username" placeholder="请输入账号">
                    </div>

                    <div class="form-group">
                        <input type="password" class="form-control" name="password" id="password" placeholder="请输入密码">
                    </div>

                    <button type="submit" id="btn" onclick="ajaxTest();" class="btn btn-default pull-right btn-success">登录</button>

            </div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>


<!-- 博客显示模态框（Modal） -->
<!--data-backdrop="static" data-keyboard="false"   点击空白和按esc键不退出-->
<div class="modal"  style="width:100%"  id="blogModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"  data-backdrop="static" data-keyboard="false" >
    <div class="modal-dialog" style="width:80%;margin: 0 auto;" >
        <div class="modal-content"  >
            <div class="modal-header" >
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <div class="pull-left">
                    <img src="<%=basePath%>images/blog-1.png" width="40px" class="img-circle"/>
                </div>

                <div  id="blogName" class="modal-title text-primary  text-center" >
                    Blog
                </div>

            </div>
            <div class="modal-body" >
                <div class="col-md-12 text-center" id="detail" style="color: grey;font-size: 13px">
                    <div id="author"  style="line-height: 13px;display: inline-block;">
                        authorName
                    </div>
                    <div id="createTime" style="line-height: 13px;display: inline-block;">
                        time
                    </div>
                    <div id="visitTimes" style="line-height: 13px;display: inline-block;">
                        访问次数
                    </div>
                </div>
                <div id="blogContent" >
                        this is the concrete content
                </div>
            </div>
        </div><!-- /.modal-content -->
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
    //清空输入
    function clearInput(){
        $("#username").val("");
        $("#password").val("");
    }

    //登录
    function ajaxTest(){
        var data = {
            'username':$("#username").val(),
            'password':$("#password").val()};
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/user/login",
            dataType:"json",
            //contentType:"application/json", //不能添加这个头
            data:data, //这里不能进行JSON.stringify,发送请求的数据在:form data
            beforeSend: function () {
                // 禁用按钮防止重复提交
                $("#btn").attr({ disabled: "disabled" });
            },
            success:function(data){
                if(data=="1"){
                    //跳转页面
                    clearInput();
                    alertify.success("登陆成功");
                    setTimeout(function () {
                            window.location.href="${pageContext.request.contextPath}/user/admin";
                        },
                        500);

                }
                else{
                    alertify.error("用户名或密码错误");
                }

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


                $("#blogs").html(blogContent);
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
                $(locate).html(msg);
            }
        });
    }


    <%--function findBlog(id) {--%>
        <%--$.ajax({--%>
            <%--type: "POST",--%>
            <%--url: "<%=basePath%>blog/getBlogById?id="+id,--%>
            <%--dataType: "json",--%>
            <%--success: function (data) {--%>
                <%--//alert(data["blogContent"]);--%>
                <%--load("second","#index");--%>
                <%--$("#blogName").text(data['blogname']);--%>
                <%--$("#blogContent").html(data['blogcontent']);--%>
                <%--$("#author").text("作者:"+data['author']);--%>
                <%--$("#createTime").text("创建时间:"+data['date']);--%>
                <%--$("#visitTimes").text("访问次数:"+data['visittime']);--%>
                <%--$('#blogModal').modal('show');--%>
                 <%--alert(data);--%>
            <%--}--%>
        <%--});--%>
    <%--}--%>
    baguetteBox.run('.tz-gallery');
    //模态框消失后清空表单内容
    $(function () { $('#myModal').on('hide.bs.modal', function () {
        clearInput();
    });
    });
</script>

</html>