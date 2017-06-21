<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="RegisterInterface" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>欢迎来到校内购物便利系统</title>
    <link rel="stylesheet" href="css/normal.css"/>
    <link rel="stylesheet" href="css/fontcss.css"/>
<style>
    html, 
    body { width:100%; height:100%; }
    body { background-image:url("img/bg/Loginbg02.jpg"); background-size:cover; }
    
    /* container start */
    .wrap {
        position:absolute;
        width:370px; height:300px; left:50%; top:50%;
        transform:translate(-50%, -50%); overflow:hidden;
        background:rgba(0,0,0,0.3);
    }
    .container { 
        width:370px; height:1200px; 
        transition:all 0.6s; -webkit-transition:all 0.6s; -moz-transition:all 0.6s;
        border-radius:10px; }
    #container-1,
    #container-2 { 
        width:370px; height: 550px; 
        padding-top:50px; text-align:center; font-size:24px;
        border-radius:10px;}
    #container-2 { padding-top:30px; }
    #username-login,
    #password-login,
    #username-regis,
    #password-regis,
    #re-password-regis { 
        width:300px; height:40px; margin-left:10px; margin-top:5px;
        font-size:18px; font-weight:600; line-height:40px; color:#fff;
        background: rgba(0,0,0,0); border:none;
    }
    .iconfont { color:#fff; }
    #container-1 .line,
    #container-2 .line { 
        width: 350px; margin: 0 auto;
        border-top: 2px solid #fff; }
    .btn { 
        width:350px; height: 40px;
        color: #fff; line-height:40px; text-align:center; font-size:18px; font-family:'Microsoft YaHei UI'; font-weight:200;
        background:#1b2838;  border-radius:20px;  border:none; cursor:pointer;
    }
    #btn-login { margin:90px auto 0; }
    #btn-regis { margin:50px auto 0; }

    /* nav start && container end */
    
    #controller-1,
    #controller-2 {
        position:fixed; z-index:5;
        opacity:0; cursor:pointer;}
    #controller-1 + a,
    #controller-2 + a {
        position:absolute; z-index:4;
        line-height: 40px; text-align:center; font-size:16px;color:#5c9b3f; 
        background:transparent; 
        transition:all 0.5s; -webkit-transition:all 0.5s; -moz-transition:all 0.5s;}
    #controller-1, #controller-1 + a { right:250px; top:0;}
    #controller-2, #controller-2 + a { right:150px; top:0;}
    
    #controller-1,
    #controller-1 + a ,
    #controller-2,
    #controller-2 + a { 
        display:inline-block;
        width:100px; height:40px; top:20px;
    }
    #controller-1:checked + a,
    #controller-2:checked + a{ 
        background:#5c9b3f;
        color:#fff;}

    #controller-1:checked ~ #wrap #container{ 
        transform:translateY(0);-webkit-transform: translateY(0);-moz-transform:translateY(0); -o-transform:translateY(0);
    }
    #controller-2:checked ~ #wrap #container{ 
        transform:translateY(-50%); -webkit-transform: translateY(-50%);-moz-transform:translateY(-50%); -o-transform:translateY(-50%);
    }

</style>
</head>
<body>
    <input type="radio" name="radioset" checked="checked" id="controller-1" class="controller"/>
    <a>登录</a>
    <input type="radio" name="radioset" id="controller-2" class="controller"/>
    <a>注册</a>
    <div id="wrap" class="wrap">
        <div id="container" class="container">
            <div id="container-1">
                <i class="iconfont">&#xe617;</i>
                <input type="text" id="username-login" placeholder="用户名"/>
                <hr class="line"/>
                <i class="iconfont">&#xe633;</i>
                <input type="password" id="password-login" placeholder="密码"/>
                <hr class="line"/>
                <input type="button" class="btn" id="btn-login" value="登录"/>
            </div>
            <div id="container-2">
                <i class="iconfont">&#xe617;</i>
                <input type="text" id="username-regis" placeholder="用户名"/>
                <hr class="line"/>
                <i class="iconfont">&#xe633;</i>
                <input type="password" id="password-regis" placeholder="密码"/>
                <hr class="line"/>
                <i class="iconfont">&#xe6b0;</i>
                <input type="password" id="re-password-regis" placeholder="请再次输入密码"/>
                <hr class="line"/>
                <input type="button" class="btn" id="btn-regis" value="注册"/>
            </div>
        </div>
    </div>
<script src="js/jquery-1.11.1.min.js"></script>
<script>
    $(function () {
        $(document).ready(function () {
            var username = "";
            var password = "";
            var repassword = "";
            var power = 1;     // 权限1默认为"普通用户",注册时使用

            // 点击【登录】按钮
            $('#btn-login').click(function () {
                username = $('#username-login').val().trim();
                password = $('#password-login').val().trim();

                if (username == "" || password == "")
                {
                    alert("用户名或密码不可为空！")
                }
                else {
                    $.ajax({
                        type: 'POST',
                        dataType: 'text',
                        url: 'Login.aspx',
                        data: 'username=' + username + '&password=' + password,
                        success: function (result) {
                            var arr = [];
                            if (result == 'false') {
                                alert("用户名或密码错误");
                            } else {
                                arr = result.split('|');
                                if (arr[0] == 'user') {
                                    location.href = "http://localhost:4441/mainInterface.aspx?sid=" + arr[1];
                                } else if (arr[0] == 'admin') {
                                    location.href = "http://localhost:4441/AdminOperation/AdminInterface.aspx?sid=" + arr[1];
                                }
                            }
                        },
                        error: function (result, status, thrownText) {
                            if (status == 'error') {
                                console.log(thrownText);
                            }
                        }
                    });
                }
            });

            //点击【注册】按钮
            $("#btn-regis").click(function () {
                username = $("#username-regis").val().trim();
                password = $("#password-regis").val().trim();
                repassword = $('#re-password-regis').val().trim();
                if( username == "" || password == "" || repassword == "" ){
                    alert("请确认输入的内容是否为空");
                }
                else if (password != repassword) {
                    alert("请确认两次输入的密码相同");
                }
                else {
                    $.ajax({
                        type: 'POST',
                        dataType: 'text',
                        url: 'Register.aspx',
                        data: 'username=' + username + '&password=' + password,
                        success: function (result) {
                            console.log(result);
                            if (result.search("true") != -1 ) {
                                alert("注册成功！正在跳转至首页······");
                                var Uarr = result.split('|');
                                location.href = "http://localhost:4441/mainInterface.aspx?sid=" + Uarr[1];
                            } else if(result == "repetition"){
                                alert("该用户已经注册");
                            }
                        },
                        error: function (result, status, thrownText) {
                            if (status == 'error') {
                                console.log(thrownText);
                            }
                        }
                    });
                }
            });
        });
    })
</script>
</body>
</html>
