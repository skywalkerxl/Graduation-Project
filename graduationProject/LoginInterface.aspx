<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginInterface.aspx.cs" Inherits="LoginInterface" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="css/fontcss.css"/>
    <link rel="stylesheet" href="css/login.css"/>
    <script src="https://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server" method="post">
    <div class="wrap">
        <div class="login_main">
                <!--<h1>徽 润 超 市</h1>-->
            <input type="text" class="name" placeholder="用户名" />
            <input type="password" class="psd" placeholder="密码" />
            <input type="button" class="btn" value="登录" />
            <input type="button" id="btn-reg" value="没有账号？点我注册" />
                
            <!-- 超链接模块 -->
            <div class="icon_wrap">
                    <a><i class="iconfont">&#xe649;</i></a>
                    <a><i class="iconfont">&#xe64f;</i></a>
                    <a><i class="iconfont">&#xe600;</i></a>
            </div>
        </div>
    </div>
    </form>
    
<script type="text/javascript">
    $(function () {
        $(document).ready(function () {
            var username = "";
            var password = "";
            var power = 1;     // 权限1默认为"普通用户",注册时使用

            // 点击【登录】按钮
            $('.btn').click(function () {
                username = $('.name').val();
                password = $('.psd').val();
                $.ajax({
                    type: 'POST',
                    dataType: 'text',
                    url: 'Login.aspx',
                    data: 'username=' + username + '&password=' + password,
                    success: function (result) {
                        /*location.href = "http://localhost:4441/mainInterface.aspx?sid=" + ;*/
                    },
                    error: function (result, status, thrownText) {
                        if (status == 'error') {
                            console.log(thrownText);
                        }
                    }
                });
            });

            //点击【注册】按钮
            $("#btn-reg").click(function () {
                
            });
        });
    })
</script>
</body>
</html>
