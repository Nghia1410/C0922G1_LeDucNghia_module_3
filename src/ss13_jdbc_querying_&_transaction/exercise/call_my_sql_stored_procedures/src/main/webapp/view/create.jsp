<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/4/2023
  Time: 10:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>create</title>
</head>
<body>
<form action="users?action=create" method="post">
    <input type="text" name="name" placeholder="nhập tên">
    <input type="text" name="email" placeholder="nhập email">
    <input type="text" name="country" placeholder="nhập địa chỉ">
    <button type="submit">SAVE</button>
</form>
</body>
</html>
