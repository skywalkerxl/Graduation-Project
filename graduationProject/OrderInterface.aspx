<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderInterface.aspx.cs" Inherits="OrderInterface" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="css/fontcss.css"/>
<style type="text/css">
    /* 
        css_reset start 
    */
    body, h1, h2, h3, h4 , h5, h6, ul, li ,input{ margin:0; padding:0; }
    li { list-style:none; }
    img { vertical-align:middle; border:none; }
    input { outline:none; border:none; }
    a { text-decoration:none; }
    /* 
        css_reset end && public start 
    */
    .fl { float: left; }
    .fr { float: right; }
    .clear:after { display:block; content:""; clear:both; }
    /*
        public end
        */
    #order_bg { position:fixed; width:100%; height:100%; z-index:-1; background-image:url("img/bg/bgdemo.jpg"); background-size:cover; }
    
    /* 用户信息模块 */
    .order_layer .userinfo { position:fixed; left:45px; top:40px; width:110px; height:130px; text-align:center; background:#ffffff; border-radius:3px; }
    .order_layer .userinfo .user_photo { width:80px; height:80px; border-radius:50%; border:1px solid #cccccc; margin:10px auto; overflow:hidden; }
    .order_layer .userinfo .user_photo img { width:80px; height:80px; }
    .order_layer .userinfo .user_name { font: 200 16px/24px "Microsoft Yahei";}
    /* 【已支付订单】&&【未支付订单】选择按钮模块 */
    .order_layer .order_menu_list { 
        position:fixed; left:45px; top:195px; width:110px; height:360px; overflow:hidden; background:#ffffff; border-radius:3px; 
        -webkit-transition:all 0.3s; -moz-transition:all 0.3s; transition:all 0.3s;}
    .order_layer .order_menu_list li { 
        width:110px; height:90px; text-align:center; font:300 16px/90px "Microsoft Yahei"; color:#aaaaaa; border-bottom:1px solid #cccccc; cursor:pointer;
        -webkit-transition:all 0.2s; -moz-transition:all 0.2s; transition:all 0.2s;}
    .order_layer .order_menu_list li:hover { background: #cccccc; color:#ffffff;}
    /*退出按钮模块*/
    .order_layer .order_logout { 
        position:fixed; left:45px; top:400px; width:110px; height:30px; font:200 16px/30px "Microsoft Yahei"; color:#ffffff; text-align:center;  background:#CC0000; border-radius:5px; cursor:pointer;
        -webkit-transition:all 0.4s; -moz-transition:all 0.4s; transition:all 0.4s;}
    .order_layer .order_logout:hover { background:#ff0000; }
    /* 中间订单详情模块 */
    .order_layer .panel {
        position:absolute;left:180px; top:40px; width:800px; min-height:600px; background:#ffffff; border-radius:5px; 
        -webkit-transition:all 0.5s; -moz-transition:all 0.5s; transition:all 0.5s; }
    .order_layer .panel .title {width:780px; height:43px; padding-left:20px; font:normal 16px/42px "Microsoft Yahei"; color:#ffffff; background:#504b41; border-top-left-radius:3px; border-top-right-radius:5px;}
    .order_layer .panel .order_details { width: 796px; padding:2px; height:539px; }
    .order_layer .panel .order_details li {
        position:relative; width:183px; height:218px; text-align:center; margin:7px; border:1px solid #cccccc; 
        -webkit-transition:all 0.3s; -moz-transition:all 0.3s; transition:all 0.3s;
    }
    .order_layer .panel .order_details li:hover {  box-shadow: 0 0 6px 0 #000000;  }
    .order_layer .panel .order_details li img { height:160px; width:140px; }
    .order_layer .panel .order_details li span { display:inline-block; width:183px; height:30px; line-height:30px; color:#ffffff;}
    .order_layer .panel .order_details li span.desc { color:#000000; }
    .order_layer .panel .order_details li span.price { color:#000000; }
    
    /* 右侧订单列表模块【总金额】 */
    .order_layer .order_list_wrap {position:fixed; left:1010px; top:40px; width:250px; height:600px; border-radius:3px; }
    .order_layer .order_list_wrap .summary { width:100%; height:100px; background:#638e43; border-radius:3px;}
    .order_layer .order_list_wrap .summary h1 { height:40px; padding-left:20px; font:400 16px/40px "Microsoft YaHei"; color:#ffffff;}
    .order_layer .order_list_wrap .summary h2 { height:60px; padding-left:65px; font:200 30px/60px "Microsoft Yahei"; color:#ffffff;}
   /* 右侧点单列表模块【订单列表】 */
    .order_layer .order_list_wrap ul { width: 100%; height:420px; margin-top: 25px; margin-bottom:25px; overflow:auto; background:#ffffff; border-radius:3px;}
    .order_layer .order_list_wrap ul li { 
        width:100%; height:83px; border-bottom:1px solid #cccccc; cursor:pointer;
        -webkit-transition:all 0.4s; -moz-transition:all 0.4s; transition:all 0.4s; }
    .order_layer .order_list_wrap ul li:hover { background:#E3E2E5; }
    .order_layer .order_list_wrap ul li .desc {padding-left:20px; height:82px; width:130px; }
    .order_layer .order_list_wrap ul li .desc h3 { height:44px; width:150px; font:500 16px/48px "Microsoft Yahei"; color:#000000; }
    .order_layer .order_list_wrap ul li .desc h5 { height:38px; width:150px; font:300 14px/38px "Microsoft Yahei"; color:#638e43;}
    .order_layer .order_list_wrap ul li .delete { 
        display:none; 
        width:28px; height:83px; 
        line-height:82px; text-align:center; font-size:20px; background:#ff0000; color:#ffffff;
        visibility:visible;
    }
    .order_layer .order_list_wrap ul li:hover .delete { display:inline-block; }
    /* 右侧订单列表模块【结算】按钮 */
    .order_layer .order_list_wrap .btn_order_pay { 
        width:100%; height:30px; text-align:center; border-radius:3px; color:#ffffff; font:500 16px/30px "Microsoft Yahei"; background:#d77b31; cursor:pointer; 
         -webkit-transition:all 0.5s; -moz-transition:all 0.5s; transition:all 0.5s;}
    .order_layer .order_list_wrap .btn_order_pay:hover { background:#FF9900; }
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id="order_bg"></div>
            <div class="order_layer">
                <div class="userinfo">
                    <div class="user_photo"><img alt="user_photo" src=""/></div>
                    <span class="user_name">用户名称</span>
                </div>
                <ul class="order_menu_list">
                    <li class="pay_false">未支付订单</li>
                    <li class="pay_true">待打包订单</li>
                    <li>已打包订单</li>
                    <li>已自提订单</li>
                </ul>
                <!--<div class="order_logout">退出</div>-->
                <div class="panel">
                    <div class="title"><span>订单详情</span>&nbsp;&nbsp<span class="pay_status">（未支付）</span><span class="title_OrderID"></span></div>
                    <ul class="order_details clear">
                        <!--
                        <li class="fl">
                            <div class="btn_list_close">X</div>
                            <img alt="商品图片" src="img/GoodsPic/1.jpg"/>
                            <span class="desc">名称描述</span>
                            <span class="price">-0.00</span>
                        </li>
                        -->
                    </ul>
                </div>
                <div class="order_list_wrap">
                    <!-- 显示所选订单总金额 -->
                    <div class="summary">
                        <h1>总金额：</h1>
                        <h2><span>￥</span><span class="sum_price">0.00</span></h2>
                    </div>
                    <!-- 订单列表 -->
                    <ul>
                        <!--
                        <li>
                            <div class="fl desc">
                                <h3>订单编号</h3>
                                <h5>下单日期</h5>
                            </div>
                            <div class="fr delele">删除</div>
                        </li>
                       -->
                        
                    </ul>
                    <!-- 确认支付按钮 -->
                    <div class="btn_order_pay">结算</div>
                </div>
            </div>
        </div>
    </form>

<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="js/JSON.js"></script>
<script type="text/javascript">
    $(function () {

        var fnOrder = function (UserID, IsPay, OrderStatus) {
            /*
                未支付订单 pay = "false"; status = "1";
                待打包订单 pay = "true";  status = "2";
                已打包订单 pay = "true";  status = "3";
                已自提订单 pay = "true";  status = "4";
            */
            $.ajax({
                type: 'POST',
                url: 'GetOrderList.aspx',
                dataType: 'text',
                data: 'UserID=' + UserID + '&IsPay=' + IsPay + '&Status=' + OrderStatus,
                success: function (result) {
                    //console.log("success");
                    //console.log(result);
                    var OrderListInfo = JSON.parse(result);
                    //console.log(OrderListInfo);
                    /* 动态创建订单列表 */
                    $(".order_list_wrap ul").html("");
                    for (var i = 0 ; i < OrderListInfo.length ; i++) {
                        if (OrderStatus == '1')
                        {
                            var OrderList = '<li class="clear"><div class="fl desc"><h3>' + OrderListInfo[i].OrderID + '</h3><h5>' + OrderListInfo[i].OrderTime + '</h5></div><div class="fr delete"><i class="iconfont">&#xe61a;</i></div></li>';
                            $(".order_list_wrap ul").append(OrderList);
                        }
                        else {
                            var OrderList = '<li class="clear"><div class="fl desc"><h3>' + OrderListInfo[i].OrderID + '</h3><h5>' + OrderListInfo[i].OrderTime + '</h5></div></li>';
                            $(".order_list_wrap ul").append(OrderList);
                        }
                    }
                },
                error: function (status, result, thrownText) {
                    if (status == 'error') {
                        console.log(thrownText.toString());
                    }
                }
            });
        };

        var fnClear = function () {
            $(".title_OrderID").html("");
            $(".order_details").html("");
            $(".sum_price").html("0.00");
        }

        $(document).ready(function () {
            var sid = window.location.href.split('sid=');
            var UserID = sid[1];
            var IsPay = "false";
            var PayStatus = '1';
            var OrderID = 0;
            var sumPrice = 0 ;

            /* 获取用户头像和名称 */
            $.ajax({
                type: 'POST',
                url: 'GetUserDetails.aspx',
                dataType: 'text',
                data: 'UserID=' + UserID,
                success: function (result) {
                    //console.log("success");
                    var UserInfo = JSON.parse(result);
                    // 设置用户名和头像
                    $(".user_photo").children("img").attr("src", UserInfo[0].HeadPhoto);
                    $(".user_name").text(UserInfo[0].UserName);

                },
                error: function (status, result, thrownText) {
                    if (status == 'error') {
                        console.log(thrownText.toString());
                    }
                }
            });

            /* 获取订单列表 */
            fnOrder(UserID, IsPay, PayStatus);

            /* 点击【未支付订单】按钮显示订单详情 */
            $(".order_menu_list li").eq(0).click(function () {
                IsPay = "false";
                PayStatus = "1";
                fnClear();
                fnOrder(UserID, IsPay, PayStatus);
                $(".btn_order_pay").css("display", "block");
                $(".pay_status").html("（未支付）");
                
            })

            /* 点击【待打包订单】按钮显示订单详情 */
            $(".order_menu_list li").eq(1).click(function () {
                IsPay = "true";
                PayStatus = "2";
                fnClear();
                fnOrder(UserID, IsPay, PayStatus);
                $(".btn_order_pay").css("display", "none");
                $(".pay_status").html("（已支付-待打包）");
            });

            /* 点击【已打包订单】按钮显示订单详情 */
            $(".order_menu_list li").eq(2).click(function () {
                IsPay = "true";
                PayStatus = "3";
                fnClear();
                fnOrder(UserID, IsPay, PayStatus);
                $(".btn_order_pay").css("display", "none");
                $(".pay_status").html("（已支付-已打包）");
            })

            /* 点击【已自提订单】按钮订单详情 */
            $(".order_menu_list li").eq(3).click(function () {
                IsPay = "true";
                PayStatus = "4";
                fnClear();
                fnOrder(UserID, IsPay, PayStatus);
                $(".btn_order_pay").css("display", "none");
                $(".pay_status").html("（已支付-已自提）");
            })

            /* 点击【结算】按钮结算 */
            $(".btn_order_pay").click(function () {
                OrderID = $(".title_OrderID").html();
                sumPrice = $(".sum_price").html();
                if (OrderID != "" && sumPrice != '0.00') {
                    window.location.href = "payInterface.aspx?oid=" + OrderID + "&sp=" + sumPrice;
                }
            });


            /* 点击订单列表中的订单展示订单货物详情 */
            $(".order_list_wrap ul").delegate("li", "click", function () {
                OrderID = $(this).children(".desc").children("h3").html();
                $(".title_OrderID").html(OrderID);
                $.ajax({
                    type: 'POST',
                    url: 'GetGoodsList.aspx',
                    dataType: 'text',
                    data: 'OrderID=' + OrderID,
                    success: function (result) {
                        //console.log("success");
                        //console.log(result);
                        var GoodsInfo = JSON.parse(result);
                        var leng = GoodsInfo.length;
                        sumPrice = 0;
                        //console.log(GoodsInfo);

                        $(".order_details").html("");
                        for( var i = 0 ; i < leng ; i++ )
                        {
                            sumPrice += GoodsInfo[i].GoodsPrice;
                            var gli = '<li class="fl"><img alt="商品图片" src=' + GoodsInfo[i].GoodsPic + '><span class="desc">' + GoodsInfo[i].GoodsName + '</span><span class="price">' + GoodsInfo[i].GoodsPrice + '</span></li>';
                            $(".order_details").append(gli);
                        }
                        $(".sum_price").html(sumPrice);

                    },
                    error: function (status, result, thrownText) {
                        if (status == 'error') {
                            console.log(thrownText.toString());
                        }
                    }
                });
            });

            //删除列表中订单
            $(".order_list_wrap ul").delegate("li .delete", "click", function () {
                var that = this;
                $.ajax({
                    type:'POST',
                    url: 'DeleteOrderList.aspx',
                    dataType: 'text',
                    data: "OrderID=" + $(this).parent().children(".desc").children("h3").html(),
                    success: function (result) {
                        //console.log(result);
                        if (result == "true") {
                            $(that).parent().remove();
                            fnClear();
                        }
                    },
                    error: function (status, result, thrownText) {
                        if (status == 'error') {
                            console.log(thrownText.toString());
                        }
                    }
                });
            })
        });
    })
</script>
</body>
</html>
