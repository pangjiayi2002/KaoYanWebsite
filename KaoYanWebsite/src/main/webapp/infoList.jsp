<%@ page import="service.user.UserServiceImpl" %>
<%@ page import="service.user.UserService" %>
<%@ page import="util.Constants" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>消息列表</title>
    <link rel="stylesheet" type="text/css" href="css/customer.css">
</head>
<body>
<%
    UserService userService=new UserServiceImpl();
//    Object o = request.getSession().getAttribute(Constants.USER_SESSION);
    HttpSession session1=request.getSession();
    String username= session1.getAttribute("username").toString();
    String RestaurantName= userService.getRestaurantName(username);
    session1.setAttribute("RestaurantName",RestaurantName);
    List<RestaurantInfo> infos = resAdminSer.getRestaurant(RestaurantName);
%>
<section class="publicMian">
    <div class="left">
        <h2 class="leftH2"><span class="span1"></span>消息列表 <span></span></h2>
    </div>
    <table class="table table-striped">
        <div class="container">
            <div class="button-container">
                <button type="button" class="btn" onclick="location.href=''">我的信息</button>
            </div>
        </div>
        <c:forEach var="evaluate" items="<%=evaluates%>">
            <tr>
                <td>${evaluate.title}</td>
                <td>${evaluate.sender}</td>
                <td>${evaluate.restaurant}</td>
                <td>${evaluate.food}</td>
                <td>
                    <span><a class="view" href="evaluateDetail.jsp?id=${evaluate.id}">查看详情</a></span>
                        <%--                    <span><a class="modify" href="restaurantModify.jsp?id=${evaluate.id}" ><img src="${pageContext.request.contextPath }/images/xiugai.png" alt="修改" title="修改"/></a></span>--%>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</section>
</body>
</html>
