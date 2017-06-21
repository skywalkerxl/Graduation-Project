<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminInterface.aspx.cs" Inherits="AdminInterface" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="../css/normal.css"/>
    <link rel="stylesheet" href="../css/fontcss.css"/>
<style type="text/css">
    html, body { width:100%; height:100%; overflow:hidden;}
    body { background:#f3f3f3; overflow:hidden; }
    a { text-decoration:none;  }
    .fl { float:left; }
    .fr { float:right; }
    /* 
        导航栏样式 
    */
    /* 上部导航栏样式 */
    .top-nav { 
        position:fixed; z-index:11; 
        height:60px; width:100%; top:0; 
        background:#757d75; 
        overflow:hidden;
    }
    .top-nav .title-wrap {
        position:absolute; 
        left:75px; width:200px; top:0px; 
        line-height:60px; 
        overflow:hidden;  }
    .top-nav .title-wrap h1 { 
        width:200px; height:60px; 
        line-height: 60px; text-align:center; font-size:16px; font-weight:100; color:#cdd4dc;
    }
    
    #adminInfo { position:absolute; right:0; width:160px; height:60px; line-height:60px; padding-left:10px; padding-right:20px;}
    #adminInfo img { width:40px; height:40px; margin-top:10px; border-radius:50%; cursor:pointer; }
    #adminName {  width:100px; height:50px; line-height:60px; text-align:left; font-size:16px; font-weight:100; color:#cdd4dc; }
    /* 左部导航栏样式 */
    .left-nav { position:fixed; z-index:1; width:75px; height:100%; background:#91c46b; }
    #controller-1, #controller-1 + a {position:absolute; width:75px; height:80px; top:60px; }
    #controller-2, #controller-2 + a {position:absolute; width:75px; height:80px; top:140px; }
    #controller-3, #controller-3 + a {position:absolute; width:75px; height:80px; top:220px; }
    #controller-4, #controller-4 + a {position:absolute; width:75px; height:80px; top:300px; }
    #controller-5, #controller-5 + a {position:absolute; width:75px; height:80px; top:380px; }
    #controller-6, #controller-6 + a {position:absolute; width:75px; height:80px; top:460px; }
    
    .controller, .controller + a { position:fixed; z-index:12; width:75px; height:100%; background:#91c46b; }
    .controller { z-index:5; opacity:0; cursor:pointer; }
    .controller + a { line-height:80px; text-align:center; font-size:22px; color:#56893d; z-index:4; }
    .controller:hover + a {  }
    
    .tooltips {
        position:absolute; opacity:0; width:100px; height:30px; line-height:30px; text-align:center; font-size:14px; font-weight:200; left:75px; top:25px; background:#FFFFCC; 
        -webkit-transform: translate3d(0, 0, 0);
	    transform: translate3d(0, 0, 0);
	    -webkit-transition: opacity 0.3s, -webkit-transform 0.3s;
	    transition: opacity 0.3s, transform 0.3s;}
    .tooltips-text { 
        -webkit-transform: translate3d(15px, 0, 0);
	    transform: translate3d(15px, 0, 0); }
    .controller:hover + a .tooltips { 
        opacity:1; -webkit-transform: translate3d(10px, 0, 0); transform: translate3d(10px, 0, 0);}
    .controller:hover + a .tooltips-text{
        -webkit-transform: translate3d(0,0,0); transform: translate3d(0,0,0);}
    .trangle {
        position:absolute;
        top:10px;
        left:-10px; 
        width: 0;
        height: 0;
        border-top: 5px solid transparent;
        border-right: 10px solid #ffc;
        border-bottom: 5px solid transparent; }

    /* 左上角HOT样式 */
    .left-top { 
        position:fixed; z-index:13; 
        width:75px; height:60px; line-height:60px; text-align:center; font-size:24px; 
        background:#000; color:#6c7177;  }

    /* 主界面样式 */
    .main-panel, .part-panel { z-index:0; position:relative; width:100%; height:100%; }
    .main-panel { 
        -webkit-transform: translate3d(0,0,0);/* 可以提高GPU硬件加速 */
        -moz-transform: translate3d(0,0,0);
        -o-transform: translate3d(0,0,0);
        transform: translate3d(0,0,0);
        -webkit-backface-visibility: hidden;  /* 隐藏被旋转的元素背面 */
        -webkit-transition: all 0.6s ease-in-out;
        -moz-transition: all 0.6s ease-in-out;
        -o-transition: all 0.6s ease-in-out;
        -ms-transition: all 0.6s ease-in-out;
        transition: all 0.6s ease-in-out;
    }
    #controller-1:checked ~ .main-panel {
        -webkit-transform: translateY(0%);
        -moz-transform: translateY(0%);
        -o-transform: translateY(0%);
        -ms-transform: translateY(0%);
        transform: translateY(0%);
}
    #controller-2:checked ~ .main-panel {
        -webkit-transform: translateY(-100%);
        -moz-transform: translateY(-100%);
        -o-transform: translateY(-100%);
        -ms-transform: translateY(-100%);
        transform: translateY(-100%);
    }
    #controller-3:checked ~ .main-panel {
        -webkit-transform: translateY(-200%);
        -moz-transform: translateY(-200%);
        -o-transform: translateY(-200%);
        -ms-transform: translateY(-200%);
        transform: translateY(-200%);
    }
    #controller-4:checked ~ .main-panel {
        -webkit-transform: translateY(-300%);
        -moz-transform: translateY(-300%);
        -o-transform: translateY(-300%);
        -ms-transform: translateY(-300%);
        transform: translateY(-300%);
    }
    #controller-5:checked ~ .main-panel {
        -webkit-transform: translateY(-400%);
        -moz-transform: translateY(-400%);
        -o-transform: translateY(-400%);
        -ms-transform: translateY(-400%);
        transform: translateY(-400%);
    }
    #controller-6:checked ~ .main-panel {
        -webkit-transform: translateY(-500%);
        -moz-transform: translateY(-500%);
        -o-transform: translateY(-500%);
        -ms-transform: translateY(-500%);
        transform: translateY(-500%);
    }
    /*
    #panel-section-1 { background:#1bbc9b; }
    #panel-section-2 { background:#fff; }
    #panel-section-3 { background:#7BAABE; }
    #panel-section-4 { background:#fff; }
    #panel-section-5 { background:#FFFFCC; }
    #panel-section-6 { background:#ffffff; }*/

    #panel-section-1 { background:#fff; }
    #panel-section-2 { background:#F3F8EE; }
    #panel-section-3 { background:#fff; }
    #panel-section-4 { background:#fff; }
    #panel-section-5 { background:#fff; }
    #panel-section-6 { background:#fff; }

    .part-panel .wrap { 
        position:absolute; 
        width: 1150px; height:550px; left:50%; top:50%; 
        transform:translate(-50%, -50%); 
    }
    #panel-section-1 .wrap .title-nav {
        width:1100px; height:40px; margin-left:25px;
    }
    #panel-section-1 .wrap .title-nav ul {
        width:1120px; height:40px; padding-right:20px;
    }
    #panel-section-1 .wrap .title-nav ul li {
        float:left;
        width:20%; height:40px; 
        font-size:16px; line-height:40px; text-align:center;font-weight:200;
    }
    #panel-section-1 .wrap .content {
        width:1120px; height:545px; margin-left:20px; padding:5PX;
        overflow:auto; 
    }
    #panel-section-1 .wrap .content li {
        width:100%; height:40px; margin: 10px 0;
        line-height:40px;
        background:#fff; cursor:pointer; border-radius:5px; box-shadow: 0 0 2px 1px #aaa;
        -moz-transition:background-color 0.3s; transition:background-color 0.3s; -webkit-transition:background-color 0.3s;
    }
    #panel-section-1 .wrap .content li:hover {
        background:#cdd4dc;
    }
    #panel-section-1 .wrap .content li span {
        display: inline-block;
        width: 20%;
        font-size:16px; font-weight:200; text-align:center;
    }
    /* 订单详情弹出层样式 start */
    #panel-section-1 .wrap .order-details-port {
        display:none; position:fixed; z-index:100;
        left:10px; top:10px; width:1200px; height:590px;
        background:#91c46b; border-radius:10px;
    }
    #panel-section-1 .wrap .order-details-port .left{
        position:absolute;
        left:5px; top:5px; width:1000px; height:580px;
    }
    #panel-section-1 .wrap .order-details-port .left ul {
        width:1000px; height:580px;
        overflow:auto;
    }
    #panel-section-1 .wrap .order-details-port .left ul li {
        float:left; 
        width:140px; height:166px; margin:5px; padding-bottom:15px;
        text-align:center; background:#fff; 
        border:1px solid #000; border-radius:5px; box-shadow: 0 0 2px 0 #000;
    }
    #panel-section-1 .wrap .order-details-port .left ul li img{
        width:120px; height:130px; margin:0 10px;
    }
    #panel-section-1 .wrap .order-details-port .left ul li span {
        font-size:16px; line-height:20px; font-weight:200;
    }
    #panel-section-1 .wrap .order-details-port .right{
        position:absolute; 
        right:5px; top:5px; width:170px; height:580px;
    }
    #panel-section-1 .wrap .order-details-port .right .btn-pack {
        
        width:100px; height:100px; margin:240px auto;
        line-height:100px; text-align:center; background:#0094ff; color:#fff; font-size:80px; font-weight:200;
        border-radius:50%; cursor:pointer; box-shadow:0 0 10px 0 #000;
    }
    #panel-section-1 .wrap .order-details-port .right .btn-pick {
        display:none;
        width:100px; height:100px; margin:240px auto;
        line-height:100px; text-align:center; background:#0094ff; color:#fff; font-size:80px; font-weight:200;
        border-radius:50%; cursor:pointer; box-shadow:0 0 10px 0 #000;
    }
    #panel-section-1 .wrap .order-details-port .btn-close {
        position:absolute;
        right:10px; top:10px; width:40px; height:40px;
        font-size:16px; text-align:center; line-height:40px;
        background:transparent; color:#f00; border-radius:50%; cursor:pointer;
        -moz-transition:all 0.3s; -webkit-transition:all 0.3s; transition:all 0.3s;
    }
    #panel-section-1 .wrap .order-details-port .btn-close:hover{
        transform:rotate(90deg);
    }
    /* 订单详情弹出层样式 end */


    /* 商品大类模块 start && 商品详情弹出层 start */
    #panel-section-3 .wrap .goods-details-wrap {
        display:none; position:absolute; z-index:100;
        width:1200px; height:580px;
        background:#91c46b;
        border-radius:10px;
    }
    #panel-section-3 .wrap .goods-details-wrap li {
        float:left; 
        width:140px; height:166px; margin:5px; padding-bottom:15px;
        text-align:center; background:#fff; 
        overflow:hidden; border:1px solid #000; border-radius:5px; box-shadow: 0 0 2px 0 #000;
    }
    #panel-section-3 .wrap .goods-details-wrap li img{
        width:120px; height:130px; margin:0 10px;
    }
    #panel-section-3 .wrap .goods-details-wrap li span {
        font-size:16px; line-height:20px; font-weight:200;
    }
    #panel-section-3 .wrap .goods-details-wrap li .remove-good {
        position:relative;
        top:6px; width:140px; height:40px; 
        line-height:40px; text-align:center; background:#f00; color:#fff;
        cursor:pointer; -webkit-transition:all 0.20s ease-in-out;-moz-transition:all 0.15s ease-in-out;-o-transition:all 0.15s ease-in-out;-ms-transition:all 0.15s ease-in-out;transition:all 0.15s ease-in-out;  -moz-user-select:none; -webkit-user-select:none; -ms-user-select:none; user-select:none;
    }
    #panel-section-3 .wrap .goods-details-wrap li:hover .remove-good {
        transform: translateY(-40px);-webkit-transform:translateY(-40px);-moz-transform:translateY(-40px);-ms-transform:translateY(-40px);-o-transform:translateY(-40px);
    }
    /* 商品详情弹出层 end && "上架商品"弹出层 start */
    #panel-section-3 .wrap .add-goods-container {
        display:none;position:absolute; z-index:100;
        width:1200px; height:580px;
        background: rgba(0,0,0,0.5);
    }
    #panel-section-3 .wrap .add-goods-wrap {
        position:absolute;
        width:300px; height:500px; left:0; right:0; top:0; bottom:0; margin:auto;
        background:#91c46b;
        border-radius:10px;
    }
    #panel-section-3 .wrap .add-goods-wrap .add-btn-close {
        position:absolute;
        right:-40px; top:0; width:40px; height:40px;
        font-size:20px; font-weight:400; text-align:center; line-height:40px;
        background:transparent; color:#f00; border-radius:50%; cursor:pointer;
        -moz-transition:all 0.3s; -webkit-transition:all 0.3s; transition:all 0.3s;
    }
    #panel-section-3 .wrap .add-goods-wrap .add-btn-close:hover{
        transform:rotate(90deg);
    }
    #panel-section-3 .wrap .add-goods-wrap .add-goods-image{
        display:block;
        width:200px; height:220px; margin:40px auto 0;
        overflow:hidden;
    }
    #panel-section-3 .wrap .add-goods-wrap .add-goods-image img {
        width:200px; height:220px;
    }
    #panel-section-3 .wrap .add-goods-wrap .lab-choose-img {
        background:#FFFFCC; color:#666;
        cursor:pointer;
    }
    #panel-section-3 .wrap .add-goods-wrap input {
        display:block;
        width:200px; height:40px; margin:10px auto; padding:0;
        line-height:40px; text-align:center; font-size:16px; color:#fff;
        border:0 solid #fff; border-radius:5px;
    }
    #panel-section-3 .wrap .add-goods-wrap input.desc, #panel-section-3 .wrap .add-goods-wrap input.price {
        color:#000; 
    }
    #panel-section-3 .wrap .add-goods-wrap input.btn-add-goods-add{
        margin-top:40px;
        background:#0094ff;
        cursor:pointer;
    }
    #panel-section-3 .wrap .add-goods-wrap input.btn-add-goods-close{
        background:#f00;
        cursor:pointer;
    }
    /* "上架商品"弹出层 end */
    #panel-section-3 .wrap ul {
        width:1100px; height:580px;
    }
    #panel-section-3 .wrap ul li {
        position:relative; float:left;
        width:255px; height:170px; margin:10px;
        overflow:hidden; font-size:16px;
        background:#fff; border-radius:10px;  box-shadow: 0 0 5px 3px #ccc;
    }
    #panel-section-3 .wrap ul li .image{
        position:relative; 
        width:255px; height:170px;
        text-align:center;
        -webkit-transition:all 0.20s ease-in-out;-moz-transition:all 0.15s ease-in-out;-o-transition:all 0.15s ease-in-out;-ms-transition:all 0.15s ease-in-out;transition:all 0.15s ease-in-out;  
    }
    #panel-section-3 .wrap ul li .image img{
        width:255px; height:170px;
    }
    #panel-section-3 .wrap ul li .caption{
        position:absolute; 
        width:255px; height:170px; top:170px; 
        background:#91c46b;
        -webkit-transition:all 0.20s ease-in-out;-moz-transition:all 0.15s ease-in-out;-o-transition:all 0.15s ease-in-out;-ms-transition:all 0.15s ease-in-out;transition:all 0.15s ease-in-out;  
    }
    #panel-section-3 .wrap ul li .caption .blur { 
        z-index: 5; position: absolute;
        height: 130px; width: 235px; padding:20px 10px; 
        color:#ffffff; text-align:center; }
    #panel-section-3 .wrap ul li .caption .blur span {
        font-size:16px; line-height:30px;
    }
    #panel-section-3 .wrap ul li .caption .blur .btn-details { 
        width:130px; height:32px; margin-bottom:20px;
        font:300 16px/30px 'Microsoft Yahei'; background:#ffffff;  color:#91c46b;
        border: 1px solid #91c46b;  border-radius:3px; cursor:pointer;}
    #panel-section-3 .wrap ul li .caption .blur .btn-add {
        width:130px; height:32px; margin-bottom:20px;
        font:300 16px/30px 'Microsoft Yahei';background:#FFFFCC; color:#666;
        border: 1px solid #91c46b;  border-radius:3px; cursor:pointer;
    }
    #panel-section-3 .wrap ul li:hover .caption {
        transform: translateY(-170px);-webkit-transform:translateY(-170px);-moz-transform:translateY(-170px);-ms-transform:translateY(-170px);-o-transform:translateY(-170px);
    }
    #panel-section-3 .wrap ul li:hover .image {
        transform: translateY(-170px);-webkit-transform:translateY(-170px);-moz-transform:translateY(-170px);-ms-transform:translateY(-170px);-o-transform:translateY(-170px);
    }
    #panel-section-3 .wrap .goods-btn-close {
        position:absolute;
        width:30px; height:30px; right:15px; top:15px;
        font-size:24px; line-height:30px; text-align:center;  color:#f00;
        cursor:pointer;-moz-transition:all 0.3s; -webkit-transition:all 0.3s; transition:all 0.3s; -moz-user-select:none;
    }
    #panel-section-3 .wrap .goods-btn-close:hover {
        transform:rotate(90deg);
    }
    

    /* 商品大类模块 end */
    #panel-section-4 .wrap ul { 
        width:100%; height:510px; padding: 10px;
        overflow:auto;
    }
    #panel-section-4 .wrap ul li { 
        position:relative;
        width:890px; height:80px; margin: 20px; padding-left:200px;
        line-height:80px; 
        background:#f3f3f3; border-radius:10px; box-shadow: 0 0 10px 2px #ccc;
    }
    #panel-section-4 .wrap ul li img {
        position:absolute; 
        left:60px; top:5px; width:70px; height:70px; 
        border-radius:50%; border:1px solid #eee;
    }
    #panel-section-4 .wrap ul li .username {
        display:inline-block;
        width:200px; height:40px; 
        line-height:40px; text-align:left; font-size:16px; 
    }
    #panel-section-4 .wrap ul li .password { 
        display:inline-block;
        width:70px; height:40px; 
        text-align:center;
        border:none; background:#f3f3f3; font-size:16px; border-radius:20px;
    }
    #panel-section-4 .wrap ul li .btn {
        position:absolute; display:inline-block;
        right:40px; top:25px; width:100px; height:30px;
        border:none; background:#FF3333; color:#fff;
        border-radius:5px; cursor:pointer; 
    }

    #panel-section-5 .wrap .admin-photo-wrap {
        position:absolute; z-index:1;
        left:50%; top:50%; height:150px; width:150px; margin-top:-150px;
        border-radius:50%; overflow:hidden; border:1px solid #ccc; box-shadow: 0 0 10px 2px #aaa;
        transform:translate(-50%, -50%);
    }
    #panel-section-5 .wrap .admin-photo-wrap img {
        width:150px; height:150px; 
    }
    #panel-section-5 .wrap .admin-info-wrap {
        position:absolute;
        left:50%; top:60%; width:400px; height:300px; padding-top:100px; 
        background:#fff; border:1px solid #ccc; box-shadow: 0 0 10px 2px #ccc;
        transform:translate(-50%, -50%); border-radius:10px;
    }
    #panel-section-5 .wrap .admin-info-wrap h2 {
        width: 200px; height:40px; margin:40px auto; 
        line-height:40px; font-weight:300; font-size:20px;
    }
    #panel-section-5 .wrap .admin-info-wrap h2 .iconfont {
        margin-right:15px;
    }
    #panel-section-5 .wrap .admin-info-wrap .admin-name { }
    #panel-section-5 .wrap .admin-info-wrap .admin-pwd { }
    /*
    #panel-section-5 .wrap .admin-add { 
        position:absolute; 
        left: 20px; top:0px; width:1090px; height:80px; margin: 10px; 
        line-height:80px; font-size:16px; text-align:center;
        background:#f3f3f3; border-radius:10px; box-shadow: 0 0 10px 2px #ccc; cursor:pointer;
    }
    #panel-section-5 .wrap ul{
        position:absolute;
        left: 30px; top:100px; width:1090px; height:500px;
    }
    #panel-section-5 .wrap ul li {
        width:890px; height:80px; margin:20px 0 20px 0; padding-left:200px;
        line-height:80px; 
        background:#f3f3f3; border-radius:10px; box-shadow: 0 0 10px 2px #ccc;
    }*/
    #panel-section-6 .wrap .content{
        position:absolute; 
        left:50%; top:50%; width:400px; height:250px;
        line-height:250px; text-align:center; font-size:20px;
        transform:translate(-50%, -50%);  border-radius:10px;
    }
    #panel-section-2 .wrap .content{
        position:absolute; 
        left:50%; top:50%; width:400px; height:250px;
        line-height:250px; text-align:center; font-size:20px;
        transform:translate(-50%, -50%);  border-radius:10px;
    }
