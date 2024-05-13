<%@ page import="pojo.School" %>
<%@ page import="service.user.UserServiceImpl" %>
<%@ page import="service.user.UserService" %>
<%@ page import="java.util.List" %>
<%@ page import="pojo.Score" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--<html>--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>分数线</title>--%>
<%--</head>--%>
<%--<body>--%>
<%@include file="/schoolhead.jsp"%>
<%
    UserService userService=new UserServiceImpl();
    List<School> schoolList = userService.getSchool();
    request.setAttribute("schoolList", schoolList);
%>
<div class="right">
    <div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>院校分数线</span>
    </div>
    <div class="search">
        <form method="post" action="${pageContext.request.contextPath}/UserServlet">
            <input name="method" value="query" class="input-text" type="hidden">
            <span>院校：</span>
            <select name="schoolName">
                <c:if test="${schoolList != null }">
                    <option value="0">--请选择--</option>
                    <c:forEach var="school" items="${schoolList}">
                        <option <c:if test="${school.school_name == schoolName }">selected="selected"</c:if>
                                value="${school.school_name}">${school.school_name}</option>
                    </c:forEach>
                </c:if>
            </select>
            <span>年份：</span>
            <select name="year">
                <c:forEach var="year" begin="2022" end="2024">
                    <c:choose>
                        <c:when test="${year eq param.year}">
                            <option value="${year}" selected>${year}</option>
                        </c:when>
                        <c:otherwise>
                            <option value="${year}">${year}</option>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </select>

<%--            <span>年份：</span>--%>
<%--            <select name="year">--%>
<%--                <option value="2024" selected>2024</option>--%>
<%--                <option value="2023">2023</option>--%>
<%--                <option value="2022">2022</option>--%>
<%--            </select>--%>
            <input	value="查 询" type="submit" id="searchbutton">
        </form>
    </div>
    <%
        List<Score> scoreList= (List<Score>) request.getAttribute("scoreList");
        String schoolName= (String) request.getAttribute("schoolName");
    %>
    <table class="providerTable" cellpadding="0" cellspacing="0">
        <tr class="firstTr">
            <th>学校</th>
            <th>类型</th>
            <th>专业代码</th>
            <th>专业名称</th>
            <th>总分</th>
            <th>政治</th>
            <th>英语</th>
            <th>专业课一</th>
            <th>专业课二</th>
        </tr>
        <c:forEach var="score" items="<%=scoreList%>" varStatus="status">
            <tr>
                <td>
                    <span>${schoolName}</span>
                </td>
                <td>
                    <span>${score.master_Type}</span>
                </td>
                <td>
                    <span>${score.major_Code}</span>
                </td>
                <td>
                    <span>${score.major_Name}</span>
                </td>
                <td>
                    <span>${score.total_Score}</span>
                </td>
                <td>
                    <span>${score.politics}</span>
                </td>
                <td>
                    <span>${score.english}</span>
                </td>
                <td>
                    <span>${score.major_Course_One}</span>
                </td>
                <td>
                    <span>${score.major_Course_Two}</span>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<%--</body>--%>
<%--</html>--%>