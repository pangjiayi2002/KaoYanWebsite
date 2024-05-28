<%@ page import="util.ImageUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户管理</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="renderer" content="webkit">
    <title></title>
    <link rel="stylesheet" href="/css/pintuer.css">
    <link rel="stylesheet" href="/css/admin.css">
    <link rel="stylesheet" href="/css/bootstrap.css">
    <link rel="stylesheet" href="/css/amazeui.min.css">
    <link rel="stylesheet" href="/css/admin1.css">
    <link rel="stylesheet" href="/css/app.css">
    <script src="/js/jquery.js"></script>
    <script src="/js/pintuer.js"></script>
    <script src="/js/amazeui.min.js"></script>
    <script src="/js/app.js"></script>
    <script src="/js/plugs.js"></script>
</head>
<body>


<form method="post" action="">
    <div class="panel admin-panel" style="border: 1px solid #ddd;">
        <div class="panel-head"><span class="icon-magic">用户列表</strong></div>
        <div class="padding border-bottom">
            <style>
                ul li {
                    display: inline;
                }
            </style>
            <ul class="search" style="height: 40px">


                <li>
                    <form action="/ListServlet" method="post">
                        <div class="am-u-sm-12 am-u-md-3" style="position: absolute;right:10px;
								left:850px;top:68px">
                            <div class="am-input-group am-input-group-sm">
                                <input class="am-form-field" placeholder="请输入用户姓名" name="name"
                                       value="${name}"
                                       type="text">
                                <span class="am-input-group-btn">
										<button type="submit" style="margin-left: 5px"
                                                class="btn btn-primary">查询</button>
                            </div>
                        </div>
                    </form>
                </li>
            </ul>
        </div>
        <table class="table table-hover text-center">
            <tr>
                <th>编号</th>
                <th>姓名</th>
                <th>头像</th>
                <th>角色</th>
                <th>操作</th>
            </tr>

            <c:forEach items="${users}" var="user">
            <tr>
                <td>${user.id}</td>
                <td>${user.username}</td>
                <td>
                    <img id="img" class="to" style="width: 60px;height: 60px" alt="图片加载失败" src="data:image/jpeg;base64,${user.avatarStr}">
                </td>
                <td>${user.role}</td>
                <td>
                    <button onclick="deleteOne('${user.id}')" class="btn btn-warning">删除</button>
                </td>
            </tr>
            </c:forEach>

            <tr>
                <td colspan="8">
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <c:if test="${pageNow - 1 > 0}">
                                <li>
                                    <a href="/ListServlet&page=${pageNow-1}&name=${name}"
                                       aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:if>

                            <c:forEach begin="1" end="${pages}" var="page">
                                <c:if test="${page == pageNow}">
                                    <li><a
                                            style="background: blue;color:#fff"
                                            href="/ListServlet&page=${page}&name=${name}">
                                            ${page}</a></li>
                                </c:if>
                                <c:if test="${page != pageNow}">
                                    <li><a
                                            href="/ListServlet&page=${page}&name=${name}">
                                            ${page}</a></li>
                                </c:if>
                            </c:forEach>

                            <li>
                                <c:if test="${pageNow + 1 <= pages}">
                                    <a href="/ListServlet&page=${pageNow + 1}&name=${name}" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </c:if>

                            </li>
                        </ul>
                    </nav>
    </div>
    </td>
    </tr>
    </table>
    </div>
</form>
</body>
</html>
<script>


    //删除单条数据
    function deleteOne(sid) {
        let isDelete = confirm("确认删除该条数据吗？");
        if (isDelete) {
            //发送删除请求
            $.ajax({
                url: "/DeleteServlet?id=" + sid, // 设置请求的URL地址
                method: "GET", // 设置请求的方法（GET、POST等）
                dataType: "json", // 设置返回结果的类型为JSON格式
                success: function (response) { // 成功时的处理逻辑
                    console.log("请求成功！");
                    alert("删除成功！")
                    console.log(response);
                },
                error: function () { // 失败时的处理逻辑
                }
            });
        }
    }
</script>
</html>
