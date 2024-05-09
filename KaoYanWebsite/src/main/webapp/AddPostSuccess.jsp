<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2024/4/22
  Time: 10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>贴子发布成功</title>
</head>
<body>
<div style="display: flex;justify-content: center;align-items: center;height: 100vh;flex-direction: column">
    <img src=".\pic\success.jpg" height="35%" width="20%">
    <h4 style="font-size: larger">帖子发布成功</h4>
    <h5>${sessionScope.newpost.id}</h5>
    <h5>${sessionScope.newpost.schoolId}</h5>
    <a href="PostDetailServlet?id=${sessionScope.newpost.id}&title=${sessionScope.newpost.title}&content=${sessionScopepost.newpost.content}">点击查看帖子详情</a>
</div>
</body>
</html>
