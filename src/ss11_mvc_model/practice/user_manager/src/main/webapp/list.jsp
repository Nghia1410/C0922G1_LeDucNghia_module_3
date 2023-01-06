<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/4/2023
  Time: 10:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
</head>
<body>
<center>
    <h1>User Management</h1>
    <h2>
        <a href="users?action=create">Add New User</a>
    </h2>
</center>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>List of Users</h2></caption>
        <tr>
            <th>STT</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
        </tr>
        <c:forEach var="user" items="${users}" varStatus="status">
            <tr>
             <td>${status.count}</td>
             <td>${user.name}</td>
             <td>${user.email}</td>
             <td>${user.country}</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
