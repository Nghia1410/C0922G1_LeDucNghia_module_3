<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/30/2022
  Time: 11:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="static java.sql.DriverManager.println" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Simple Dictionary</title>
</head>
<body>
<%!
    Map<String, String> dic = new HashMap<>();
%>

<%
    dic.put("hello", "Xin chào");
    dic.put("how", "Thế nào");
    dic.put("book", "Quyển vở");
    dic.put("computer", "Máy tính");

    String search = request.getParameter("search");

    String result = dic.get(search);
    if (result != null) {
        println("Word: " + search);
       println("Result: " + result);
    } else {
        println("Not found");
    }
%>
</body>
</html>
