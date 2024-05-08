<%@ page import="service.user.UserService" %>
<%@ page import="service.user.UserServiceImpl" %>
<%@ page import="pojo.School" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>分数线</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
        }

        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            display: flex; /* 使用 Flexbox 布局 */
        }

        .schoolList {
            flex-grow: 1; /* 让左侧部分占据可用空间的大部分 */
        }

        .schoolList ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .schoolList ul li {
            margin-bottom: 10px;
        }

        .scoreTableWrapper {
            flex-grow: 1; /* 让右侧部分占据可用空间的大部分 */
            margin-left: 20px; /* 为了与左侧部分产生一些间隙 */
        }

        .scoreTable {
            width: 100%;
            border-collapse: collapse;
        }

        .scoreTable th,
        .scoreTable td {
            padding: 8px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .scoreTable th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<%
    // 创建 UserService 实例
    UserService userService=new UserServiceImpl();
    // 获取学校列表
    List<School> schools = userService.getSchool();
%>
<div class="container">
    <div class="schoolList">
        <ul class="school">
            <li>院校:</li>
            <c:forEach var="school" items="<%=schools%>">
                <li>${school.school_name}</li>
            </c:forEach>
        </ul>
        <ul class="year">
            <li>年份:</li>
            <li value="2022">2022</li>
            <li value="2023">2023</li>
            <li value="2024">2024</li>
        </ul>
    </div>
    <div class="scoreTableWrapper">
        <table class="scoreTable">
            <thead>
            <tr>
                <th>类型</th>
                <th>专业代码</th>
                <th>专业名称</th>
                <th>总分</th>
                <th>政治</th>
                <th>英语</th>
                <th>专业课一</th>
                <th>专业课二</th>
            </tr>
            </thead>
            <tbody>
            <!-- Populate with data -->
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
