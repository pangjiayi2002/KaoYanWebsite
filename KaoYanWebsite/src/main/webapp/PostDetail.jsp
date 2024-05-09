<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2024/4/22
  Time: 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>帖子详情</title>
    <style>
        .replyBtn_container{
            width: 100%;
            border-top: 2px solid lightsteelblue;
            border-bottom: 2px solid lightsteelblue;
            padding: 10px;
            float: left;
        }
    </style>
    <link type="text/css" rel="stylesheet" href="css/community.css">
    <script type="text/javascript" src="JS/community.js"></script>
    <script>
        // function toggleReplyForm(commentId){
        //     var replyForm=document.getElementById("replyForm_"+commentId);
        //     if(replyForm.style.display=="none"){
        //         replyForm.style.display="block";
        //     }
        //     else{
        //         replyForm.style.display="none";
        //     }
        // }
        // function closeReplyForm(commentId){
        //     var replyForm=document.getElementById("replyForm_"+commentId);
        //     replyForm.style.display="none";
        // }
        function showReplyDialog(commentId){
            var reply_popup=document.getElementById("reply_popup_"+commentId);
            var reply_overlay=document.getElementById("reply_overlay_"+commentId);
            // var usernameElement=document.getElementById("username")
            // usernameElement.textContent="@"+username;
            if(reply_popup.style.display=="none"){
                reply_popup.style.display="block";}
            else {
                reply_popup.style.display="none";
            }
            if(reply_overlay.style.display=="none"){
                reply_overlay.style.display="block";}
            else{
                reply_overlay.style.display="none";
            }
        }
        function closeReplyDialog(commentId){
            var reply_popup=document.getElementById("reply_popup_"+commentId);
            var reply_overlay=document.getElementById("reply_overlay_"+commentId);
            reply_popup.style.display="none";
            reply_overlay.style.display="none";
        }
        function back(){
            history.back();
        }

    </script>
</head>
<body>
<input type="button" class="back_btn" style="float: right" value="返回" onclick="back()">
    <table>
        <tr>
            <td>
                <%--    用户信息--%>
                <div id="user_container" style="display: flex;align-items: center;flex-direction: column">
                    <%--        <img src="${sessionScope.user.avatar}">--%>
                    <%--        <h4>${sessionScope.user.username}</h4>--%>
                    <img src=".\pic\dog.jpg" height="40px" width="40px" style="float: left">
                    <h2>${sessionScope.postDetail.username}</h2>
                </div>
            </td>
            <td>
<%--                标题--%>
<%--                <h1>title</h1>--%>
                <h1>${sessionScope.postDetail.title}</h1>
            </td>
        </tr>
        <tr>
            <td></td>
<%--            帖子内容--%>
            <td>
                            <h3>${sessionScope.postDetail.content}</h3>
<%--                <h3>content</h3>--%>
            </td>
        </tr>
    </table>
<%--    评论--%>
<%--            评论按钮--%>
    <div class="replyBtn_container">
        <button id="commentBtn" class="commentBtn" onclick="showDialog()" style="width: 50px;height: 30px">评论</button>
        <div id="overlay" class="overlay" ></div>
        <div id="popup" class="popup" >
            <label>评论</label>
            <div style="flex-direction: row">
<%--                <h4>@${sessionScope.user.usrname}</h4>--%>
                <form action="addCommentServlet" method="post" style="margin-left: 10px">
                    <h4>@${sessionScope.postDetail.username}</h4>
                    <textarea name="commentContent" cols="60" rows="10" style="margin: 10px" placeholder="请输入评论内容"></textarea>
                    <div class="comment_buttons" style="display:flex;justify-content: center">
                        <input type="button" class="comment_close_btn" style="width: 100px;height: 30px" value="关闭" onclick="closeDialog()"></input>
                        <button type="submit" style="width: 100px;height: 30px">评论</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
<%----所有评论----%>
    <div id="comments" class="comments" style="margin-left: 10px">
            <h4 style="color: darkgray">${sessionScope.NoCommentMsg}</h4>
        <table>
            <c:forEach var="comment" items="${sessionScope.commentList}">
                <tr>
                    <td>
                        <img src=".\pic\dog.jpg" height="20px" width="20px" style="float: left;vertical-align: top;margin: 5px">
                    </td>
                    <td>
                        <h3 style="margin: 5px">${comment.sender}@${comment.receiver}:${comment.content}</h3>
                    </td>
                    <td>
<%--                        <button id="replyBtn_${comment.commentId}" class="replyBtn" onclick="toggleReplyForm(${comment.commentId})">回复</button>--%>
<%--                        <div id="replyForm_${comment.commentId}" class="replyForm" style="display: none">--%>
<%--                            <label>回复@${comment.sender}</label>--%>
<%--                            <textarea id="replyContent_${comment.commentId}" cols="60" rows="5" style="margin: 10px" placeholder="请输入回复内容"></textarea>--%>
<%--                            <div class="replyButtons" style="display: flex;justify-content: center">--%>
<%--                                <button class="closeReplyBtn" style="width: 100px;height: 30px" onclick="closeReplyForm(${comment.commentId})">关闭</button>--%>
<%--                                <button class="sendReplyBtn" type="submit" style="width: 100px;height: 30px">回复</button>--%>
<%--                            </div>--%>
<%--                        </div>--%>
                        <button id="reply_${comment.commentId}" class="reply" onclick="showReplyDialog(${comment.commentId})">回复</button>
                        <div id="reply_overlay_${comment.commentId}" class="overlay"></div>
                        <div id="reply_popup_${comment.commentId}" class="popup">
                            <label>回复:</label>
                            <h4>@${comment.sender}</h4>
                            <form action="replyServlet" method="post">
                                <textarea name="replyContent" cols="60" rows="10" style="margin: 10px" placeholder="请输入回复内容"></textarea>
                                <div class="reply_buttons" style="display: flex;justify-content: center">
                                    <button class="reply_close_btn" style="width: 100px;height: 30px" onclick="closeReplyDialog(${comment.commentId})">关闭</button>
                                    <input type="hidden" name="username" value="${comment.sender}">
                                    <input type="hidden" name="commentId" value="${comment.commentId}">
                                    <input type="hidden" name="postId" value="${comment.postId}">
                                    <button type="submit" style="width: 100px;height: 30px">回复</button>
                                </div>
                            </form>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </table>


        <%--        <c:forEach var="comment" items="comment_list">--%>
<%--            <button id="reply" class="reply" onclick="showDialog()">回复</button>--%>
<%--            <div id="overlay" class="overlay"></div>--%>
<%--            <div id="popup" class="popup">--%>
<%--                <label>回复:</label>--%>
<%--                <h4>@user1</h4>--%>
<%--                <textarea cols="60" rows="10" style="margin: 10px" placeholder="请输入回复内容"></textarea>--%>
<%--                <div class="reply_buttons" style="display: flex;justify-content: center">--%>
<%--                    <button class="reply_close_btn" style="width: 100px;height: 30px" onclick="closeDialog()">关闭</button>--%>
<%--                    <form>--%>
<%--                        <button type="submit" style="width: 100px;height: 30px">评论</button>--%>
<%--                    </form>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </c:forEach>--%>
    </div>
</body>
</html>