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

    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="CSS/profile.css" rel="stylesheet">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <!--<script src="JS/users.js"></script>-->
    <link href="CSS/home.css" rel="stylesheet">
    <link href="CSS/miageNav.css" rel="stylesheet" type="text/css">


    <title>Profile</title>
</head>
<%@include file="header.jsp"%>
<body>
<%
    if (currentUser == null) {
        response.sendRedirect("/login.jsp");
    } %>

<div class="jumbotron jumbotron-fluid">
    <div class="container">
        <h1> Publier un status </h1>
        <p>
            Cette Page permet de publier un status qui sera ajouté à mon feed et que mes amis pourront voir et commenter
        </p>
    </div>
</div>

<div class="container">
        <div class="panel panel-default" style="margin-top: 3%">
            <h2 style="color: #ffc107">Nouveau Status</h2>
            <div class="panel-body">
                <div class="status-upload nopaddingbtm">
                        <form action="${pageContext.request.contextPath}/statusservice" method="post" id="fileForm" role="form">
                        <% if (currentUser != null) {
                        %>
                        <input class="form-control" type="hidden" name="login" id="login" value="<%=currentUser.getLogin()%>">
                        <%
                            }
                        %>
                        <div class="form-group">
                            <label for="titre"><span class="req"></span><strong> Titre : </strong></label>
                            <input class="form-control" type="text" name="titre" id ="titre" placeholder="Titre" required autofocus/>
                        </div>
                        <div class="form-group">
                            <label for="texte"><span class="req"></span><strong> Description : </strong></label>
                            <textarea class="form-control" type="text" name="texte" id ="texte" placeholder="Partager nous votre humeur !" required autofocus></textarea>
                        </div>
                        <br>
                        <ul class="nav nav-pills pull-left ">
                            <li><a title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Picture"><i class="glyphicon glyphicon-picture"></i></a></li>
                        </ul>
                        <button type="submit" class="btn btn-success pull-right"> Publier </button>
                    </form>
                </div>
                <!-- Status Upload  -->
            </div>
        </div>
</div>
</body>
<!--<%@include file="footer.jsp"%>-->
</html>