<%@ page import="service.user.UserServiceImpl" %>
<%@ page import="service.user.UserService" %>
<%@ page import="util.Constants" %>
<%@ page import="pojo.User" %>
<%@ page import="pojo.Comment" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>消息列表</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .publicMain {
            width: 80%;
            margin: 20px auto;
        }
        .leftH2 {
            margin-bottom: 20px;
            border-bottom: 2px solid #333;
            padding-bottom: 5px;
            position: relative;
        }
        .leftH2 span {
            font-size: 18px;
            color: #333;
        }
        .leftH2 .span1 {
            position: absolute;
            width: 10px;
            height: 10px;
            background-color: #333;
            border-radius: 50%;
            left: -20px;
            top: 50%;
            transform: translateY(-50%);
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        table td span {
            font-size: 16px;
            color: #333;
        }
    </style>
</head>
<body>
<%
    UserService userService=new UserServiceImpl();
    Object o = request.getSession().getAttribute(Constants.USER_SESSION);
    String username=((User)o).getUsername();
    List<Comment> infos = userService.getNotReadComment(username);
%>
<section class="publicMain">
    <div class="left">
        <h2 class="leftH2"><span class="span1"></span>消息列表 <span></span></h2>
        <input type="button" class="back_btn" style="float: right" value="返回" onclick="">
    </div>
    <div class="container">
        <div class="button-container">
            <table class="table table-striped">
                <c:forEach var="comment" items="<%=infos%>">
                    <tr>
                        <td><span href="commentDetail.jsp?id=${comment.postId}>${comment.sender}回复了你：${comment.content}</span></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</section>
</body>
</html>