</style>
<style type="text/css">
    
</style>
</head>
<body>
        <div class="left-top">H</div>
        
        <!-- 上部导航栏 -->
        <div class="top-nav">
            <!-- 标题部分 -->
            <div class="title-wrap">
                <h1 class="title">订单管理模块</h1>
                <h1 class="title">商品管理模块</h1>
                <h1 class="title">分类管理模块</h1>
                <h1 class="title">用户管理模块</h1>
                <h1 class="title">管理员信息</h1>
                <h1 class="title">杂项管理</h1>
            </div>
            <!-- 管理员登录信息 -->
            <div id="adminInfo">
                <img alt="admin-photo" src=""/>
                <h5 class="fr" id="adminName"></h5>
            </div>
        </div>
        
        <!-- 左部导航栏 -->
        <div class="left-nav" ></div>
        <input type="radio" name="radioSet" checked="checked" class="controller" id="controller-1"/>
        <a>
            <i class="iconfont">&#xe656;</i>
            <h4 class="tooltips">
                <strong class="trangle"></strong>
                <span class="tooltips-text">订单管理</span>
            </h4>
        </a>
        <input type="radio" name="radioSet" class="controller" id="controller-2"/>
        <a>
            <span><i class="iconfont">&#xe620;</i></span>
            <h4 class="tooltips">
                <strong class="trangle"></strong>
                <span class="tooltips-text">商品管理</span>
            </h4>
        </a>
        <input type="radio" name="radioSet" class="controller" id="controller-3"/>
        <a >
            <span><i class="iconfont">&#xe61c;</i></span>
            <h4 class="tooltips">
                <strong class="trangle"></strong>
                <span class="tooltips-text">分类管理</span>
            </h4>
        </a>
        <input type="radio" name="radioSet" class="controller" id="controller-4"/>
        <a>
            <span><i class="iconfont">&#xe66e;</i></span>
            <h4 class="tooltips">
                <strong class="trangle"></strong>
                <span class="tooltips-text">用户管理</span>
            </h4>
        </a>
        <input type="radio" name="radioSet" class="controller" id="controller-5"/>
        <a>
            <span><i class="iconfont">&#xe63f;</i></span>
            <h4 class="tooltips">
                <strong class="trangle"></strong>
                <span class="tooltips-text">管理员信息</span>
            </h4>
        </a>
        <input type="radio" name="radioSet" class="controller" id="controller-6"/>
        <a>
            <span><i class="iconfont">&#xe631;</i></span>
            <h4 class="tooltips">
                <strong class="trangle"></strong>
                <span class="tooltips-text">杂项管理</span>
            </h4>
        </a>

        <!-- 主界面 -->
        <div class="main-panel">
            <!-- 订单模块 -->
            <section class="part-panel" id="panel-section-1">
                <div class="wrap">
                    <!-- 导航条 -->
                    <div class="title-nav">
                        <ul class="clear">
                            <li>订单编号</li>
                            <li>下单时间</li>
                            <li>下单用户</li>
                            <li>支付状态</li>
                            <li>打包/自提状态</li>
                        </ul>
                    </div>
                    <!-- 订单内容列表 -->
                    <ul class="content">
                        <!--
                        <li data-oid="">
                            <span class="order-id">123456789</span>
                            <span class="order-time">20130405</span>
                            <span class="order-owner">123123123</span>
                            <span class="pay-status">未支付</span>
                            <span class="pack-status">已自提</span>
                        </li>
                        -->
                    </ul>
                    <!-- 订单详情弹出层 -->
                    <div class="order-details-port">
                        <!-- 订单内货物 -->
                        <div class="left">
                            <ul>
                                <!--
                                <li>
                                    <img alt="goods-photo" src="../img/GoodsPic/2.jpg"
                                    /><span>商品描述
                                    </span><br /><span>00.00</span>
                                </li>
                                -->
                            </ul>
                        </div>
                        <!-- "打包"按钮 -->
                        <div class="right">
                            <div class="btn-pack"><i class="iconfont">&#xe639;</i></div>
                            <div class="btn-pick"><i class="iconfont">&#xe7bc;</i></div>
                        </div>
                        <!-- "关闭"按钮 -->
                        <div class="btn-close">
                            <i class="iconfont">&#xe60b;</i>
                        </div>
                    </div>
                </div>
            </section>
            <!-- 商品管理模块 -->
            <section class="part-panel" id="panel-section-2">
                <div class="wrap">
                    <div class="content">
                        <span>暂无更多···</span>
                    </div>
                </div>
            </section>
            <!-- 商品大类管理模块 -->
            <section class="part-panel" id="panel-section-3">
                <div class="wrap">
                    <!-- 商品子类弹出层 -->
                    <div class="goods-details-wrap">
                        <div class="goods-btn-close"><i class="iconfont">&#xe60b;</i></div>
                        <ul>
                            <li data-gid="">
                                <img alt="goods-photo" src="../img/GoodsPic/2.jpg"
                                /><span>商品描述
                                </span><br /><span>00.00</span>
                                <div class="remove-good">下架商品</div>
                            </li>
                        </ul>
                    </div>
                    <!-- 上架商品弹出层 -->
                    <div class="add-goods-container">
                        <div class="add-goods-wrap">
                            <label class="lab-choose-img add-goods-image" id="lab-file-input" for="file-input">
                                <img alt="点击上传图片" src=""/>
                            </label>
                            <input type="file" id="file-input" style="position:absolute; clip:rect(0,0,0,0)"/>
                            
                            <div class="add-btn-close"><i class="iconfont">&#xe60b;</i></div>
                            
                            <input type="text" class="desc" placeholder="请输入商品描述"/>
                            <input type="text" class="price" placeholder="请输入商品价格"/>
                            <input type="button" value="添加" class="btn-add-goods-add"/>
                            <!--<input type="button" value="关闭" class="btn-add-goods-close"/>-->
                        </div>
                    </div>
                    <!-- 菜单大类 -->
                    <ul class="clear">
                        <li>
                            <div class="image"><img src="" alt="食品生鲜" /></div>
                            <div class="caption">
                                <div class="blur">
                                    <input data-id=""  type="button" class="btn-details" value="查看更多"/><br />
                                    <input data-id="" type="button" class="btn-add" value="上架商品"/><br />
                                    <span>描述性文字</span>
                                </div>
                                <div class="caption-area">
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="image"><img src="" alt="食品、饮料、酒水" /></div>
                            <div class="caption">
                                <div class="blur">
                                    <input data-id="" type="button" class="btn-details" value="查看更多"/><br />
                                    <input data-id="" type="button" class="btn-add" value="上架商品"/><br />
                                    <span>描述性文字</span>
                                </div>
                                <div class="caption-area">
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="image"><img src="" alt="进口食品、进口好货" /></div>
                            <div class="caption">
                                <div class="blur">
                                    <input data-id="" type="button" class="btn-details" value="查看更多"/><br />
                                    <input data-id="" type="button" class="btn-add" value="上架商品"/><br />
                                    <span>描述性文字</span>
                                </div>
                                <div class="caption-area">
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="image"><img src="" alt="美妆洗护、个人护理" /></div>
                            <div class="caption">
                                <div class="blur">
                                    <input data-id="" type="button" class="btn-details" value="查看更多"/><br />
                                    <input data-id="" type="button" class="btn-add" value="上架商品"/><br />
                                    <span>描述性文字</span>
                                </div>
                                <div class="caption-area">
                                </div>
                            </div>
                        </li>
                        <li class="fl">
                            <div class="image"><img src="" alt="家清纸品、厨具餐具" /></div>
                            <div class="caption">
                                <div class="blur">
                                    <input data-id="" type="button" class="btn-details" value="查看更多"/><br />
                                    <input data-id="" type="button" class="btn-add" value="上架商品"/><br />
                                    <span>描述性文字</span>
                                </div>
                                <div class="caption-area">
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="image"><img src="" alt="家纺、家具、家妆" /></div>
                            <div class="caption">
                                <div class="blur">
                                    <input data-id="" type="button" class="btn-details" value="查看更多"/><br />
                                    <input data-id="" type="button" class="btn-add" value="上架商品"/><br />
                                    <span>描述性文字</span>
                                </div>
                                <div class="caption-area">
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="image"><img src="" alt="手机数码、电脑办公" /></div>
                            <div class="caption">
                                <div class="blur">
                                    <input data-id="" type="button" class="btn-details" value="查看更多"/><br />
                                    <input data-id="" type="button" class="btn-add" value="上架商品"/><br />
                                    <span>描述性文字</span>
                                </div>
                                <div class="caption-area">
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="image"><img src="" alt="图书、文具" /></div>
                            <div class="caption">
                                <div class="blur">
                                    <input data-id="" type="button" class="btn-details" value="查看更多"/><br />
                                    <input data-id="" type="button" class="btn-add" value="上架商品"/><br />
                                    <span>描述性文字</span>
                                </div>
                                <div class="caption-area">
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="image"><img src="" alt="女装、内衣" /></div>
                            <div class="caption">
                                <div class="blur">
                                    <input data-id="" type="button" class="btn-details" value="查看更多"/><br />
                                    <input data-id="" type="button" class="btn-add" value="上架商品"/><br />
                                    <span>描述性文字</span>
                                </div>
                                <div class="caption-area">
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="image"><img src="" alt="男装、运动、户外" /></div>
                            <div class="caption">
                                <div class="blur">
                                    <input data-id="" type="button" class="btn-details" value="查看更多"/><br />
                                    <input data-id="" type="button" class="btn-add" value="上架商品"/><br />
                                    <span>描述性文字</span>
                                </div>
                                <div class="caption-area">
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="image"><img src="" alt="购物卡、票券" /></div>
                            <div class="caption">
                                <div class="blur">
                                    <input data-id="" type="button" class="btn-details" value="查看更多"/><br />
                                    <input data-id="" type="button" class="btn-add" value="上架商品"/><br />
                                    <span>描述性文字</span>
                                </div>
                                <div class="caption-area">
                                </div>
                            </div>
                        </li>

                    </ul>
                </div>
            </section>
            <!-- 普通用户模块 -->
            <section class="part-panel" id="panel-section-4">
                <div class="wrap">
                    <ul>
                        <!--
                        <li data-uid="">
                            <img alt="user-head" src="../img/UserInfo/zyc.jpg"/>
                            <span class="username">我是用户名</span>
                            <input class="password" value="123456"/>
                            <input class="btn" type="button" value="注销"/>
                        </li>
                        -->
                    </ul>
                </div>
            </section>
            
            <!-- 管理员模块 -->
            <section class="part-panel" id="panel-section-5">
                <div class="wrap">
                    <!--
                    <div class="admin-add">添加管理员</div>
                    <ul>
                        <li>
                            <img alt="admin-photo" src="../img/UserInfo/zyc.jpg"/>
                            <span>我是管理员名称</span>
                        </li>
                    </ul>
                    -->
                    <div class="admin-photo-wrap">
                        <img alt="admin-photo" src=""/>
                    </div>
                    <div class="admin-info-wrap">
                        <h2 class="admin-name"><i class="iconfont">&#xe617;</i><span></span></h2>
                        <h2 class="admin-pwd"><i class="iconfont">&#xe633;</i><span></span></h2>
                    </div>
                </div>
            </section>

            <!-- 杂项 -->
            <section class="part-panel" id="panel-section-6">
                <div class="wrap">
                    <div class="content">
                        <span>暂无更多···</span>
                    </div>
                </div>
            </section>
        </div>
