<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>导航栏示例</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }
        .navbar {
            display: flex;
            justify-content: space-around;
            background-color: #f5f5f5;
            height: 50px;
            align-items: center;
        }
        .navbar div {
            flex: 1;
            text-align: center;
            line-height: 50px;
            color: white;
            font-size: 16px;
        }
        .navbar .home {
            background-color: #66BB6A;
        }
        .navbar .library {
            background-color: #42A5F5;
        }
        .navbar .center {
            background-color: #1E88E5;
        }
    </style>
</head>
<body>
<div class="navbar">
    <div class="home">首页</div>
    <div class="library">资料库</div>
    <div class="center">个人中心</div>
</div>
</body>
</html>
