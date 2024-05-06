<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="head.jsp" %>
<!-- 主体内容 -->
<section class="publicMian">
    <div class="left">
        <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
        <nav>
            <ul class="list">
                <li><a href="${pageContext.request.contextPath}/namemodify.jsp?method=query">昵称修改</a></li>
                <li><a href="${pageContext.request.contextPath}/pwdmodify.jsp">密码修改</a></li>
                <li><a href="${pageContext.request.contextPath}/LogoutServlet">退出系统</a></li>
            </ul>
        </nav>
    </div>
    <!-- 密码修改部分 -->
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>昵称修改页面</span>
        </div>
        <div class="providerAdd">
            <form action="${pageContext.request.contextPath}/NameChangeServlet" method="post" id="userForm" name="userForm">
                <div class="info">${message}</div>
                <div>
                    <label for="newname">新昵称：</label>
                    <input type="text" name="newname" id="newname" value="">
                    <font color="red"></font>
                </div>
                <div class="providerAddBtn">
                    <input type="submit" name="save" id="save" value="保存" class="input-button">
                </div>
            </form>
        </div>
    </div>
    <input type="hidden" id="path" name="path" value="${pageContext.request.contextPath }"/>
    <input type="hidden" id="referer" name="referer" value="<%=request.getHeader("Referer")%>"/>
</section>
</body>
</html>
