<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
    <head>

        <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <link href="CSS/home.css" rel="stylesheet" type="text/css">
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
                                "<a href=\"profile.jsp#"+login+"\" class=\"list-group-item list-group-item-action list-group-item-"+((connecter !== 0) ? "success" : "light")
                                + "\"> " + nom + " " + prenom +"</a>");
                        });
                    }
                }).complete(function() {
                    setTimeout(function () {
                        getUsers();
                    }, 10000);
                })
            }
        </script>
        <title>MiageBook</title>
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
                <h1> Bienvenue sur MiageBook </h1>
                <p>
                    Projet de CAR réalisé par : Dupriez Alexandre et De Baerdemaeker Mathieu !
                </p>
            </div>
        </div>

        <div class="container-fluid">
            <div class="row">
                <div class="first-column">
                    <div class="col-6">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="status-upload nopaddingbtm">
                                    <form action="${pageContext.request.contextPath}/statusservice" method="post" id="fileForm" role="form">
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
                                        <button type="submit" class="btn btn-success pull-right"> Share </button>
                                    </form>
                                </div>
                                <!-- Status Upload  -->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="second-column">
                    <div class="col">
                     <div id="allUsers" class="list-group"></div>
                    </div>
                </div>
            </div>
        </div>

    </body>
    <!--<%@include file="footer.jsp"%>-->
</html>