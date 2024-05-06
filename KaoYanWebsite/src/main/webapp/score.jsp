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
<form action="" method="post">
    <!-- 学校选择 -->
    <label for="school">学校:</label>
    <select name="school" id="school">
        <!-- 循环输出学校选项 -->
        <c:forEach var="school" items="<%=schools%>">
            <option value="${school.school_id}">${school.getSchool_name()}</option>
        </c:forEach>
    </select>
    <!-- 年份选择 -->
    <label for="year">年份:</label>
    <select name="year" id="year">
        <!-- 年份选项 -->
        <option value="2022">2022</option>
        <option value="2023">2023</option>
        <option value="2024">2024</option>
    </select>

    <!-- 提交按钮 -->
    <button type="submit">提交</button>
    <h1>分数线</h1>
</form>
</body>
</html>
