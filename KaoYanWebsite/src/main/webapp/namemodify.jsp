<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>考研小站</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <style>
        .right {
            float: right;
            width: 70%; /* 调整右侧部分的宽度 */
        }

    </style>
</head>
<body>
<!-- 头部 -->
<header class="publicHeader">
    <h1>修改个人信息</h1>
    <div class="publicHeaderR">
        <p><span>下午好！</span><span style="color: #fff21b">${userSession.userName}</span> , 欢迎你！</p>
        <a href="${pageContext.request.contextPath}/LogoutServlet">退出</a>
    </div>
</header>
<!-- 主体内容 -->
<section class="publicMian">
    <div class="left">
        <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
        <nav>
            <ul class="list">
                <li><a href="${pageContext.request.contextPath}/namemodify.jsp?method=query">昵称修改</a></li>
                <li><a href="${pageContext.request.contextPath}/pwdmodify.jsp">密码修改</a></li>
                <li><a href="${pageContext.request.contextPath}/LogoutServlet">退出系统</a></li>
            </ul>
        </nav>
    </div>
    <!-- 密码修改部分 -->
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>昵称修改页面</span>
        </div>
        <div class="providerAdd">
            <form action="/smbms/UserServlet" method="post" id="userForm" name="userForm">
                <div>
                    <label for="newname">新昵称：</label>
                    <input type="text" name="newname" id="newname" value="">
                    <font color="red"></font>
                </div>
                <div class="providerAddBtn">
                    <input type="submit" name="save" id="save" value="保存" class="input-button">
                </div>
            </form>
        </div>
    </div>
</section>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/pwdmodify.js"></script>
</body>
</html>
