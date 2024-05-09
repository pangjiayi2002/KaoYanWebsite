<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2024/3/27
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>交流社区</title>
    <link type="text/css" rel="stylesheet" href="css/community.css"/>
    <script type="text/javascript" src="JS/community.js"></script>
</head>
<body>
<div class="container">
    <div id="top">
        <h1 style="color: #78b3ef;float: left;font-size: 50px">欢迎来到{}交流社区</h1>
        <input type="button" class="back_btn" style="float: right" value="返回" onclick="">
    </div>
    <div id="middle">
        <button id="openbtn" class="openbtn" onclick="showDialog()" style="margin: 20px">发布帖子+</button>
        <div id="overlay" class="overlay"></div>
        <div id="popup" class="popup">
            <form action="postServlet" method="post" style="margin-left: 10px;">
                <label>标题:</label>
                <input type="text" placeholder="请输入标题" id="title" class="title" name="title">
                <br>
                <label>内容</label>
                <textarea id="content" class="content"cols="60" rows="10" style="margin: 10px" placeholder="请输入内容" name="content"></textarea>
                <div class="buttons" style="display: flex; justify-content: center;">
                    <input type="button" class="close_btn" value="关闭"style="width: 100px;height: 30px;color: #0069d9" onclick="closeDialog()" >
                    <button type="submit" style="width: 100px;height: 30px">提交</button>
                </div>
            </form>

        </div>
        <table class="altrowstable" id="alternatecolor">
            <c:forEach var="post" items="${sessionScope.postList}">
                <tr>
                    <td>
                        <div style="width: 100px;display: flex;flex-direction: column;">
                            <img src=".\pic\dog.jpg" height="20px" width="20px" style="float: left;vertical-align: top">
                            <h4>user1</h4>
                        </div>
                    </td>
                    <td>
                        <div>
                            <a href="PostDetailServlet?id=${post.id}">${post.title}</a>
                            <h2>${post.content}</h2>
                        </div>
                    </td>
                    <td>
                        <div class="comment-box" style="width: 60px">
                            <p>评论数:${post.commentAmount}</p>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>

</body>
</html>
