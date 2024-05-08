<%@ page import="util.ImageUtil" %>
<%@ page import="service.user.UserServiceImpl" %>
<%@ page import="service.user.UserService" %>
<%@ page import="util.Constants" %>
<%@ page import="pojo.User" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人中心</title>
    <link rel="stylesheet" type="text/css" href="css/customer.css">
</head>
<body>
<div class="container">
    <div class="forms-grid">
        <div class="login">
            <form id="uploadForm" action="${pageContext.request.contextPath}/ChangeImageServlet" method="post" enctype="multipart/form-data">
                <div style="width:200px">
                    <div class="to3">
                        <div class="to2">
                            <div class="to1">
                                <%
                                    UserService userService=new UserServiceImpl();
                                    byte[] avatar = userService.getPersonalAvatar(1);
                                    String base64Image = ImageUtil.byteToBase64(avatar);
                                %>
                                <img id="img" class="to" alt="图片加载失败" src="data:image/jpeg;base64,<%=base64Image%>">
                            </div>
                            <div class="form-row button-login">
                                <button type="button" class="btn" style="float: left" onclick="openModal()">更换头像</button>
                                <!-- 模态框 -->
                                <div id="myModal" class="modal">
                                    <!-- 弹窗内容 -->
                                    <div class="modal-content">
                                        <span class="close" onclick="closeModal()">&times;</span>
                                        <h2>上传新头像</h2>
                                        <input type="file" name="imageFile" id="imageFile" accept="image/*">
                                        <button type="submit" class="btn">上传图像</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form">
                        <div class="form-row">
                            <%
                                Object o = request.getSession().getAttribute(Constants.USER_SESSION);
                            %>
                            <label id="id" class="form-label">ID&nbsp;&nbsp;&nbsp;：</label><%=((User) o).getId()%>
                        </div>
                        <br>
                        <div class="form-row">
                            <label id="username" class="form-label">昵&nbsp;&nbsp;&nbsp;称：</label><%=((User) o).getUsername()%>
                        </div>
                        <br>
                    </div>
                </div>
            </form>
        </div>
    </div>
<%--    <%--%>
<%--        restaurantAdminService resAdminSer=new restaurantAdminServiceImpl();--%>
<%--        String restaurantName= (String) session.getAttribute("restaurantName");--%>
<%--        int count=resAdminSer.notRead(restaurantName);--%>
<%--    %>--%>
    <div class="container">
        <div class="button-container">
            <button type="button" class="btn" onclick="location.href=''">我的信息</button>
<%--            <span style="position: absolute; color: red;"><%=count%></span>--%>
        </div>
    </div>
    <div class="container">
        <div class="button-container">
            <button type="button" class="btn" onclick="location.href='namemodify.jsp'">修改个人信息</button>
        </div>
    </div>
</div>

<script>
    // 获取模态框
    var modal = document.getElementById("myModal");

    // 获取打开弹窗的按钮
    var btn = document.getElementsByClassName("btn")[0];

    // 获取关闭按钮
    var span = document.getElementsByClassName("close")[0];

    // 当用户点击按钮时，打开弹窗
    function openModal() {
        modal.style.display = "block";
    }

    // 当用户点击关闭按钮时，关闭弹窗
    function closeModal() {
        modal.style.display = "none";
    }

    // 当用户点击模态框外部时，关闭弹窗
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>

</body>
</html>

