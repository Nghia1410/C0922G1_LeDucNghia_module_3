<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/3/2023
  Time: 5:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List</title>
</head>
<body>
<h1>Hiển thị danh sách</h1>
<h2><a href="/products?action=create">Thêm sản phẩm</a></h2>
<h3>${mess}</h3>
<fieldset>
    <legend style="background-color: red">Danh sách sản phẩm</legend>
    <table>
        <tr>
            <td>STT</td>
            <td>NAME</td>
            <td>PRICE</td>
        </tr>
        <c:forEach var="Product" items="${productList}" varStatus="status">
            <tr>
                <td>${status.count}</td>
                <td>${Product.name}</td>
                <td>${Product.price}</td>
            </tr>
        </c:forEach>


    </table>
</fieldset>
</body>
</html>
