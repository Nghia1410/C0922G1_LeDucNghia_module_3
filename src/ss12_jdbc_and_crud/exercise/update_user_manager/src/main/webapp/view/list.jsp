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
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
</body>
<head>
    <title>User Management Application</title>
</head>
<body>
<center>
    <h1>User Management</h1>
    <h2>
        <a href="users?action=create">Add New User</a>
    </h2>

    <form action="/users?action=find" method="post">
        <input type="text" name="findByCountry" placeholder="tìm kiếm theo thành phố ">
        <button type="submit">FIND</button>
    </form>

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
                <td>
                    <button onclick="infoEdit('${user.getId()}','${user.getName()}','${user.getEmail()}','${user.getCountry()}')"
                            type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#edit">
                        Edit
                    </button>
                </td>
                <td>
                    <button onclick="infoDelete('${user.getId()}','${user.getName()}')" type="button"
                            class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        Delete
                    </button>
                </td>
            </tr>
        </c:forEach>

    </table>
    <%-- modal delete--%>
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Delete </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="/user?action=delete" method="post">
                    <div class="modal-body">
                        <label for="deleteId"></label><input type="text" hidden id="deleteId" name="id">
                        Bạn có muốn xóa <span id="deleteName" style="color: brown; font-weight: bold"></span>
                        không ?
                    </div>
                    <div class="modal-">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-primary">Confirm</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <form class="d-flex" action="/users?action=sortByName" method="post">
        <button class="btn btn-outline-danger" type="submit">Sort by name</button>
    </form>
</div>
<script>
    function infoDelete(id, name) {
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteName").innerText = name;
    }
</script>

</body>
</html>
