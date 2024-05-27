<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>考研小站首页</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
<%--    <style>--%>
<%--        .right {--%>
<%--            float: right;--%>
<%--            width: 70%; /* 调整右侧部分的宽度 */--%>
<%--        }--%>
<%--    </style>--%>
</head>
<body>
<!-- 头部 -->
<header class="publicHeader">
    <h1>考研小站</h1>
    <div class="publicHeaderR">
        <p><span>下午好！</span><span style="color: #fff21b">${userSession.username}</span> , 欢迎你！</p>
        <a onclick="back()">返回</a>
    </div>
</header>
