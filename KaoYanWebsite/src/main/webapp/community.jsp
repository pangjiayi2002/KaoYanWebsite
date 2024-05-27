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
    <script type="text/javascript" src="js/community.js"></script>
    <script>
        //删除帖子
        function confirmDelete(postId) {
            var confirmed = confirm("确定要删除这篇帖子吗？");
            if (confirmed) {
                deleteComment(postId);
            }
        }

        function deleteComment(postId) {
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "deletePost", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    location.reload(); // 删除成功后刷新页面
                } else if (xhr.readyState === 4) {
                    alert("删除失败！");
                }
            };
            xhr.send("postId=" + postId);
        }

        document.addEventListener("DOMContentLoaded", function() {
            var rows = document.querySelectorAll(".post-row");
            rows.forEach(function(row) {
                row.addEventListener("click", function() {
                    var postId = row.getAttribute("data-post-id");
                    confirmDelete(postId);
                });
            });
        });
    </script>
</head>
<body>
<div class="container">
    <div id="top">
        <h1 style="color: #78b3ef;float: left;font-size: 50px">欢迎来到
            <span style="font-family: 'Courier New';color: #5994d6">${sessionScope.schoolName}</span>
            交流社区
        </h1>
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
        <table class="altrowstable" id="alternatecolor" style="width: 90%">
            <%
                int i=0;
            %>
            <c:forEach var="post" items="${sessionScope.postList}">
                <tr>
                    <td style="width: 20%">
                        <div style="width: 100px;display: flex;flex-direction: column;">
                            <%@page import="java.util.Base64" %>
                            <%@ page import="pojo.Post" %>
                            <%@ page import="java.util.ArrayList" %>
                            <%@ page import="service.user.UserService" %>
                            <%@ page import="util.ImageUtil" %>
                            <%@ page import="service.user.UserServiceImpl" %>
                            <%
                                ArrayList<Post> postList= (ArrayList<Post>) session.getAttribute("postList");
                                Post post=postList.get(i);
                                byte[] avatar= post.getAvatar();
                                String base64Image=ImageUtil.byteToBase64(avatar);
                                i=i+1;
                                boolean avatarIsNull=(avatar!=null);
                            %>

                            <c:choose>
                                <c:when test="<%=avatarIsNull%>">
                                    <img  class="to" alt="图片加载失败" src="data:image/jpeg;base64,<%=base64Image%>" height="40px" width="40px">
                                </c:when>
                                <c:otherwise>
                                    <img src=".\pic\dog.jpg" height="20px" width="20px" style="float: left;vertical-align: top" alt="加载图片失败">
                                </c:otherwise>
                            </c:choose>
<%--                            <img  class="to" alt="图片加载失败" src="data:image/jpeg;base64,<%=base64Image%>" height="40px" width="40px">--%>

                            <h4>${post.username}</h4>
                        </div>
                    </td>
                    <td style="width: 60%">
                        <div>
                            <a href="PostDetailServlet?id=${post.id}">${post.title}</a>
                            <h2 class="post-row" data-post-id="${post.id}">${post.content}</h2>
                        </div>
                    </td>
                    <td style="width: 20%">
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
