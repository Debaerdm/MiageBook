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
    <!--<script src="JS/users.js"></script>-->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    <link href="CSS/profile.css" rel="stylesheet">
    <link href="CSS/miageNav.css" rel="stylesheet" type="text/css">
    <link href="CSS/home.css" rel="stylesheet">
    <title>Profile</title>
</head>

<%@include file="header.jsp"%>

<body>

<%
    if (currentUser == null) {
        response.sendRedirect("/login.jsp");
    } else {
%>
<input type="hidden" id="login" value="<%=currentUser.getLogin()%>">
<%
    }
%>

<script src="JS/friends.js"></script>

<div class="jumbotron jumbotron-fluid">
    <div class="container">
        <h1> Mon Profil </h1>
        <p>
            Cette Page contient mes Infos et ma liste d'amis
        </p>
    </div>
</div>

<div class="container">
    <H1 style="text-align: center; color: #ffc107; font-family: 'Arial Black'; font-weight: bold;">Mon Profil</H1>
    <div class="col-md-12 text-center ">
        <div class="panel panel-default">
            <div class="userprofile social ">
                <div class="userpic"> <img src="https://bootdey.com/img/Content/avatar/avatar6.png" alt="" class="userpicimg"> </div>
                <h3 class="username"><%=currentUser.getLogin()%></h3>
                <p><%=currentUser.getPrenom()%>  <%=currentUser.getNom()%> <br> <%=currentUser.getEmail()%></p>
                <div class="socials tex-center"> <a href="" class="btn btn-circle btn-primary ">
                    <i class="fa fa-facebook"></i></a> <a href="" class="btn btn-circle btn-danger ">
                    <i class="fa fa-google-plus"></i></a> <a href="" class="btn btn-circle btn-info ">
                    <i class="fa fa-twitter"></i></a> <a href="" class="btn btn-circle btn-warning "><i class="fa fa-envelope"></i></a>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>

    </div>
    <H1 style="text-align: center; color: #ffc107; font-family: 'Arial Black',serif; font-weight: bold;">Mes Amis</H1>
    <div id="friends">


    </div>
</div>
</body>
<!--<%@include file="footer.jsp"%>-->
</html>
