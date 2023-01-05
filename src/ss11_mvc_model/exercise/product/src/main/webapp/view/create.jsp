<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/5/2023
  Time: 10:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>create</title>
</head>
<body>
<form action="/products?action=create" method="post">
    <input type="text" name="name" placeholder="nhập tên">
    <input type="text" name="price" placeholder="nhập giá">
    <button type="submit">SAVE</button>
</form>
</body>
</html>