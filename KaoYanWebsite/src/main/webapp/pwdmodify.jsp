<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>修改个人信息</title>
<%--    <style>--%>
<%--        *{--%>
<%--            margin: 0;--%>
<%--            padding: 0;--%>
<%--        }--%>
<%--        body{--%>
<%--            font-size: 12px;--%>
<%--            background: #4287c2;--%>
<%--        }--%>
<%--        a{--%>
<%--            text-decoration: none;--%>
<%--        }--%>
<%--        li{--%>
<%--            list-style: none;--%>
<%--        }--%>

<%--        /*公共样式，头部*/--%>
<%--        .publicHeader{--%>
<%--            height: 48px;--%>
<%--            line-height: 48px;--%>
<%--            font-size: 14px;--%>
<%--            background: linear-gradient(to bottom,#60acf0,#64a5df,#62a0dd,#5994d6,#4f8ace,#4880ca);--%>
<%--            background:-webkit-linear-gradient(to bottom,#60acf0,#64a5df,#62a0dd,#5994d6,#4f8ace,#4880ca);--%>
<%--            background:-moz-linear-gradient(to bottom,#60acf0,#64a5df,#62a0dd,#5994d6,#4f8ace,#4880ca);--%>
<%--            background:-ms-linear-gradient(to bottom,#60acf0,#64a5df,#62a0dd,#5994d6,#4f8ace,#4880ca);--%>
<%--        }--%>
<%--        .publicHeader h1{--%>
<%--            float: left;--%>
<%--            color: #fff;--%>
<%--            font-size: 22px;--%>
<%--            padding-left:80px;--%>
<%--            text-shadow: 2px 1px #000;--%>
<%--            background: url("../images/xiugai.png") 30px center no-repeat;--%>

<%--        }--%>
<%--        .publicHeaderR{--%>
<%--            float: right;--%>
<%--            color: #fff;--%>
<%--            margin-right: 50px;--%>

<%--        }--%>
<%--        .publicHeaderR p{--%>
<%--            display: inline-block;--%>
<%--            font-weight: bold;--%>
<%--        }--%>
<%--        .publicHeaderR a{--%>
<%--            width: 50px;--%>
<%--            height: 28px;--%>
<%--            display: inline-block;--%>
<%--            border: 1px solid #679e43;--%>
<%--            background: linear-gradient(to bottom,#baf076,#a2d866,#9cd055,#8dc838,#8bc93a);--%>
<%--            line-height: 28px;--%>
<%--            text-align: center;--%>
<%--            border-radius: 4px;--%>
<%--            font-weight: bold;--%>
<%--            color: #fff;--%>

<%--        }--%>
<%--        .publicHeaderR a:hover,.publicHeaderR a:active{--%>
<%--            border: 1px solid #192b02;--%>
<%--            border-radius: 4px;--%>
<%--            font-weight: bold;--%>
<%--            background: linear-gradient(to bottom,#70b21c,#5c9613,#47740e,#3b6209,#2b4906);--%>
<%--        }--%>

<%--        /*公共部分主体内容*/--%>
<%--        .publicMian{--%>
<%--            border-top: 1px solid #c2ccd5;--%>
<%--            display: flex;  /*变为弹性盒模型*/--%>
<%--            display: -webkit-flex;--%>
<%--            background: #fff;--%>
<%--        }--%>
<%--        /*左边*/--%>
<%--        .left{--%>
<%--            width: 168px;--%>
<%--            background: url("../images/leftBg.png") 0 0 repeat-y;--%>
<%--            margin-right: 10px;--%>
<%--            /*height: 520px;*/--%>
<%--            min-height: 520px;--%>

<%--        }--%>
<%--        .leftH2{--%>
<%--            width: 140px;--%>
<%--            height: 30px;--%>
<%--            border-radius: 4px;--%>
<%--            line-height: 30px;--%>
<%--            text-align: center;--%>
<%--            color: #fff;--%>
<%--            background: #60b3e7;--%>
<%--            margin: 10px  auto;--%>
<%--            box-shadow:4px 4px rgba(212,212,212,0.7);--%>
<%--        }--%>
<%--        .leftH2 span{--%>
<%--            width: 10px;--%>
<%--            height: 10px;--%>
<%--            display: inline-block;--%>
<%--            background: radial-gradient(#70c2f4,#3a8dc1, #035384, #4696c7,#83d1f5);--%>
<%--            border-radius: 50%;--%>
<%--        }--%>
<%--        .span1{--%>
<%--            margin-right: 10px;--%>
<%--        }--%>
<%--        .span2{--%>
<%--            margin-left: 12px;--%>
<%--        }--%>

<%--        .list{--%>
<%--            margin: 0 20px;--%>
<%--            font-weight: bold;--%>
<%--        }--%>
<%--        .list li{--%>
<%--            height: 40px;--%>
<%--            line-height: 40px;--%>
<%--            border-bottom: 1px solid rgba(212,212,212,0.5) ;--%>
<%--        }--%>
<%--        .list li:nth-child(1){--%>
<%--            background: url("../images/zd.png") 0  center no-repeat;--%>
<%--        }--%>
<%--        .list li:nth-child(2){--%>
<%--            background: url("../images/clock.jpg") 0  center no-repeat;--%>
<%--        }--%>
<%--        .list li:nth-child(3){--%>
<%--            background: url("../images/yh.png") 0  center no-repeat;--%>
<%--        }--%>
<%--        .list li:nth-child(4){--%>
<%--            background: url("../images/mm.png") 0  center no-repeat;--%>
<%--        }--%>
<%--        .list li:nth-child(5){--%>
<%--            background: url("../images/tc.png") 0  center no-repeat;--%>
<%--        }--%>
<%--        .list li:hover{--%>
<%--            background-color: #acd5f5;--%>
<%--            border-radius: 4px;--%>
<%--        }--%>
<%--        .list li:active, #active{--%>
<%--            background-color: #92c609;--%>
<%--            border-radius: 4px;--%>
<%--        }--%>
<%--        .list a{--%>
<%--            color: #0042a8;--%>
<%--            display: inline-block;--%>
<%--            padding-left: 40px;--%>
<%--            width: 90%;--%>
<%--        }--%>


<%--        /*右边*/--%>
<%--        .right{--%>
<%--            width: 85%;--%>
<%--        }--%>
<%--        /*右边所在位置栏*/--%>
<%--        .location{--%>
<%--            height: 30px;--%>
<%--            line-height: 30px;--%>
<%--            border: 1px solid #e6eaf6;--%>
<%--            border-radius: 8px;--%>
<%--            background: linear-gradient(to bottom, #fefefe,#ffffff,#f6fafd);--%>
<%--            color: #4a4a4a;--%>
<%--            padding-left: 30px;--%>
<%--        }--%>
<%--        .location strong{--%>
<%--            background: url("../images/home.png") 0 center no-repeat;--%>
<%--            display: inline-block;--%>
<%--            padding-left: 30px;--%>
<%--        }--%>
<%--        .location span{--%>
<%--            color: #2179a9;--%>
<%--            font-weight:  bold;--%>
<%--        }--%>
<%--        /*搜索信息栏*/--%>
<%--        .search{--%>
<%--            height:50px;--%>
<%--            line-height:50px;--%>
<%--            background: #f6fafd;--%>
<%--            padding-left: 24px;--%>
<%--            color: #000;--%>
<%--        }--%>
<%--        .search input[type='text']{--%>
<%--            width: 200px;--%>
<%--            height: 30px;--%>
<%--            outline: none;--%>
<%--            padding-left: 10px;--%>
<%--            border: 1px solid #8ab2d5;--%>
<%--            border-radius: 4px;--%>
<%--        }--%>
<%--        .search input[type='button']{--%>
<%--            margin-left: 20px;--%>
<%--            width: 100px;--%>
<%--            padding: 0 20px;--%>
<%--            height: 30px;--%>
<%--            border: 1px solid #7ba92c;--%>
<%--            border-radius: 4px;--%>
<%--            color: #fff;--%>
<%--            font-weight: bold;--%>
<%--            background:#87c212 url("../images/search.png") 10px center no-repeat;--%>
<%--        }--%>
<%--        .search input[type='button']:focus{--%>
<%--            outline: none;--%>
<%--            background-color: #5d8410;--%>
<%--        }--%>
<%--        .search a{--%>
<%--            width: 80px;--%>
<%--            padding-left:40px;--%>
<%--            float: right;--%>
<%--            margin: 10px 60px;--%>
<%--            height: 30px;--%>
<%--            line-height: 30px;--%>
<%--            border: 1px solid #0c89de;--%>
<%--            border-radius: 4px;--%>
<%--            color: #fff;--%>
<%--            font-weight: bold;--%>
<%--            background:#47acf1 url("../images/tianjia.png") 10px center no-repeat;--%>
<%--            display: inline-block;--%>
<%--        }--%>
<%--        .search a:hover,.search a:active{--%>
<%--            background-color: #0778c5;--%>
<%--        }--%>
<%--        .search span{--%>
<%--            margin-left: 10px;--%>
<%--        }--%>
<%--        .search select{--%>
<%--            margin: 10px;--%>
<%--            width: 100px;--%>
<%--            height: 30px;--%>
<%--            border-radius: 4px;--%>
<%--            border: 1px solid #0c89de;--%>
<%--            outline: none;--%>
<%--        }--%>
<%--    </style>--%>
<%--    <style>--%>
<%--        * {--%>
<%--            margin: 0;--%>
<%--            padding: 0;--%>
<%--        }--%>

<%--        .loginHeader h1 {--%>
<%--            color: #fff;--%>
<%--            text-shadow: 2px 2px #000;--%>
<%--        }--%>
<%--        /*输入框里默认输入字体*/--%>
<%--        ::-webkit-input-placeholder {--%>
<%--            color: rgb(190, 188, 188);--%>
<%--            /*font-style: italic;*/--%>
<%--        }--%>

<%--        input:-moz-placeholder,--%>
<%--        textarea:-moz-placeholder {--%>
<%--            color: rgb(190, 188, 188);--%>
<%--            font-style: italic;--%>
<%--        }--%>

<%--        input {--%>
<%--            outline: none;--%>
<%--        }--%>
<%--        .loginForm label {--%>
<%--            width: 20%;--%>
<%--            display: inline-block;--%>
<%--        }--%>

<%--        .inputbox {--%>
<%--            height: 60px;--%>
<%--        }--%>

<%--        .info {--%>
<%--            color: red;--%>
<%--            font-weight:bold;--%>
<%--        }--%>

<%--        .inputbox input {--%>
<%--            width: 66%;--%>
<%--            padding: 10px 5px 10px 20px;--%>
<%--            border: 1px solid rgb(178, 178, 178);--%>
<%--            border-radius: 3px;--%>
<%--            -webkit-box-shadow: 0px 1px 4px 0px rgba(168, 168, 168, 0.6) inset;--%>
<%--            -moz-box-shadow: 0px 1px 4px 0px rgba(168, 168, 168, 0.6) inset;--%>
<%--            box-shadow: 0px 1px 4px 0px rgba(168, 168, 168, 0.6) inset;--%>

<%--        }--%>

<%--        /*输入框得到焦点的效果*/--%>
<%--        .inputbox input:active, .providerAdd input:focus,--%>
<%--        .inputbox input:focus {--%>
<%--            border: 1px solid rgba(91, 90, 90, 0.7);--%>
<%--            background: rgba(238, 236, 240, 0.2);--%>
<%--            -webkit-box-shadow: 0px 1px 4px 0px rgba(168, 168, 168, 0.9) inset;--%>
<%--            -moz-box-shadow: 0px 1px 4px 0px rgba(168, 168, 168, 0.9) inset;--%>
<%--            box-shadow: 0px 1px 4px 0px rgba(168, 168, 168, 0.9) inset;--%>
<%--        }--%>

<%--        .subBtn {--%>
<%--            margin-left: 70px;--%>
<%--        }--%>

<%--        /*/!*登录页登录和重置按钮*!/.providerView a是供应商管理页面下信息查看也得返回按钮的样式*/--%>
<%--        input[type='submit'], input[type='reset'], .providerView a {--%>
<%--            width: 30%;--%>
<%--            cursor: pointer;--%>
<%--            background: #54a4d7;--%>
<%--            padding: 6px 18px;--%>
<%--            font-family: 'BebasNeueRegular', 'Arial Narrow', Arial, sans-serif;--%>
<%--            color: #fff;--%>
<%--            font-size: 18px;--%>
<%--            border: 1px solid #4682be;--%>
<%--            margin-bottom: 10px;--%>
<%--            margin-right: 22px;--%>
<%--            text-shadow: 0 1px 1px rgba(0, 0, 0, 0.5);--%>
<%--            -webkit-border-radius: 3px;--%>
<%--            -moz-border-radius: 3px;--%>
<%--            border-radius: 3px;--%>
<%--            -webkit-box-shadow: 0px 1px 4px 4px rgba(0, 0, 0, 0.07) inset,--%>
<%--            0px 0px 0px 3px rgb(254, 254, 254),--%>
<%--            0px 5px 3px 3px rgb(210, 210, 210);--%>
<%--            -moz-box-shadow: 0px 1px 4px 4px rgba(0, 0, 0, 0.07) inset,--%>
<%--            0px 0px 0px 3px rgb(254, 254, 254),--%>
<%--            0px 5px 3px 3px rgb(210, 210, 210);--%>
<%--            box-shadow: 0px 1px 4px 4px rgba(0, 0, 0, 0.07) inset,--%>
<%--            0px 0px 0px 3px rgb(254, 254, 254),--%>
<%--            0px 5px 3px 3px rgb(210, 210, 210);--%>

<%--        }--%>

<%--        input[type='submit']:hover, input[type='reset']:hover {--%>
<%--            background: rgb(74, 179, 198);--%>
<%--        }--%>

<%--        input[type='submit']:active, input[type='submit']:focus,--%>
<%--        input[type='reset']:active, input[type='reset']:focus, .providerView a:hover, .providerView a:active {--%>
<%--            background: #2a5989;--%>
<%--            border: 1px solid rgb(12, 76, 87);--%>
<%--            -webkit-box-shadow: 0px 1px 6px 4px rgba(0, 0, 0, 0.2) inset;--%>
<%--            -moz-box-shadow: 0px 1px 6px 4px rgba(0, 0, 0, 0.2) inset;--%>
<%--            box-shadow: 0px 1px 6px 4px rgba(0, 0, 0, 0.2) inset;--%>
<%--        }--%>

<%--        .wFont h2 {--%>
<%--            font-size: 30px;--%>
<%--            line-height: 50px;--%>
<%--            color: #0a5eb6;--%>
<%--        }--%>

<%--        .wFont p {--%>
<%--            font-size: 14px;--%>
<%--            line-height: 30px;--%>
<%--            color: #5a656c;--%>
<%--        }--%>

<%--        .providerTable tr {--%>
<%--            height: 30px;--%>
<%--            line-height: 30px;--%>
<%--            text-align: center;--%>
<%--        }--%>

<%--        .providerTable tr:nth-child(odd) {--%>
<%--            background: #f6f7f9;--%>
<%--        }--%>

<%--        .providerTable tr:hover {--%>
<%--            background: #e9f9ca;--%>
<%--        }--%>

<%--        .firstTr {--%>
<%--            border: 1px solid #d6dfe6;--%>
<%--            background: linear-gradient(to bottom, #f3f8fc, #ebf4f9, #e3f1fa, #e0f0fd, #d8e9fd);--%>
<%--        }--%>

<%--        .firstTr th {--%>
<%--            border-right: 2px solid rgba(209, 218, 223, 0.4);--%>
<%--        }--%>

<%--        .providerTable td a {--%>
<%--            margin-top: 10px;--%>
<%--            display: inline-block;--%>
<%--            margin-right: 10px;--%>

<%--        }--%>
<%--        .providerView strong {--%>
<%--            display: inline-block;--%>
<%--            width: 200px;--%>
<%--            text-align: right;--%>
<%--        }--%>

<%--        .providerView span {--%>
<%--            color: #bd644e;--%>
<%--        }--%>

<%--        .providerView a {--%>
<%--            margin-left: 520px;--%>
<%--            position: relative;--%>
<%--            top: 60px;--%>
<%--        }--%>

<%--        /*供应商管理页面-->供应商添加页面*/--%>
<%--        .providerAdd {--%>
<%--            border: 1px solid #9ac70f;--%>
<%--            padding: 20px;--%>
<%--            margin: 20px;--%>
<%--        }--%>

<%--        .providerAdd form {--%>

<%--        }--%>

<%--        .providerAdd div {--%>
<%--            margin-top: 12px;--%>
<%--            margin-bottom: 12px;--%>
<%--        }--%>

<%--        .providerAdd label {--%>
<%--            width: 200px;--%>
<%--            display: inline-block;--%>
<%--            text-align: right;--%>
<%--        }--%>

<%--        .providerAdd input ,.providerAdd select{--%>
<%--            width: 260px;--%>
<%--            height: 30px;--%>
<%--            line-height: 30px;--%>
<%--            border-radius: 4px;--%>
<%--            outline: none;--%>
<%--            padding-left: 10px;--%>
<%--            border: 1px solid #4987c0;--%>
<%--            box-shadow: 1px 1px 1px #99afc4;--%>
<%--        }--%>

<%--        .providerAdd input:focus,.providerAdd select:focus {--%>
<%--            border: 1px solid #0e56a8;--%>
<%--            background: rgba(238, 236, 240, 0.2);--%>
<%--            -webkit-box-shadow: 0px 1px 4px 0px rgba(168, 168, 168, 0.9) inset;--%>
<%--            -moz-box-shadow: 0px 1px 4px 0px rgba(168, 168, 168, 0.9) inset;--%>
<%--            box-shadow: 0px 1px 4px 0px rgba(168, 168, 168, 0.9) inset;--%>
<%--        }--%>

<%--        .providerAdd span {--%>
<%--            margin-left: 20px;--%>
<%--            color: #faca0d;--%>
<%--        }--%>

<%--        /*验证错误*/--%>
<%--        .providerAdd .error span {--%>
<%--            color: red;--%>
<%--        }--%>

<%--        .providerAdd .error input {--%>
<%--            border: 1px solid red;--%>
<%--        }--%>

<%--        /*验证成功*/--%>
<%--        .providerAdd .ok span {--%>
<%--            color: green;--%>
<%--        }--%>

<%--        .providerAdd .ok input {--%>
<%--            border: 1px solid green;--%>
<%--        }--%>

<%--        .providerAddBtn {--%>
<%--            margin-left: 240px;--%>
<%--            padding-top: 20px;--%>
<%--        }--%>

<%--        .providerAddBtn a ,--%>
<%--        .providerAddBtn input[type='submit'],--%>
<%--        .providerAddBtn input[type='button'] {--%>
<%--            display: inline-block;--%>
<%--            width: 100px;--%>
<%--            height: 30px;--%>
<%--            line-height: 30px;--%>
<%--            text-align: center;--%>
<%--            border-radius: 4px;--%>
<%--            border: transparent;--%>
<%--            background: linear-gradient(to bottom, #85c0ec, #6aa7d6, #508dc6, #306fb4, #17559e);--%>
<%--            color: #fff;--%>
<%--            cursor: pointer;--%>
<%--            font-weight: bold;--%>
<%--            font-size: 14px;--%>
<%--            vertical-align: top;--%>
<%--        }--%>

<%--        .providerAddBtn a:active,--%>
<%--        .providerAddBtn a:focus,--%>
<%--        .providerAddBtn a:hover,--%>
<%--        .providerAddBtn input[type='submit']:hover,--%>
<%--        .providerAddBtn input[type='submit']:focus{--%>
<%--            background: linear-gradient(to bottom, #7aaed4, #578bb4, #406e99, #225792, #0d2d54);--%>
<%--        }--%>

<%--        .providerAdd input[type='radio']{--%>
<%--            width: 20px;--%>
<%--            height: 14px;--%>
<%--            line-height:12px;--%>
<%--            border-radius: 4px;--%>
<%--            outline: none;--%>
<%--            padding-left: 10px;--%>
<%--            border: none;--%>
<%--            box-shadow: none;--%>
<%--        }--%>

<%--        .removerChid h2{--%>
<%--            padding-left: 8px;--%>
<%--            font-size: 14px;--%>
<%--            line-height: 30px;--%>
<%--            margin: 4px 8px;--%>
<%--            border-bottom: 1px solid #99cc33;--%>
<%--        }--%>
<%--        .removeMain a{--%>
<%--            padding: 0 20px;--%>
<%--            display: inline-block;--%>
<%--            height: 30px;--%>
<%--            line-height: 30px;--%>
<%--            border-radius: 4px;--%>
<%--            border: 1px solid #5e8809;--%>
<%--            margin-top: 30px;--%>
<%--            background: #99cc33;--%>
<%--            color: #fff;--%>
<%--        }--%>
<%--        .removeMain a:hover,.removeMain a:active{--%>
<%--            background: #679016;--%>

<%--        }--%>
<%--        .page-num-ul li--%>
<%--        {--%>
<%--            float:left;--%>
<%--        }--%>
<%--        .page-num-ul li a--%>
<%--        {--%>
<%--            display:inline-block;--%>
<%--            padding:3px 5px;--%>
<%--            margin:0px 3px;--%>
<%--            border:1px solid #b8b8b8;--%>
<%--        }--%>
<%--        .page-num-ul a:hover,.page-num-ul .thisclass--%>
<%--        {--%>
<%--            border:1px solid #c5063f;--%>
<%--            background-color:#c5063f;--%>
<%--            color:#FFF;--%>
<%--            text-decoration:none;--%>
<%--        }--%>
<%--        .page-go-form input,label,button--%>
<%--        {--%>
<%--            margin:0px 5px;--%>
<%--        }--%>
<%--    </style>--%>

    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        var path = $("#path").val();
        var imgYes = "<img width='15px' src='"+path+"/images/y.png' />";
        var imgNo = "<img width='15px' src='"+path+"/images/n.png' />";
        /**
         * 提示信息显示
         * element:显示提示信息的元素（font）
         * css：提示样式
         * tipString:提示信息
         * status：true/false --验证是否通过
         */
        function validateTip(element,css,tipString,status){
            element.css(css);
            element.html(tipString);
            element.prev().attr("validateStatus",status);
        }
        var referer = $("#referer").val();
    </script>
    <style>
        .right {
            float: right;
            width: 70%; /* 调整右侧部分的宽度 */
        }
    </style>
    <script>
        var oldpassword = null;
        var newpassword = null;
        var rnewpassword = null;
        var saveBtn = null;

        $(function(){
            oldpassword = $("#oldpassword");
            newpassword = $("#newpassword");
            rnewpassword = $("#rnewpassword");
            saveBtn = $("#save");

            oldpassword.next().html("*");
            newpassword.next().html("*");
            rnewpassword.next().html("*");

            oldpassword.on("blur",function(){
                $.ajax({
                    type:"POST",
                    url: path + "/UserServlet",
                    data:{method:"pwdmodify",oldpassword:oldpassword.val()},//ajax传递参数
                    dataType:"json",
                    success:function(data){
                        if(data.result == "true"){//旧密码正确
                            validateTip(oldpassword.next(),{"color":"green"},imgYes,true);
                        }else if(data.result == "false"){//旧密码输入不正确
                            validateTip(oldpassword.next(),{"color":"red"},imgNo + " 原密码输入不正确",false);
                        }else if(data.result == "sessionerror"){//当前用户session过期，请重新登录
                            validateTip(oldpassword.next(),{"color":"red"},imgNo + " 当前用户session过期，请重新登录",false);
                        }else if(data.result == "error"){//旧密码输入为空
                            validateTip(oldpassword.next(),{"color":"red"},imgNo + " 请输入旧密码",false);
                        }
                    },
                    error:function(data){
                        //请求出错
                        validateTip(oldpassword.next(),{"color":"red"},imgNo + " 请求错误",false);
                    }
                });
            }).on("focus",function(){
                validateTip(oldpassword.next(),{"color":"#666666"},"* 请输入原密码",false);
            });

            newpassword.on("focus",function(){
                validateTip(newpassword.next(),{"color":"#666666"},"* 密码长度必须是大于6小于20",false);
            }).on("blur",function(){
                if(newpassword.val() != null && newpassword.val().length >= 6
                    && newpassword.val().length < 20 ){
                    validateTip(newpassword.next(),{"color":"green"},imgYes,true);
                }else{
                    validateTip(newpassword.next(),{"color":"red"},imgNo + " 密码输入不符合规范，请重新输入",false);
                }
            });


            rnewpassword.on("focus",function(){
                validateTip(rnewpassword.next(),{"color":"#666666"},"* 请输入与上面一致的密码",false);
            }).on("blur",function(){
                if(rnewpassword.val() != null && rnewpassword.val().length >= 6
                    && rnewpassword.val().length < 20 && newpassword.val() == rnewpassword.val()){
                    validateTip(rnewpassword.next(),{"color":"green"},imgYes,true);
                }else{
                    validateTip(rnewpassword.next(),{"color":"red"},imgNo + " 两次密码输入不一致，请重新输入",false);
                }
            });


            saveBtn.on("click",function(){
                oldpassword.blur();
                newpassword.blur();
                rnewpassword.blur();
                // oldpassword.attr("validateStatus") == "true"
                // &&
                if( oldpassword.attr("validateStatus") == "true"
                    &&newpassword.attr("validateStatus") == "true"
                    && rnewpassword.attr("validateStatus") == "true"){
                    if(confirm("确定要修改密码？")){
                        $("#userForm").submit();
                    }
                }
            });
        });
    </script>
</head>
<body>
<header class="publicHeader">
    <h1>修改个人信息</h1>
    <div class="publicHeaderR">
        <p><span>您好！</span><span style="color: #fff21b"></span> 欢迎你！</p>
        <a onclick="back()">返回</a>
    </div>
</header>
<section class="publicMian">
    <div class="left">
        <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
        <nav>
            <ul class="list">
                <li><a href="${pageContext.request.contextPath}/namemodify.jsp?method=query">昵称修改</a></li>
                <li><a href="${pageContext.request.contextPath}/pwdmodify.jsp">密码修改</a></li>
<%--                <li><a href="${pageContext.request.contextPath}/LogoutServlet">退出系统</a></li>--%>
            </ul>
        </nav>
    </div>
    <!-- 密码修改部分 -->
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>密码修改页面</span>
        </div>
        <div class="providerAdd">
            <form action="${pageContext.request.contextPath}/UserServlet" method="post" id="userForm" name="userForm">
                <input type="hidden" name="method" value="savepwd">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div class="info">${message}</div>
                <div>
                    <label for="oldPassword">旧密码：</label>
                    <input type="password" name="oldpassword" id="oldpassword" value="">
                    <font color="red"></font>
                </div>
                <div>
                    <label for="newPassword">新密码：</label>
                    <input type="password" name="newpassword" id="newpassword" value="">
                    <font color="red"></font>
                </div>
                <div>
                    <label for="rnewpassword">确认新密码：</label>
                    <input type="password" name="rnewpassword" id="rnewpassword" value="">
                    <font color="red"></font>
                </div>
                <div class="providerAddBtn">
                    <input type="submit" name="save" id="save" value="保存" class="input-button">
                </div>
            </form>
        </div>
    </div>
    <input type="hidden" id="path" name="path" value="${pageContext.request.contextPath}"/>
    <input type="hidden" id="referer" name="referer" value="<%=request.getHeader("Referer")%>"/>
</section>
<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>--%>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>--%>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/js/pwdmodify.js"></script>--%>
</body>
</html>
