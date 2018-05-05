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
                url: '/api/users/allfriends',
                dataType: 'json',
                success: function(json) {
                    console.log(JSON.stringify(json));

                    let myNode = document.getElementById("friends");
                    while (myNode.firstChild) {
                        myNode.removeChild(myNode.firstChild);
                    }

                    let cpt = 1;
                    $.each(json, function(idx, obj){
                        let login = obj.login;
                        let nom = obj.nom;
                        let prenom = obj.prenom;
                        let connecter = obj.connecter;

                        $("#friends").append("<div class=\"media\" style=\"border: dotted 1px \">\n" +
                            "                        <form onsubmit=\"return confirm('Etes-vous sur ?')\" action=\"\\suppressionAmisManager\" method=\"post\">\n" +
                            "                            <input id='supprAmis' name='suppr' type=\"hidden\" value='" + login + "'>\n" +
                            "                            <input id='" + cpt + "' name='scroll' type=\"hidden\" value='"+ cpt +"'>\n" +
                            "                            <button class=\"btn btn-primary followbtn\" type=\"submit\">Supprimer</button>\n" +
                            "                        </form>\n" +
                            "                        <div class=\"media-left\"> <a href=\"javascript:void(0)\">\n" +
                            "                            <img src=\"https://bootdey.com/img/Content/avatar/avatar1.png\" alt=\"\" class=\"media-object\"> </a> </div>\n" +
                            "                        <div class=\"media-body\">\n" +
                            "                            <h4 class=\"media-heading\">" + prenom + " " +  nom + "</h4>\n" +
                            "                            Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio. </div>\n" +
                            "                    </div><div id='div" + cpt + "' style='background-color: #1e7e34'>retour</div>"
                            /*"<div class=\"media\" style=\"border: dotted 1px \">\n" +
                            "                        <button onclick='supprimerAmis("+ "\"" + login + "\"" +")' class=\"btn btn-primary followbtn\">Supprimer</button>\n" +
                            "                        <div class=\"media-left\"> <a href=\"javascript:void(0)\">\n" +
                            "                            <img src=\"https://bootdey.com/img/Content/avatar/avatar1.png\" alt=\"\" class=\"media-object\"> </a> </div>\n" +
                            "                        <div class=\"media-body\">\n" +
                            "                            <h4 class=\"media-heading\">" + prenom + " " +  nom + "</h4>\n" +
                            "                            Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio. </div>\n" +
                            "                    </div>"*/);
                        cpt = cpt+1;
                    });
                }
            }).complete(function() {
                setTimeout(function () {
                    getUsers();
                }, 10000);
            })
        }
    </script>

    <title>Profile</title>
</head>
<%@include file="header.jsp"%>
<body>


<div class="container">
    <H1 style="text-align: center; color: #ffc107; font-family: 'Arial Black'; font-weight: bold;">Mon Profil</H1>
    <div class="col-md-12 text-center ">
        <div class="panel panel-default">
            <div class="userprofile social ">
                <div class="userpic"> <img src="https://bootdey.com/img/Content/avatar/avatar6.png" alt="" class="userpicimg"> </div>
                <h3 class="username">Lucky Sans</h3>
                <p>Gujarat, India</p>
                <div class="socials tex-center"> <a href="" class="btn btn-circle btn-primary ">
                    <i class="fa fa-facebook"></i></a> <a href="" class="btn btn-circle btn-danger ">
                    <i class="fa fa-google-plus"></i></a> <a href="" class="btn btn-circle btn-info ">
                    <i class="fa fa-twitter"></i></a> <a href="" class="btn btn-circle btn-warning "><i class="fa fa-envelope"></i></a>
                </div>
            </div>
            <div class="col-md-12 border-top border-bottom">
                <ul class="nav nav-pills pull-left countlist" role="tablist">
                    <li role="presentation">
                        <h3>1452<br>
                            <small>Follower</small> </h3>
                    </li>
                    <li role="presentation">
                        <h3>245<br>
                            <small>Following</small> </h3>
                    </li>
                    <li role="presentation">
                        <h3>5000<br>
                            <small>Activity</small> </h3>
                    </li>
                </ul>
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
