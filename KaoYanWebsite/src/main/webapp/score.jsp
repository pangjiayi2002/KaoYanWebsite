<%@ page import="service.user.UserService" %>
<%@ page import="service.user.UserServiceImpl" %>
<%@ page import="pojo.School" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>分数线</title>
</head>
<body>
<%
    // 创建 UserService 实例
    UserService userService=new UserServiceImpl();
    // 获取学校列表
    List<School> schools = userService.getSchool();
%>
<div class="schoolList">
    <ul>
        <li>院校:</li>
        <c:forEach var="school" items="${schoolList}">
            <li></li>
        </c:forEach>
    </ul>
    <ul>
        <li>年份:</li>
        <li value="2022">2022</li>
        <li value="2023">2023</li>
        <li value="2024">2024</li>
    </ul>
    <ul>
        <li>
            <span>类型</span>
            <span>专业代码</span>
            <span>专业名称</span>
            <span>总分</span>
            <span>政治</span>
            <span>英语</span>
            <span>专业课一</span>
            <span>专业课二</span>
        </li>

    </ul>
</div>
</body>
</html>
