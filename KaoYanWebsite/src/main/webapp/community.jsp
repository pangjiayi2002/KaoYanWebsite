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
<%--    <link type="text/css" rel="stylesheet" href="css/community.css"/>--%>
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

        function altRows(id){
            if(document.getElementsByTagName){
                var table=document.getElementById(id);
                var rows=table.getElementsByTagName("tr");

                for(i=0;i<rows.length;i++){
                    if(i%2==0){
                        rows[i].className="evenrowcolor"
                    }else{
                        rows[i].className="oddrowcolor";
                    }
                }
            }
        }
        window.onload=function (){
            altRows('alternatecolor')
        }
        // const openbtn=document.getElementById('openbtn');
        // const closebtn=document.getElementById('close_btn');
        //const popup=document.getElementsByClassName('popup');
        //const overlay=document.getElementsByClassName('overlay');
        // openbtn.addEventListener('click',function (){
        //     popup.style.display='block';
        //     overlay.style.display='block';
        // })
        // /*弹出对话框*/
        // function showDialog(){
        //     var dialog=document.getElementById("dialog");
        //     dialog.style.display="block";
        // }
        // /*关闭对话框*/
        // function closeDialog(){
        //     var dialog=document.getElementById("dialog");
        //     dialog.style.display="none";
        // }
        function showDialog(){
            var popup=document.getElementById("popup");
            var overlay=document.getElementById("overlay")
            popup.style.display="block";
            overlay.style.display="block";
        }
        function closeDialog(){
            var popup=document.getElementById("popup");
            var overlay=document.getElementById("overlay")
            popup.style.display="none";
            overlay.style.display="none";
        }
        // const reply_popup=document.getElementsByClassName("reply_popup");
        // const reply_overlay=document.getElementsByClassName("reply_overlay")
        function showReplyDialog(commentId){
            var reply_popup=document.getElementById("reply_popup_"+commentId.toString());
            var reply_overlay=document.getElementById("reply_overlay_"+commentId.toString())
            // var usernameElement=document.getElementById("username")
            // usernameElement.textContent="@"+username;
            reply_popup.style.display="block";
            reply_overlay.style.display="block";
        }
        function closeReplyDialog(commentId){
            var reply_popup=document.getElementById("reply_popup_"+commentId.toString());
            var reply_overlay=document.getElementById("reply_overlay_"+commentId.toString());
            reply_popup.style.display="none";
            reply_overlay.style.display="none";
        }
        // var reply_btn=document.getElementById("reply");
        // reply_btn.onclick=function (){
        //     showReplyDialog(username);
        // }
        function toggleReplyForm(commentId){
            var replyForm=document.getElementById("replyForm_"+commentId);
            if(replyForm.style.display=="none"){
                replyForm.style.display="block";
            }
            else{
                replyForm.style.display="none";
            }
        }
        function closeReplyForm(commentId){
            var replyForm=document.getElementById("replyForm_"+commentId);
            replyForm.style.display="none";
        }
    </script>
    <style>
        /*返回按钮*/
        input.back_btn{
            padding: 10px 20px;
            font-size: 16px;
            background-color: #C0C0C0;
            color: white;
            border: none;
            border-radius: 20px;
            margin-left: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease;float: right
        }

        table.altrowstable {
            font-family: verdana,arial,sans-serif;
            font-size:11px;
            color:#333333;
            border-width: 1px;
            border-color: #62b9db;
            border-collapse: collapse;
        }
        table.altrowstable th {
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            /*border-color: #a9c6c9;*/
        }
        table.altrowstable td {
            border-width: 0px;
            padding: 8px;
            border-style: solid;
            /*border-color: #89e2ee;*/
        }
        .oddrowcolor{
            background-color: #e6fafa;
        }
        .evenrowcolor{
            background-color: #c5d8e0;
        }
        .container{
            display: flex;
            flex-direction: column;
        }
        /*发帖的遮罩和弹窗*/
        /* 遮罩层样式 */
        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5);
            display: none; /* 默认隐藏 */
        }
        /*弹窗样式*/
        .popup {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 5px;
            display: none; /* 默认隐藏 */
        }
        /*回复的遮罩和弹窗*/
        /*遮罩样式*/
        .reply_overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5);
            display: none; /* 默认隐藏 */
        }
        /*弹窗样式*/
        .reply_popup {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 5px;
            display: none; /* 默认隐藏 */
        }
        label {
            width: 100px;
            margin-bottom: 10px;
        }

        input[type="text"], select {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            color: #555;
            margin-bottom: 10px;
        }
        button{
            padding: 5px 10px;
            border-radius: 3px;
            border: none;
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
        }
        button:hover {
            background-color: #0069d9;
        }
        .buttons{
            text-align: center;
            margin-top: 20px;
        }
        input.reply_btn{
            font-size: 10px;
            background-color: #C0C0C0;
            padding: 5px 10px;
            border-radius: 3px;
            border: none;
            cursor: pointer;
            outline: none;
        }
        /*显示评论数的框*/
        .comment-box{
            background-color: #f2f2f2;
            /*padding: 10px;*/
            /*border-radius: 5px;*/
            width: 20px;
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
        }
    </style>
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
