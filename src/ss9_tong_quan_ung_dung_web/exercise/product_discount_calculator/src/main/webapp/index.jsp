<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/29/2022
  Time: 11:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form action="/display-discount" method="post">
    <h2>Nhập sản phẩm</h2>
    <div class="product">
    <input type="text" name="ProductDescription" placeholder="Mô tả sản phẩm"/>
    <input type="number" name="Price" placeholder="Giá sản phẩm"/>
    <input type="number" name="Discount" placeholder="Tỉ lệ chiết khấu"/>
    <input type=submit value="Tính chiết khấu"/>
    </div>
  </form>
  </body>
</html>
