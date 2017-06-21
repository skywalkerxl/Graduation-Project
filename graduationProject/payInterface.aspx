<%@ Page Language="C#" AutoEventWireup="true" CodeFile="payInterface.aspx.cs" Inherits="graduation_project_pay_demo_paydemo_01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>欢迎使用支付宝支付</title>
    <link rel="stylesheet" href="css/normal.css" />
<style type="text/css">
    html { height: 100%; }
    body { height: 100%; }
    form { height: 100%; }
    .wrap { height: 100%; }
    .pay_main { 
        position:relative; 
        width: 100%; height: 100%;  padding-bottom:1px; 
        background: #eee;}
    .pay_main .payBox { 
        position:absolute; left:50%; top:50%; transform:translate(-50%,-50%); margin: 0px auto; padding-top:30px; width: 300px; height: 370px; text-align:center; background:#ffffff; border-radius:15px; 
        transition:all 0.5s; 
    }
    .pay_main .payBox:hover {box-shadow:0 0 8px 0px; }
    .pay_main .paySuccess { position:absolute; left:50%; top:50%; transform:translate(-50%,-50%); margin: 0px auto; padding-top:30px; width: 300px; height: 370px; text-align:center; background:#ffffff; border-radius:15px;  }
    .pay_main .paySuccess { box-shadow:0 0 8px 0px; transition:0.5s; }


    .pay_main .payBox .NamePwdBox { position:absolute ; top:130px; }
    .pay_main .payBox span { position:absolute; left:40%; transform:translate(-50%); color:#eb4b4b; font-size:13px; }
    .pay_main .payBox span.UserNameTips { top:-20px; }
    .pay_main .payBox span.UserNameTips { top:-20px; }
    .pay_main .payBox span.PasswordTips { top:43px; }
    .pay_main .payBox input { width: 190px; height:32px; padding-left:10px; margin-bottom: 30px; border:1px solid #cccccc; border-radius:5px; }
    .pay_main .payBox .BtnSubmit { position:absolute;    left:50%; transform: translate(-50%);  bottom:50px; width: 200px; height:32px; font:300 18px/32px 'Microsoft YaHei'; background:#00aaee; color:#ffffff; margin:0; padding:0; border:none; border-radius:3px; outline:none;  }
    
    /* animation start */
    .pay_main { -webkit-animation: mainDown 0.5 ease-in-out 0 backwards; }
    .pay_main .payBox { -webkit-animation: MoveUp 0.6s ease-in-out 0.2s backwards; }
    .pay_main .payBox { -moz-animation: MoveUp 0.6s ease-in-out 0.2s backwards; }
    @-webkit-keyframes mainDown {
        0% { opacity:0; }
        100% {  opacity:1; }
    }
    @-webkit-keyframes MoveUp {
        0% { transform: translate(-50%,-35%); opacity: 0; }
        100% { transform: translateY(-50%,-50%); opacity: 1;}
    }
    @-moz-keyframes MoveUp {
        0% { transform: translate(-50%,-35%); opacity: 0; }
        100% { transform: translateY(-50%,-50%); opacity: 1;}
    }    
   
    /* animation end */
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="wrap">
        <div class="pay_main">
            <div class="payBox" runat="server" ID="payBox">
                <span></span>
                <div class="pay_icon">
                    <img src="img/pay/Alipay.svg" alt="Alipay_icon"/>
                </div>
                <div class="NamePwdBox">
                    <span class="UserNameTips" runat="server"></span>
                    <input type="text" class="UserName"  runat="server"/>
                    <span class="PasswordTips" runat="server"></span>
                    <input type="password" class="Password" runat="server"/>
                </div>
                <asp:Label ID="successTips" runat="server"></asp:Label>
                <input type="button" class="BtnSubmit" value="确认支付"/>
            </div>
        </div>
    </div>
    </form>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
    $(function () {
        $(document).ready(function () {
            var arr1 = window.location.href.split("oid=");
            var Aoid = arr1[1].split("&sp=");
            
            var oid = Aoid[0];   //订单号
            var sp = Aoid[1];    //金额
            var usernameTxt = "";
            var passwordTxt = "";



            $(".BtnSubmit").val("确认支付:" + sp + "元");

            //点击【确认支付】按钮
            $(".BtnSubmit").click(function () {
                usernameTxt = $('.UserName').val();//获取用户名
                passwordTxt = $('.Password').val();//获取密码
                console.log(usernameTxt);
                console.log(passwordTxt);
                if (usernameTxt != "" && passwordTxt != "") {
                    $.ajax({
                        type: 'POST',
                        url: 'GoPay.aspx',
                        data: 'username=' + usernameTxt + "&password=" + passwordTxt + "&oid=" + oid +"&sp=" + sp,
                        dataType: 'text',
                        success: function (result) {
                            console.log(result);
                            if (result == 'true') {
                                alert("支付成功！");
                                window.history.go(-1);
                            } else if (result == 'false') {
                                alert("请检查用户名密码");
                            }
                        },
                        error: function (status) {
                            if (status == 'error') {
                                alert("error");
                            }
                        }
                    });
                }
            });

            //支付账号及支付密码不可为空的判断
            
            $('.UserName').blur(function () {
                usernameTxt = $('.UserName').val();//获取用户名
                if ( usernameTxt == ""){
                    $('.UserNameTips').text("支付账号不可为空！");
                }
            });
            $('.UserName').focus(function () {
                $('.UserNameTips').text("");
            })
            $('.Password').blur(function () {
                passwordTxt = $('.Password').val();//获取密码
                if ( passwordTxt == "") {
                    $('.PasswordTips').text("支付密码不可为空!");
                }
            })
            $('.Password').focus(function () {
                $('.PasswordTips').text("");
            });

        });
    });
    

    

    /*$('.BtnSubmit').click(function () {
        if ($('.UserName').val().trim() == "") {
            $('.UserNameTips').text("用户名不可为空！");
        }
        if ($('.Password').val().trim() == "") {
            $('.PasswordTips').text("密码不可为空！");
        }
        if ($('.UserName').val().trim() != "") {
            $('.UserNameTips').text("");
        }
        if ($('.Password').val().trim() != "") {
            $('.PasswordTips').text("");
        }
        
    })*/
    


</script>
</body>
</html>
