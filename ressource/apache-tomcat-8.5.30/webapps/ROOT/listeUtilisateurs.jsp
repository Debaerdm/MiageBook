<%--
  Created by IntelliJ IDEA.
  User: debaerdm
  Date: 13/03/2018
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="bean.LoginBean" %>

<html>
<head>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="CSS/profile.css" rel="stylesheet">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="JS/mesAmis.js"></script>
    <link href="CSS/home.css" rel="stylesheet">
    <link href="CSS/miageNav.css" rel="stylesheet" type="text/css">
    <title>Liste des Utilisateurs</title>
</head>
<%@include file="header.jsp"%>
<body>
<%
    if (currentUser == null) {
        response.sendRedirect("/login.jsp");
    }
%>

<div class="jumbotron jumbotron-fluid">
    <div class="container">
        <h1> Les Utilisateurs </h1>
        <p>
            Cette Page contient la liste de tous les utilisateurs de MiageBook
        </p>
    </div>
</div>

<div class="container">
    <div id="allUsers" class="list-group">
    </div>
</div>

</body>
<!--<%@include file="footer.jsp"%>-->
</html>

