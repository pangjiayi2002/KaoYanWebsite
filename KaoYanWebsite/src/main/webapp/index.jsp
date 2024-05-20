<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %></h1>
<br/>
<a href="hello-servlet">Hello servlet</a>
<form action="postHomeServlet" method="post">
  <input type="submit" value="社区">
</form>
<a href="postHomeServlet?school_id=1&user_id=2">click</a>
</body>
</html>