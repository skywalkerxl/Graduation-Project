<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mainInterface.aspx.cs" Inherits="mianInterface" %>

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
        public end && main_tab start 
    */
    .main_tab { position:fixed; left:0; width:100%; height:100%; background:#eeeeee; }
    .main_tab .userinfo { 
        position:absolute; 
        left:0; top:30px; width: 80px; height:130px; padding-left:15px; padding-right:15px;
        text-align:center; background:transparent;
        border-radius:3px; }
    .main_tab .userinfo img {  
        width:80px; height:80px; margin:10px auto;
        border-radius:50%; overflow:hidden; } 
    .main_tab .userinfo .username { font: 200 16px/24px "Microsoft Yahei"; }
    
    .main_tab .tab_wrap ul.tab { position:absolute; right:50%; top:50%; width:1000px; padding:5px; transform:translate(50%,-50%);}
    .main_tab .tab_wrap ul.tab li {position:relative; width:240px; height:190px; margin:5px; overflow:hidden; background:#ffd800; border-radius:10px;box-shadow:0 0 8px 0 #666666;}
    .main_tab .tab_wrap ul.tab li:hover .caption { 
        opacity: 1;transform: translateY(-190px);-webkit-transform:translateY(-190px);-moz-transform:translateY(-190px);-ms-transform:translateY(-190px);-o-transform:translateY(-190px); }
    .main_tab .tab_wrap ul.tab li:hover .image { 
        opacity: 1;transform: translateY(-190px);-webkit-transform:translateY(-190px);-moz-transform:translateY(-190px);-ms-transform:translateY(-190px);-o-transform:translateY(-190px);}
    .main_tab .tab_wrap ul.tab .caption { 
        position: absolute;opacity: 1;width:240px;height:190px;top:190px;
		-webkit-transition:all 0.20s ease-in-out;-moz-transition:all 0.15s ease-in-out;-o-transition:all 0.15s ease-in-out;-ms-transition:all 0.15s ease-in-out;transition:all 0.15s ease-in-out; }
    .main_tab .tab_wrap ul.tab .image {
        position:relative; z-index:4;
        width:240px; height:190px; 
        overflow:hidden; text-align:center; background:#73b0c3;  
        -webkit-transition:all 0.20s ease-in-out;-moz-transition:all 0.15s ease-in-out;-o-transition:all 0.15s ease-in-out;-ms-transition:all 0.15s ease-in-out;transition:all 0.15s ease-in-out;}
    .main_tab .tab_wrap ul.tab .image img { width:240px; height:190px; }
    .main_tab .tab_wrap ul.tab .caption .blur { background-color: #CC3333;height: 190px;width: 220px;z-index: 5;position: absolute;padding:20px 10px;color:#ffffff;text-align:center;}
    .main_tab .tab_wrap ul.tab .caption .blur .btn_details { width:130px; height:32px; font:300 16px/30px 'Microsoft Yahei'; background:#ffffff; border: 1px solid #CC3333; color:#CC3333; margin-bottom:20px; border-radius:3px; cursor:pointer;}
    .main_tab .tab_wrap ul.tab .caption .blur span {}
    
    /* 
        main_tab end && mask_layer start
    */
    .mask_layer {display:none; width: 100%; height:100%; background:#000000; opacity:0.7; position:absolute; z-index:5; }
    .goods_menu_wrap {display:none; position:absolute; z-index:6; width:987px; height:630px; overflow:auto; left:40%; top:50%; transform:translate(-50%,-50%);}
    .goods_menu_wrap ul.goods_menu { z-index:7; position:absolute;top:0; bottom:0;margin:auto; width:960px; padding:5px; margin:0 auto; }
    .goods_menu_wrap ul.goods_menu li.goods_list {
        z-index:10; position:relative; margin: 5px; width: 150px; height: 220px; background:#0f82bd; border-radius:5px; 
        -moz-user-select:none; -webkit-user-select:none; -ms-user-select:none; user-select:none;}
    .goods_menu_wrap ul.goods_menu li.goods_list img { position:relative; z-index:11; width:100%; height:160px; border-radius:3px; }
    .goods_menu_wrap ul.goods_menu li.goods_list .btn_list_details { 
         z-index:12; width:150px; height:60px; background:#000000;
        -webkit-transition:all 0.20s ease-in-out;-moz-transition:all 0.15s ease-in-out;-o-transition:all 0.15s ease-in-out;-ms-transition:all 0.15s ease-in-out;transition:all 0.15s ease-in-out;}
    .goods_menu_wrap ul.goods_menu li.goods_list .btn_list_details span { display:inline-block; width:100%; height:30px; font:300 15px/30px "Microsoft Yahei"; text-align:center; background:#cc2c2c; color:#ffffff; }
    .goods_menu_wrap ul.goods_menu li.goods_list .btn_list_details span.desc {  }
    .goods_menu_wrap ul.goods_menu li.goods_list .btn_list_details span.price { width:50%; }
    .goods_menu_wrap ul.goods_menu li.goods_list .btn_list_details div.addcart { 
        position:relative; display:inline-block; width:50%; height: 30px; font: 300 15px/30px "Microsoft Yahei"; background:#cc2c2c; color:#ffffff; text-align:center; cursor:pointer;}
    .goods_menu_wrap ul.goods_menu li.goods_list .btn_list_details div.addcart span { -moz-user-select:none; -webkit-user-select:none; -ms-user-select:none; user-select:none; }
    .goods_menu_wrap ul.goods_menu li.goods_list .btn_list_details div.addcart span i { -moz-user-select:none; -webkit-user-select:none; -ms-user-select:none; user-select:none; }
    .goods_menu_wrap ul.goods_menu li.goods_list .btn_list_details div.addcart:hover span { color:#0f82bd; }  
    /* 
        mask_layer end && shop_cart start 
    */
    .shop_cart { position : fixed; z-index:11; width: 20%; height : 100%; right:-20%;background:#cccccc;}
    .shop_cart .btn_close { display:none; position:absolute; z-index:11; left:-100px; top:20px; width:50px; height:50px; font:normal 20px/50px "Microsoft Yahei"; background: #ff0000; color:#ffffff; border-radius:50%; text-align:center; cursor:pointer; }
    .shop_cart .text_wrap { position:absolute; left:-30px; width:30px; height:100%; background:#000000; }
    .shop_cart .text_wrap h4 { position:absolute;  top: 50%; width:30px; height:90px; font:300 16px/30px "Microsoft Yahei"; text-align:center; transform:translateY(-50%); background:#ff0000; color: #ffffff; cursor:pointer; -webkit-user-select:none; -moz-user-select:none; user-select:none; -ms-user-select:none; }
    .shop_cart .cart_list { width:100%; height:100%; overflow:auto;}
    .shop_cart .cart_list li { width:100%; height:90px; margin-bottom:2px; background:#0f82bd; }
    .shop_cart .cart_list li .img_wrap { width:85px; height:100%; background:#312fd3;}
    .shop_cart .cart_list li .img_wrap img { width:100%; height:100%; }
    .shop_cart .cart_list li .desc_wrap { width:60%; height:100%; text-align:left; padding-left:10px; background:#0f82bd;}
    .shop_cart .cart_list li .desc_wrap span { display:inline-block; width:100%;height: 30px; font: 300 13px/30px "Microsoft Yahei"; background:#0f82bd; color:#ffffff;}
    .shop_cart .cart_list li .desc_wrap label {display:inline-block; width:100%; height:30px; font: 300 13px/30px "Microsoft Yahei"; background:#0f82bd; color:#ffffff; }
    .shop_cart .cart_list li .desc_wrap label input {position:relative; top:4px; width:16px; height:16px; margin-right:5px; border:1px solid #000000; }
    .shop_cart .btn_clear { position:absolute; bottom:15px; width:100%; height:40px; left:0;}
    .shop_cart .btn_clear .sum_cart {position:absolute; left:40px; width:40px; height:40px; text-align:center; background:#0066FF; border:2px solid #0066FF;color:#ffffff; border-radius:50%; cursor:pointer;}
    .shop_cart .btn_clear .sum_cart i { line-height:40px; font-size:24px; }
    .shop_cart .btn_clear .sum_cart:hover {background:#cccccc; color:#0066FF; }
    .shop_cart .btn_clear .clear_cart {position:absolute;right:40px; width:40px; height:40px; text-align:center; background:#ff0000; color:#ffffff; border:2px solid #ff0000; border-radius:50%; cursor:pointer;}
    .shop_cart .btn_clear .clear_cart i { line-height:40px; font-size:24px; }
    .shop_cart .btn_clear .clear_cart:hover {background:#cccccc; color: #ff0000; }
    .shop_cart .btn_clear .sum_cart, .shop_cart .btn_clear .clear_cart { 
        -moz-user-select:none; -webkit-user-select:none; user-select:none; -ms-user-select:none; 
        -webkit-transition:all 0.3s; -moz-transition:all 0.3s; transition:all 0.3s;}
    .fly{ width:50px; height:50px; border-radius:50%; z-index:15;}
     
    
</style> 
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="wrap">
            <!-- 主菜单界面 start -->
            <div class="main_tab">
                <div class="userinfo">
                    <img alt="用户信息" src=""/>
                    <span class="username"></span>
                </div>
                <div class="tab_wrap">
                    <ul class="tab clear">
                        <li class="fl">
                            <div class="image">
                                <img ID="img1" runat="server" alt="食品生鲜" />
                            </div>
                            <div class="caption">
                                <div class="blur">
                                    <input data-id="" runat="server" ID="btn1" type="button" class="btn_details" value="查看更多"/><br />
                                    <span ID="span1" runat="server"></span>
                                </div>
                                <div class="caption_area">
                                </div>
                            </div>
                        </li>
                        <li class="fl">
                            <div class="image"><img ID="img2" runat="server" alt="食品、饮料、酒水" /></div>
                            <div class="caption">
                                <div class="blur">
                                    <input data-id="" runat="server" ID="btn2" type="button" class="btn_details" value="查看更多"/><br />
                                    <span ID="span2" runat="server"></span>
                                </div>
                                <div class="caption_area">
                                </div>
                            </div>
                        </li>
                        <li class="fl">
                            <div class="image"><img ID="img3" runat="server" alt="进口食品、进口好货" /></div>
                            <div class="caption">
                                <div class="blur">
                                    <input data-id="" runat="server" ID="btn3" type="button" class="btn_details" value="查看更多"/><br />
                                    <span ID="span3" runat="server"></span>
                                </div>
                                <div class="caption_area">
                                </div>
                            </div>
                        </li>
                        <li class="fl">
                            <div class="image"><img ID="img4" runat="server" alt="美妆洗护、个人护理" /></div>
                            <div class="caption">
                                <div class="blur">
                                    <input data-id="" runat="server" ID="btn4" type="button" class="btn_details" value="查看更多"/><br />
                                    <span ID="span4" runat="server"></span>
                                </div>
                                <div class="caption_area">
                                </div>
                            </div>
                        </li>
                        <li class="fl">
                            <div class="image"><img ID="img5" runat="server" alt="家清纸品、厨具餐具" /></div>
                            <div class="caption">
                                <div class="blur">
                                    <input data-id="" runat="server" ID="btn5" type="button" class="btn_details" value="查看更多"/><br />
                                    <span ID="span5" runat="server"></span>
                                </div>
                                <div class="caption_area">
                                </div>
                            </div>
                        </li>
                        <li class="fl">
                            <div class="image"><img ID="img6" runat="server" alt="家纺、家具、家妆" /></div>
                            <div class="caption">
                                <div class="blur">
                                    <input data-id="" runat="server" ID="btn6" type="button" class="btn_details" value="查看更多"/><br />
                                    <span>描述性文字描述性文字描述性文字描述性文字描述性文字描述性文字</span>
                                </div>
                                <div class="caption_area">
                                </div>
                            </div>
                        </li>
                        <li class="fl">
                            <div class="image"><img ID="img7" runat="server" alt="手机数码、电脑办公" /></div>
                            <div class="caption">
                                <div class="blur">
                                    <input data-id="" runat="server" ID="btn7" type="button" class="btn_details" value="查看更多"/><br />
                                    <span>描述性文字描述性文字描述性文字描述性文字描述性文字描述性文字</span>
                                </div>
                                <div class="caption_area">
                                </div>
                            </div>
                        </li>
                        <li class="fl">
                            <div class="image"><img ID="img8" runat="server" alt="图书、文具" /></div>
                            <div class="caption">
                                <div class="blur">
                                    <input data-id="" runat="server" ID="btn8" type="button" class="btn_details" value="查看更多"/><br />
                                    <span>描述性文字描述性文字描述性文字描述性文字描述性文字描述性文字</span>
                                </div>
                                <div class="caption_area">
                                </div>
                            </div>
                        </li>
                        <li class="fl">
                            <div class="image"><img ID="img9" runat="server" alt="女装、内衣" /></div>
                            <div class="caption">
                                <div class="blur">
                                    <input data-id="" runat="server" ID="btn9" type="button" class="btn_details" value="查看更多"/><br />
                                    <span>描述性文字描述性文字描述性文字描述性文字描述性文字描述性文字</span>
                                </div>
                                <div class="caption_area">
                                </div>
                            </div>
                        </li>
                        <li class="fl">
                            <div class="image"><img ID="img10" runat="server" alt="男装、运动、户外" /></div>
                            <div class="caption">
                                <div class="blur">
                                    <input data-id="" runat="server" ID="btn10" type="button" class="btn_details" value="查看更多"/><br />
                                    <span>描述性文字描述性文字描述性文字描述性文字描述性文字描述性文字</span>
                                </div>
                                <div class="caption_area">
                                </div>
                            </div>
                        </li>
                        <li class="fl">
                            <div class="image"><img ID="img11" runat="server" alt="购物卡、票券" /></div>
                            <div class="caption">
                                <div class="blur">
                                    <input data-id="" runat="server"  ID="btn11" type="button" class="btn_details" value="查看更多"/><br />
                                    <span>描述性文字描述性文字描述性文字描述性文字描述性文字描述性文字</span>
                                </div>
                                <div class="caption_area">
                                </div>
                            </div>
                        </li>
                   
                    </ul>
                </div>
            </div>
            <!-- 主菜单界面 end && 遮罩层 start -->
            <div class="mask_layer"></div>
            <div class="goods_menu_wrap">
                <ul class="goods_menu clear">
                    <!--
                    <li data-gid="" class="fl goods_list">
                        <img src="img/GoodsPic/2.jpg" alt="阿萨姆奶茶"/>
                        <div class="btn_list_details">
                            <span class="desc">描述文</span><div class="fl addcart"><span><i class="iconfont">&#xe60a;</i></span></div><span class="price">价格价格</span>      
                        </div>
                    </li>
                    -->
                </ul>
            </div>
            <!-- 遮罩层 end && 购物车 start-->
            <div class="shop_cart">
                <!-- 关闭遮罩层按钮 -->
                <div class="btn_close"><i class="iconfont">&#xe60b;</i></div>
                <div class="text_wrap">
                    <h4>购物车</h4>
                </div>
                <div class="cart_list">
                    <ul>
                        <!--
                        <li class="clear">
                            <div class="fl img_wrap"><img src="img/GoodsPic/2.jpg" alt="我是图片"/></div>
                            <div class="fr desc_wrap">
                                <span>描述文字</span>
                                <span>金额</span>
                                <label><input type="checkbox" checked="checked" value="加入购物车"  />加入购物车</label>
                            </div>
                        </li>
                        -->
                    </ul>
                </div>
                
                <div class="btn_clear clear">
                    <!-- "结算"按钮 start-->
                    <div class="fl sum_cart">
                        <i class="iconfont">&#xe69c;</i>
                    </div>
                    <!-- "结算按钮" end && "清空购物车"按钮 start -->
                    <div class="fr clear_cart">
                        <i class="iconfont">&#xe61a;</i>
                    </div>
                    <!-- "清空购物车"按钮 end -->
                </div>
            </div>
            
        </div>
    </div>
    </form>
</body>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="js/JSON.js"></script>
<script type="text/javascript" src="js/fly.js"></script>
<script type="text/javascript">
    
    $(function () {

        $(document).ready(function () {
            /* 获取真个页面的url */
            var sid = window.location.href.split('sid=');
            var UserId = sid[1];
            /* 用户个人信息初始化 */
            $.ajax({
                type: "POST",
                url: 'GetUserDetails.aspx',
                data: 'UserID=' + UserId,
                dataType: 'text',
                success: function (result) {
                    //console.log("success");
                    var UserInfo = JSON.parse(result);
                    // 设置用户名和头像
                    $(".userinfo img").attr("src", UserInfo[0].HeadPhoto);
                    $(".username").text(UserInfo[0].UserName);
                },
                error: function (status, result, thrownText) {
                    if (status == 'error') {
                        console.log(thrownText.toString());
                    }
                }
                
            });
            /* 菜单内容初始化 */
            $.ajax({
                type : 'GET',
                url: 'mainInterfaceDefault01.aspx',
                data: '',
                dataType : 'text', //预期服务器返回的数据类型
                success: function (result) {
                    //console.log("success");
                    var sth = JSON.parse(result);
                    //console.log(sth);

                    for (var i = 0; i < sth.length ; i++)
                    {
                        $(".image img")[i].src = sth[i].GoodsClassPic;
                        $(".blur span")[i].innerHTML = sth[i].GoodsClassName;
                        $(".blur input").eq(i).data("id", sth[i].GoodsClassID);
                        //$(".blur input")[i].setAttribute('data-id', sth[i].GoodsClassID);
                        //console.log( $(".blur input").eq(i).data("id") );
                        //console.log(sth[i].GoodsClassPic);
                    }
                },
                error: function (result, status) {
                    if (status == 'error') {
                        console.log(status);
                    }
                },
            })

            /* 点击"查看更多"按钮弹出的子菜单层 */
            $(".blur input").click(function () {
                $(".btn_close").css("display","block");
                var clickid = $(this).data("id");
                //console.log(clickid);
                $.ajax({
                    type: 'post',
                    url: 'mainInterfaceGoodsList.aspx',
                    data: 'GoodsClassID= ' + clickid,
                    dataType: 'text',
                    success: function (result) {
                        //console.log("success");
                        var goodsList = JSON.parse(result);
                        var fragment = document.createDocumentFragment();
                        $(".goods_menu").empty(); //先清空
                        for( var i = 0 ; i < goodsList.length ; i++ )
                        {
                            var ListLi = "<li data-gid=" + goodsList[i].GoodsID + " class='fl goods_list'><img src=" + goodsList[i].GoodsPic + " alt='阿萨姆奶茶'/><div class='btn_list_details'><span  class='desc'>描述文</span><div class='fl addcart'><span><i class='iconfont'>&#xe60a;</i></span></div><span class='price'>" + goodsList[i].GoodsPrice + "</span></div></li>";
                            $(".goods_menu").append(ListLi);
                            $(".goods_list span.desc")[i].innerHTML = goodsList[i].GoodsName;
                            /*
                            **  Document Fragment
                            */
                            /*var ListLi = document.createElement('li');
                            ListLi.innerHTML = "<span>"+ goodsList[i].GoodsName +"</span>";
                            fragment.appendChild(ListLi);*/
                        }
                        
                    },
                    error: function (result, status) {
                        if (status == 'error') {
                            console.log(status);
                        }
                    }
                });
            });

            /* 点击"垃圾桶"图标清空购物车 */
            $(".clear_cart").click(function () {
                $(this).parent().prev().children("ul").html("");
                //console.log($(this).parent().prev().children("ul").html());
            });

            /* 点击"订单"图标跳转至订单页面 */
            $(".sum_cart").click(function () {
                var arr = [];
                var j = 0;
                var that = this;
                var len = $(this).parent().prev().children("ul").children("li").length;
                if (len != 0) {
                    for (var i = 0 ; i < len ; i++) {
                        if ($(".desc_wrap label input").eq(i).is(":checked")) {
                            j = $(".desc_wrap label input").eq(i).parent().parent().parent().data("id");
                            arr.push({ "GoodsID": j });
                        }
                    }
                    var str_arr = JSON.stringify(arr);
                    //向后台传递货物的ID（数组）,以及下订单的用户
                    $.ajax({
                        type: 'POST',
                        url: 'MainToOrder.aspx',
                        dataType: 'text',
                        data: "AGoodsID=" + str_arr + "&UserID=" + UserId,
                        success: function (result) {
                            console.log("success");
                            console.log(result);
                            window.open("OrderInterface.aspx?sid=" + UserId);
                        },
                        error: function (result, status) {
                            if (status == 'error') {
                                console.log(status);
                            }
                        }
                    });
                }
                else {
                    window.open("OrderInterface.aspx?sid=" + UserId);
                }
                

            })

            /* 点击close按钮 关闭遮罩层 */


            /* 子菜单hover样式 */
            //$("li.goods_list").hover(function () {
            //    $(this).children(".btn_list_details").css("display", "block")
            //}, function () {
            //    $(this).children(".btn_list_details").css("display", "none");
            //});
            
            /* animation start */
            var onOff = false;
            $("h4").click(function () {
                if (onOff) {
                    $(this).parent().parent().animate({ "right": "-20%" }, 300);
                    $(".main_tab").animate({ "left": "0" }, 300);
                    $("ul.tab").animate({ "right": "50%" }, 300);
                } else {
                    $(this).parent().parent().animate({ "right": "0" }, 300);
                    $(".main_tab").animate({ "left": "-20%" }, 300);
                    $("ul.tab").animate({ "right": "41%" }, 300);
                }
                onOff = !onOff;
            });
            
            
            /* 点击"查看更多"按钮查看子菜单详情 */
            $(".btn_details").click(function () {
                $(".mask_layer").slideDown(400);
                $(".goods_menu_wrap").show(400);
            });

            /* 点击"关闭"按钮关闭遮罩层 */
            $(".btn_close").click(function () {
                $(".mask_layer").slideUp(400);
                $(".goods_menu_wrap").hide(400);
                $(this).css("display", "none");
            });
            //为动态添加的节点【添加至购物车】按钮增加click事件
            $("ul.goods_menu").delegate(".addcart span", "click", function (e) {
                var img = $(this).parent().parent().prev().attr("src");
                var descTxt = $(this).parent().prev().html();
                var priceTxt = $(this).parent().next().html();
                var dataid = $(this).parent().parent().parent().data("gid");
                
                var x = e.clientX;//鼠标到浏览器左边值
                var y = e.clientY;//鼠标到浏览器顶部值
                //获取落脚点
                var _left = $('h4').offset().left;
                var _top = $('h4').offset().top;

                //创建抛物线的图片
                var flyer = $('<img src="' + img + '" class="fly"/>')
                flyer.fly({
                    start: {
                        left: x,
                        top: y
                    }, end: {
                        left: _left,
                        top: _top,
                        width: 20,
                        height: 20
                    }, onEnd: function () {
                        flyer.fadeOut('slow', function () {
                            $(this).remove();
                        });
                    }
                })

                /* 向购物车中添加所选物品 */
                var cartli = "<li data-id="+ dataid +" class='clear'><div class='fl img_wrap'><img src="+ img +" alt='我是图片'/></div><div class='fr desc_wrap'><span>" + descTxt + "</span><span>"+ priceTxt +"</span><label><input type='checkbox' checked='checked' value='加入订单'/>加入订单</label></div></li>"
                $(".cart_list ul").append(cartli);


            });
            /* animation end */
        })


    })

</script>
</html>
