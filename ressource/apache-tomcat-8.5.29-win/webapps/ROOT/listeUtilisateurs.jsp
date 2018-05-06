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

    <link href="CSS/miageNav.css" rel="stylesheet" type="text/css">


    <script>
        $(document).ready(getUsers());

        function getUsers() {
            $.ajax({
                type: 'GET',
                url: '/rest/users/allusers',
                dataType: 'json',
                success: function(json) {
                    console.log(JSON.stringify(json));

                    let myNode = document.getElementById("allUsers");
                    while (myNode.firstChild) {
                        myNode.removeChild(myNode.firstChild);
                    }

                    $.each(json, function(idx, obj){
                        let login = obj.login;
                        let nom = obj.nom;
                        let prenom = obj.prenom;
                        let connecter = obj.connecter;

                        $("#allUsers").append(
                        "<div class=\"media\" style=\"border: dotted 1px \">\n" +
                        "<a href=\"profile.jsp#"+login+"\">Voir le profil</a>" +
                        "                        <form onsubmit=\"return confirm('Etes-vous sur ?')\" action=\"\\suppressionAmisManager\" method=\"post\">\n" +
                        "                            <input id='ajouterAmis' name='ajouter' type=\"hidden\" value='" + login + "'>\n" +
                        "                            <button class=\"btn btn-primary followbtn\" type=\"submit\">Ajouter à mes Amis</button>\n" +
                        "                        </form>\n" +
                        "                        <div class=\"media-left\"> <a href=\"javascript:void(0)\">\n" +
                        "                            <img src=\"https://bootdey.com/img/Content/avatar/avatar1.png\" alt=\"\" class=\"media-object\"> </a> </div>\n" +
                        "                        <div class=\"media-body\">\n" +
                        "                            <h4 class=\"media-heading\">" + prenom + " " +  nom + "</h4>\n" +
                        "                            En ligne / Derniere connexion il y a ...    </div>\n"
                        );
                    });
                }
            }).complete(function() {
                setTimeout(function () {
                    getUsers();
                }, 10000);
            })
        }
    </script>

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
    <div id="allUsers" class="list-group"></div>
</div>

</body>
<!--<%@include file="footer.jsp"%>-->
</html>

