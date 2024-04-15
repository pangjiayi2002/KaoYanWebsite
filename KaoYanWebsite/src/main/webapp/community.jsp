<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2024/3/27
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>交流社区</title>
    <link type="text/css" rel="stylesheet" href="css/community.css"/>
    <script type="text/javascript" src="community.js"></script>
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
                <label>标题:</label>
                <input type="text" placeholder="请输入标题" id="title" class="title">
                <br>
                <label>内容</label>
                <textarea id="content" class="content"cols="60" rows="10" style="margin: 10px" placeholder="请输入内容"></textarea>
                <div class="buttons" style="display: flex; justify-content: center;">
                    <button class="close_btn" style="width: 100px;height: 30px" onclick="closeDialog()">关闭</button>
                    <form action="postServlet" method="post" style="margin-left: 10px;">
                    <button type="submit" style="width: 100px;height: 30px">提交</button>
                    </form>
                </div>

        </div>
        <table class="altrowstable" id="alternatecolor">
            <tr>
                <td>
                    <div style="width: 100px;display: flex;flex-direction: column;">
                        <img src=".\pic\dog.jpg" height="20px" width="20px" style="float: left;vertical-align: top">
                        <h4>user1</h4>
                    </div>
                </td>
                <td>
                    <div>
                        <h1>title</h1>
                        <h2>content</h2>
                    </div>
                </td>
                <td>
                    <input type="button" class="reply_btn" id="reply_btn" onclick="showReplyDialog()" value="回复"/>
                    <div id="reply_overlay" class="reply_overlay"></div>
                    <div id="reply_popup" class="reply_popup" style="display: none">
                        <form action="">
                            <label>回复内容</label>
                            <textarea cols="60" rows="10" style="margin: 10px" placeholder="请输入内容"></textarea>
                            <div class="buttons">
                                <button class="close_btn" onclick="closeReplyDialog()">关闭</button>
                                <button type="submit">发送</button>
                            </div>
                        </form>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div style="width: 100px;display: flex;flex-direction: column">
                        <img src=".\pic\dog.jpg" height="20px" width="20px" style="float: left;vertical-align: top">
                        <h4>usr2</h4>
                    </div>
                </td>
                <td>
                    <div>
                        <h1>title</h1>
                        <h2>contentghhhhhhhhh</h2>
                    </div>
                </td>
                <td>
                    <input type="button" class="reply_btn" value="回复"/>
                </td>
            </tr>
        </table>
    </div>
</div>

</body>
</html>