<script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
    $(function () {
        $(document).ready(function () {
            var sid = window.location.href.split('sid=');
            var UserId = sid[1]; //获取管理员的用户编号

            //加载订单信息
            /*
                已删除订单 status = "10";
                未支付订单 pay = "false"; status = "1";
                待打包订单 pay = "true";  status = "2";
                已打包待自提订单 pay = "true";  status = "3";
                已自提订单 pay = "true";  status = "4";
            */
            $.ajax({
                type: 'POST',
                url: '../GetOrderList.aspx',
                dataType: 'text',
                data: 'UserID=' + "",
                success: function (result) {
                    //console.log("success");
                    //console.log(result);
                    //console.log(result);
                    var OrderListInfo = JSON.parse(result);
                    //console.log(OrderListInfo);
                    /* 动态创建订单列表 */
                    for (var i = 0 ; i < OrderListInfo.length ; i++) {
                        if (OrderListInfo[i].IsPay == false) {
                            OrderListInfo[i].IsPay = "未支付"
                        }
                        if (OrderListInfo[i].IsPay == true) {
                            OrderListInfo[i].IsPay = "已支付"
                        }
                        switch(OrderListInfo[i].Status)
                        {
                            case 1:
                                OrderListInfo[i].Status = "未支付";
                                break;
                            case 2:
                                OrderListInfo[i].Status = "待打包";
                                break;
                            case 3:
                                OrderListInfo[i].Status = "已打包待自提";
                                break;
                            case 4:
                                OrderListInfo[i].Status = "已自提";
                                break;
                            case 10:
                                OrderListInfo[i].Status = "已被用户删除";
                                break;
                            default:
                                OrderListInfo[i].Status = "状态错误";
                        }
                        var OrderList = '<li data-oid=' + OrderListInfo[i].OrderID + '><span class="order-id">' + OrderListInfo[i].OrderID + '</span><span class="order-time">' + OrderListInfo[i].OrderTime + '</span><span class="order-owner">' + OrderListInfo[i].OrderOwnerID + '</span><span class="pay-status">' + OrderListInfo[i].IsPay + '</span><span class="pack-status">' + OrderListInfo[i].Status + '</span></li>';
                        $("#panel-section-1 .content").append(OrderList);
                    }
                },
                error: function (status, result, thrownText) {
                    if (status == 'error') {
                        console.log(thrownText.toString());
                    }
                }
            });

            setTimeout($.ajax({
                type: 'POST',
                url: '../GetOrderList.aspx',
                dataType: 'text',
                data: 'UserID=' + "",
                success: function (result) {
                    //console.log("success");
                    //console.log(result);
                    //console.log(result);
                    var OrderListInfo = JSON.parse(result);
                    //console.log(OrderListInfo);
                    /* 动态创建订单列表 */
                    for (var i = 0 ; i < OrderListInfo.length ; i++) {
                        if (OrderListInfo[i].IsPay == false) {
                            OrderListInfo[i].IsPay = "未支付"
                        }
                        if (OrderListInfo[i].IsPay == true) {
                            OrderListInfo[i].IsPay = "已支付"
                        }
                        switch (OrderListInfo[i].Status) {
                            case 1:
                                OrderListInfo[i].Status = "未支付";
                                break;
                            case 2:
                                OrderListInfo[i].Status = "待打包";
                                break;
                            case 3:
                                OrderListInfo[i].Status = "已打包待自提";
                                break;
                            case 4:
                                OrderListInfo[i].Status = "已自提";
                                break;
                            case 10:
                                OrderListInfo[i].Status = "已被用户删除";
                                break;
                            default:
                                OrderListInfo[i].Status = "状态错误";
                        }
                        var OrderList = '<li data-oid=' + OrderListInfo[i].OrderID + '><span class="order-id">' + OrderListInfo[i].OrderID + '</span><span class="order-time">' + OrderListInfo[i].OrderTime + '</span><span class="order-owner">' + OrderListInfo[i].OrderOwnerID + '</span><span class="pay-status">' + OrderListInfo[i].IsPay + '</span><span class="pack-status">' + OrderListInfo[i].Status + '</span></li>';
                        $("#panel-section-1 .content").append(OrderList);
                    }
                },
                error: function (status, result, thrownText) {
                    if (status == 'error') {
                        console.log(thrownText.toString());
                    }
                }
            }), 1000);

            //点击订单显示相应订单内商品
            var oid = '';
            var oli = '';
            $('.content').delegate('li', 'click', function () {
                var pack_status = $(this).children('.pack-status').html(); //获取订单状态
                $('.order-details-port .left ul').html("");
                oid = $(this).data('oid'); //获取订单编号
                oli = this; //获取该订单列表
                $.ajax({
                    type: 'POST',
                    url: '../GetGoodsList.aspx',
                    data: 'OrderID=' + oid + '&Status=' + 3,
                    dataType: 'text',
                    success: function (result) {
                        console.log(result);
                        var glilist = JSON.parse(result);
                        for( var i = 0 ; i < glilist.length ; i++ ){
                            var gli = '<li><img alt="goods-photo" src=' + '../' + glilist[i].GoodsPic + '><span>' + glilist[i].GoodsName + '</span><br /><span>' + glilist[i].GoodsPrice + '</span></li>'
                            $('.order-details-port .left ul').append(gli);
                        }
                        switch(pack_status)
                        {
                            case "已被用户删除":
                                $('.btn-pack').css("display", "none");
                                $('.btn-pick').css("display", "none");
                                break;
                            case "未支付":
                                $('.btn-pack').css("display", "none");
                                $('.btn-pick').css("display", "none")
                                break;
                            case "待打包":
                                $('.btn-pack').css("display", "block");
                                $('.btn-pick').css("display", "none");
                                break;
                            case "已打包待自提":
                                $('.btn-pack').css("display", "none");
                                $('.btn-pick').css("display", "block");
                                break;
                            case "已自提":
                                $('.btn-pack').css("display", "none");
                                $('.btn-pick').css("display", "none");
                                break;
                        }

                    },
                    error: function (status, result, thrownText) {
                        if (status == 'error') {
                            console.log(thrownText.toString());
                        }
                    }
                });
                $('.order-details-port').slideDown(400);
            });

            //打包订单
            $('.btn-pack').click(function () {
                $.ajax({
                    type: 'POST',
                    url: 'PackOrderList.aspx',
                    data: 'OrderID=' + oid + '&Status=' + 3,
                    success: function (result) {
                        console.log(result);
                        $('.order-details-port').slideUp(400);
                        $(oli).children('.pack-status').html("已打包待自提");
                    },  
                    error: function (status, result, thrownText) {
                        if (status == 'error') {
                            console.log(thrownText.toString());
                        }
                    }
                })
            });

            //确认用户自提订单
            $('.btn-pick').click(function () {
                $.ajax({
                    type: 'POST',
                    url: 'PackOrderList.aspx',
                    data: 'OrderID=' + oid + '&Status=' + 4,
                    success: function (result) {
                        console.log(result);
                        $('.order-details-port').slideUp(400);
                        $(oli).children('.pack-status').html("已自提");
                    },
                    error: function (status, result, thrownText) {
                        if (status == 'error') {
                            console.log(thrownText.toString());
                        }
                    }
                })
            });

            //点击关闭按钮关闭遮罩层
            $('.btn-close').click(function () {
                $('.order-details-port').slideUp(400);
            });

            //加载管理员信息
            $.ajax({
                type: "POST",
                url: '../GetUserDetails.aspx',
                data: 'UserID=' + UserId,
                dataType: 'text',
                success: function (result) {
                    //console.log("success");
                    var UserInfo = JSON.parse(result);
                    // 设置用户名和头像
                    $("#adminInfo img").attr("src", "../" + UserInfo[0].HeadPhoto);
                    $(".admin-photo-wrap img").attr("src", "../" + UserInfo[0].HeadPhoto);
                    $(".admin-name span").html(UserInfo[0].UserName);
                    $(".admin-pwd span").html(UserInfo[0].UserPwd);
                    $("#adminName").text(UserInfo[0].UserName);
                },
                error: function (status, result, thrownText) {
                    if (status == 'error') {
                        console.log(thrownText.toString());
                    }
                }
            });
            //加载商品大类信息
            $.ajax({
                type: 'GET',
                url: '../mainInterfaceDefault01.aspx',
                data: '',
                dataType: 'text', //预期服务器返回的数据类型
                success: function (result) {
                    //console.log("success");
                    var sth = JSON.parse(result);
                    //console.log(sth);
                    for (var i = 0; i < sth.length ; i++) {
                        $(".image img")[i].src = "../" + sth[i].GoodsClassPic;
                        $(".blur span")[i].innerHTML = sth[i].GoodsClassName;
                        $(".blur input.btn-details").eq(i).data("id", sth[i].GoodsClassID);
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
            //点击"查看更多"弹出的子类商品遮罩层
            $(".blur input").click(function () {
                $(".btn_close").css("display", "block");
                var clickid = $(this).data("id");
                $.ajax({
                    type: 'post',
                    url: '../mainInterfaceGoodsList.aspx',
                    data: 'GoodsClassID= ' + clickid,
                    dataType: 'text',
                    success: function (result) {
                        var goodsList = JSON.parse(result);
                        $(".goods-details-wrap ul").empty(); //先清空
                        for (var i = 0 ; i < goodsList.length ; i++) {
                            var ListLi = '<li data-gid='+ goodsList[i].GoodsID +'><img alt="goods-photo" src='+ '../' + goodsList[i].GoodsPic +'><span>'+ goodsList[i].GoodsName +'</span><br /><span>'+ goodsList[i].GoodsPrice +'</span><div class="remove-good">下架商品</div></li>';
                            $(".goods-details-wrap ul").append(ListLi);
                        }
                    },
                    error: function (result, status) {
                        if (status == 'error') {
                            console.log(status);
                        }
                    }
                });
            });
            //下架商品
            $('.goods-details-wrap ul').delegate('li .remove-good', 'click', function () {
                var gid = $(this).parent().data('gid');
                var isR = 0;
                console.log( gid );
                $(this).parent().hide(200);
                
                $.ajax({
                    type: 'post',
                    url: 'UpdateGood.aspx',
                    data: 'GoodsID= ' + gid + '&IsR=' + isR,
                    dataType: 'text',
                    success: function (result) {
                        console.log(result);
                    },
                    error: function (result, status) {
                        if (status == 'error') {
                            console.log(status);
                        }
                    }
                })
            })

            //点击"上架商品"弹出"添加商品"层
            var addId = "";
            $('.btn-add').click(function () {
                $('.add-goods-container').slideDown(400);
                $('.add-goods-container').children().children('.btn-add-goods-add').val("添加");
                addId = $(this).prev().prev().data('id');
            })
            //点击"关闭"按钮关闭"添加商品"层
            $('.add-btn-close').click(function () {
                //alert(1);   
                $(this).parent().parent().slideUp(400);
            })
            //上架商品
            $('.btn-add-goods-add').click(function () {
                var priceTxt = $(this).prev().val().trim(); //需要上架商品的价格
                var descTxt = $(this).prev().prev().val().trim(); //需要上架商品的描述
                var imgSrc = $(this).prev().prev().prev().prev().prev().children().attr("src").substring(3); //需要上架商品的src
                var that = this;
                //console.log(priceTxt, descTxt, imgSrc, addId);
                if (priceTxt != "" && descTxt != "" && imgSrc != "") {
                    $.ajax({
                        type: 'POST',
                        url: 'AddGoods.aspx',
                        data: 'descTxt=' + descTxt + '&priceTxt=' + priceTxt + '&imgSrc=' + imgSrc + '&addId=' + addId,
                        dataType: 'text',
                        success: function (result) {
                            $(that).prev().val("");
                            $(that).prev().prev().val("");
                            $(that).prev().prev().prev().prev().prev().children().attr("src", "");
                            $(that).val("上架成功！继续添加");
                            console.log(result);
                        },
                        error: function (status, result, thrownText) {
                            if (status == 'error') {
                                console.log(thrownText.toString());
                            }
                        }
                    })
                }
                else {
                    $(this).val("请不要输入空内容，添加");
                }
                
            });


            //点击图片区域选择图片
            $('#file-input').on("change", function (e) {
                var fileList = e.target.files;
                var file = fileList[0];
                console.log($(this).prev());
                $(this).prev().children().attr("src", "../img/GoodsPic/" + file.name);
                console.log($(this).prev().children());
                console.log(file);
            })

            //function handleFiles() {
            //    var fileList = this.files;
            //    console.log(fileList[0].name);
            //}


            //点击图标滑动至相应section
            $("#controller-1").click(function () {
                $('.title-wrap').animate({ top: "0" }, 300);
            });
            $("#controller-2").click(function () {
                $('.title-wrap').animate({ top: "-60px" }, 300);
            });
            $("#controller-3").click(function () {
                $('.title-wrap').animate({ top: "-120px" }, 300);
            });
            $("#controller-4").click(function () {
                $('.title-wrap').animate({ top: "-180px" }, 200);
            });
            $("#controller-5").click(function () {
                $('.title-wrap').animate({ top: "-240px" }, 300);
            });
            $("#controller-6").click(function () {
                $('.title-wrap').animate({ top: "-300px" }, 300);
            });

            //加载普通用户信息
            $.ajax({
                type: "POST",
                url: '../GetUserDetails.aspx',
                data: "UserID=" + "",
                dataType: 'text',
                success: function (result) {
                    //console.log("success");
                    var UserInfo = JSON.parse(result);
                    //console.log(result);
                    for (var j = 0 ; j < UserInfo.length ; j++) {
                        var uli = '<li data-uid=' + UserInfo[j].UserID + '><img alt="user-head" src=' + '../' +  UserInfo[j].HeadPhoto +'><span class="username">'+ UserInfo[j].UserName +'</span><input class="password" value='+ UserInfo[j].UserPwd +'/><input class="btn" type="button" value="注销"/></li>'
                        $('#panel-section-4 ul').append(uli);
                    }
                },
                error: function (status, result, thrownText) {
                    if (status == 'error') {
                        console.log(thrownText.toString());
                    }
                }
            });
            
            //点击"注销按钮"


            //点击密码，显示输入框
            $('#panel-section-4 ul').delegate('.password', 'focus', function () {
                $(this).css("background", "#fff").animate({ width: "150px" }, 300);
            })
            //密码框输入密码,更改密码
            $('#panel-section-4 ul').delegate('.password', 'blur', function () {
                $(this).css("background", "#f3f3f3").animate({ width: "70px" }, 300);
                var uid = $(this).parent().data('uid');
                var newpwd = $(this).val();
                $.ajax({
                    type: 'POST',
                    url: 'UpdateUserPwd.aspx',
                    data: 'UserID=' + uid + '&UserPwd=' + newpwd,
                    dataType: 'text',
                    success: function (result) {
                    },
                    error: function (status, result, thrownText) {
                        if (status == 'error') {
                            console.log(thrownText.toString());
                        }
                    }
                });
            })

            //点击"注销"按钮，注销该用户
            $('#panel-section-4 ul').delegate('li .btn', 'click', function () {
                $(this).val("已注销").css("background", "#ccc").parent().hide(500);
                var uid = $(this).parent().data('uid');
                $.ajax({
                    type: 'POST',
                    url: 'LogoutUser.aspx',
                    data: 'UserID=' + uid,
                    dataType: 'text',
                    success: function (result) {
                    },
                    error: function (status, result, thrownText) {
                        if (status == 'error') {
                            console.log(thrownText.toString());
                        }
                    }
                });
            });

            //点击"查看更多"按钮 显示对应的子类商品
            $('.btn-details').click(function () {
                $('.goods-details-wrap').show(300);
            });

            //点击"关闭"按钮，关闭弹出层
            $('.goods-btn-close').click(function () {
                $('.goods-details-wrap').hide(300);
            })

        })
    });
</script>
</body>
</html>
