<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/5/2023
  Time: 9:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>$Furama$</title>
    <link rel="stylesheet" href="../bootstrap-5.1.3-dist\css\bootstrap.css">

</head>
<body >
<div class="container-fluid">
    <div>
<div class="row ">
<div class="row" style="background-color: #0dcaf0;height: 80px">
    <div class="col-9">logo</div>
    <div class="col-3">Lê Đức Nghĩa</div>
</div>
<div class="row">
<nav class="navbar navbar-expand-lg bg-body-tertiary" style="background-color: #20c997">
        <a class="navbar-brand" href="#">Navbar</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Link</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">
                        Dropdown
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled">Disabled</a>
                </li>
            </ul>
            <form class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>

</nav>
</div>
</div>


<%--body--%>
<div class="row vh-100">
    <div class="col-4" style="background-color: #0b5ed7">Item one<br>Item Two <br> Item Three</div>
    <div class="col-8">BODY</div>
</div>
<%--end Body--%>




<%--FOOTER--%>
<div class="row">


    <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
        © 2021 Copyright:
        <a class="text-reset fw-bold" href="https://mdbootstrap.com/">MDBootstrap.com</a>
    </div>

</div>
<!-- Footer -->

</div>

<script src="../bootstrap-5.1.3-dist\js\bootstrap.js"></script>
</body>
</html>
