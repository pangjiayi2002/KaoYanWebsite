<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>修改个人信息</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        var path = $("#path").val();
        var imgYes = "<img width='15px' src='"+path+"/images/y.png' />";
        var imgNo = "<img width='15px' src='"+path+"/images/n.png' />";
        /**
         * 提示信息显示
         * element:显示提示信息的元素（font）
         * css：提示样式
         * tipString:提示信息
         * status：true/false --验证是否通过
         */
        function validateTip(element,css,tipString,status){
            element.css(css);
            element.html(tipString);
            element.prev().attr("validateStatus",status);
        }
        var referer = $("#referer").val();
    </script>
    <style>
        .right {
            float: right;
            width: 70%; /* 调整右侧部分的宽度 */
        }
    </style>
    <script>
        var oldpassword = null;
        var newpassword = null;
        var rnewpassword = null;
        var saveBtn = null;

        $(function(){
            oldpassword = $("#oldpassword");
            newpassword = $("#newpassword");
            rnewpassword = $("#rnewpassword");
            saveBtn = $("#save");

            oldpassword.next().html("*");
            newpassword.next().html("*");
            rnewpassword.next().html("*");

            oldpassword.on("blur",function(){
                $.ajax({
                    type:"POST",
                    url: path + "/UserServlet",
                    data:{method:"pwdmodify",oldpassword:oldpassword.val()},//ajax传递参数
                    dataType:"json",
                    success:function(data){
                        if(data.result == "true"){//旧密码正确
                            validateTip(oldpassword.next(),{"color":"green"},imgYes,true);
                        }else if(data.result == "false"){//旧密码输入不正确
                            validateTip(oldpassword.next(),{"color":"red"},imgNo + " 原密码输入不正确",false);
                        }else if(data.result == "sessionerror"){//当前用户session过期，请重新登录
                            validateTip(oldpassword.next(),{"color":"red"},imgNo + " 当前用户session过期，请重新登录",false);
                        }else if(data.result == "error"){//旧密码输入为空
                            validateTip(oldpassword.next(),{"color":"red"},imgNo + " 请输入旧密码",false);
                        }
                    },
                    error:function(data){
                        //请求出错
                        validateTip(oldpassword.next(),{"color":"red"},imgNo + " 请求错误",false);
                    }
                });
            }).on("focus",function(){
                validateTip(oldpassword.next(),{"color":"#666666"},"* 请输入原密码",false);
            });

            newpassword.on("focus",function(){
                validateTip(newpassword.next(),{"color":"#666666"},"* 密码长度必须是大于6小于20",false);
            }).on("blur",function(){
                if(newpassword.val() != null && newpassword.val().length >= 6
                    && newpassword.val().length < 20 ){
                    validateTip(newpassword.next(),{"color":"green"},imgYes,true);
                }else{
                    validateTip(newpassword.next(),{"color":"red"},imgNo + " 密码输入不符合规范，请重新输入",false);
                }
            });


            rnewpassword.on("focus",function(){
                validateTip(rnewpassword.next(),{"color":"#666666"},"* 请输入与上面一致的密码",false);
            }).on("blur",function(){
                if(rnewpassword.val() != null && rnewpassword.val().length >= 6
                    && rnewpassword.val().length < 20 && newpassword.val() == rnewpassword.val()){
                    validateTip(rnewpassword.next(),{"color":"green"},imgYes,true);
                }else{
                    validateTip(rnewpassword.next(),{"color":"red"},imgNo + " 两次密码输入不一致，请重新输入",false);
                }
            });


            saveBtn.on("click",function(){
                oldpassword.blur();
                newpassword.blur();
                rnewpassword.blur();
                // oldpassword.attr("validateStatus") == "true"
                // &&
                if( oldpassword.attr("validateStatus") == "true"
                    &&newpassword.attr("validateStatus") == "true"
                    && rnewpassword.attr("validateStatus") == "true"){
                    if(confirm("确定要修改密码？")){
                        $("#userForm").submit();
                    }
                }
            });
        });
    </script>
</head>
<body>
<header class="publicHeader">
    <h1>修改个人信息</h1>
    <div class="publicHeaderR">
        <p><span>您好！</span><span style="color: #fff21b"></span> 欢迎你！</p>
        <a onclick="back()">返回</a>
    </div>
</header>
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
            <span>密码修改页面</span>
        </div>
        <div class="providerAdd">
            <form action="${pageContext.request.contextPath}/UserServlet" method="post" id="userForm" name="userForm">
                <input type="hidden" name="method" value="savepwd">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div class="info">${message}</div>
                <div>
                    <label for="oldPassword">旧密码：</label>
                    <input type="password" name="oldpassword" id="oldpassword" value="">
                    <font color="red"></font>
                </div>
                <div>
                    <label for="newPassword">新密码：</label>
                    <input type="password" name="newpassword" id="newpassword" value="">
                    <font color="red"></font>
                </div>
                <div>
                    <label for="rnewpassword">确认新密码：</label>
                    <input type="password" name="rnewpassword" id="rnewpassword" value="">
                    <font color="red"></font>
                </div>
                <div class="providerAddBtn">
                    <input type="submit" name="save" id="save" value="保存" class="input-button">
                </div>
            </form>
        </div>
    </div>
    <input type="hidden" id="path" name="path" value="${pageContext.request.contextPath}"/>
    <input type="hidden" id="referer" name="referer" value="<%=request.getHeader("Referer")%>"/>
</section>
<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>--%>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>--%>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/js/pwdmodify.js"></script>--%>
</body>
</html>
