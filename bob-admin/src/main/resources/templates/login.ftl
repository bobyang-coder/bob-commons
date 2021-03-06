<!DOCTYPE html>
<!--[if IE 9 ]><html class="ie9"><![endif]-->
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>
    <meta name="format-detection" content="telephone=no">
    <meta charset="UTF-8">

    <meta name="description" content="Violate Responsive Admin Template">
    <meta name="keywords" content="Super Admin, Admin, Template, Bootstrap">

    <title>Super Admin Responsive Template</title>

    <!-- CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/form.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/generics.css" rel="stylesheet">
</head>
<body id="skin-blur-violate">
<section id="login" style="text-align: center">
    <header>
        <h1>超级管理员</h1>
        <p>bob专用超级后台管理系统</p>
    </header>

    <div class="clearfix"></div>

    <!-- 登录 -->
    <form class="box tile animated active" style="text-align: center;" id="box-login">
        <h2 class="m-t-0 m-b-15">登录</h2>
        <input type="text" class="login-control m-b-10" placeholder="用户名/邮箱">
        <input type="password" class="login-control" placeholder="密码">
        <div class="checkbox m-b-20">
            <label>
                <input type="checkbox">
                记住我
            </label>
        </div>
        <button class="btn btn-sm m-r-5">登录</button>

        <small>
            <a class="box-switcher" data-switch="box-register" href="">无账户?</a> or
            <a class="box-switcher" data-switch="box-reset" href="">忘记密码?</a>
        </small>
    </form>

    <!-- 注册 -->
    <form class="box animated tile" id="box-register">
        <h2 class="m-t-0 m-b-15">注册</h2>
        <input type="text" class="login-control m-b-10" placeholder="Full Name">
        <input type="text" class="login-control m-b-10" placeholder="用户名">
        <input type="email" class="login-control m-b-10" placeholder="邮箱">
        <input type="password" class="login-control m-b-10" placeholder="密码">
        <input type="password" class="login-control m-b-20" placeholder="确认密码">

        <button class="btn btn-sm m-r-5">注册</button>

        <small><a class="box-switcher" data-switch="box-login" href="">已有账户?</a></small>
    </form>

    <!-- 忘记密码 -->
    <form class="box animated tile" id="box-reset">
        <h2 class="m-t-0 m-b-15">重置密码</h2>
        <p>bob专用超级后台管理系统</p>
        <input type="email" class="login-control m-b-20" placeholder="邮箱">

        <button class="btn btn-sm m-r-5">确认</button>

        <small><a class="box-switcher" data-switch="box-login" href="">已有账户?</a></small>
    </form>
</section>

<!-- Javascript Libraries -->
<!-- jQuery -->
<script src="js/jquery.min.js"></script> <!-- jQuery Library -->

<!-- Bootstrap -->
<script src="js/bootstrap.min.js"></script>

<!--  Form Related -->
<script src="js/icheck.js"></script> <!-- Custom Checkbox + Radio -->

<!-- All JS functions -->
<script src="js/functions.js"></script>
</body>
</html>
