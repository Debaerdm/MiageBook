<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
    <head>

        <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <link href="CSS/home.css" rel="stylesheet" type="text/css">
        <link href="CSS/profile.css" rel="stylesheet" type="text/css">
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
                                        <button type="submit" class="btn btn-success pull-right"> Publiez </button>
                                    </form>
                                </div>
                                <!-- Status Upload  -->
                            </div>
                        </div>
                    </div>




                    <div class="panel panel-default">
                        <div class="btn-group pull-right postbtn">
                            <button type="button" class="dotbtn dropdown-toggle" data-toggle="dropdown" aria-expanded="false"> <span class="dots"></span> </button>
                            <ul class="dropdown-menu pull-right" role="menu">
                                <li><a href="javascript:void(0)">Hide this</a></li>
                                <li><a href="javascript:void(0)">Report</a></li>
                            </ul>
                        </div>
                        <div class="col-md-12">
                            <div class="media">
                                <div class="media-left"> <a href="javascript:void(0)"> <img src="https://bootdey.com/img/Content/avatar/avatar3.png" alt="" class="media-object"> </a> </div>
                                <div class="media-body">
                                    <h4 class="media-heading">Lucky Sans<br>
                                        <small class="date"><i class="fa fa-clock-o"></i> Yesterday, 2:00 am</small> </h4>
                                    <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio. </p>

                                    <ul class="nav nav-pills pull-left ">
                                        <li><a href="" title=""><i class="glyphicon glyphicon-thumbs-up"></i> 2015</a></li>
                                        <li><a href="" title=""><i class=" glyphicon glyphicon-comment"></i> 25</a></li>
                                        <li><a href="" title=""><i class="glyphicon glyphicon-share-alt"></i> 15</a></li>
                                    </ul>
                                </div>
                                <!-- CHAMPS REPONSE AU STATUS  -->
                                <form>
                                    <textarea class="form-control" placeholder="Comment here"></textarea>
                                    <br>
                                    <ul class="nav nav-pills pull-left ">
                                        <li><a title=""><i class="glyphicon glyphicon-bullhorn"></i></a></li>
                                        <li><a title=""><i class=" glyphicon glyphicon-facetime-video"></i></a></li>
                                        <li><a title=""><i class="glyphicon glyphicon-picture"></i></a></li>
                                    </ul>
                                    <button type="submit" class="btn btn-success pull-right"> Comment</button>
                                </form>
                            </div>
                        </div>
                        <div class="col-md-12 commentsblock border-top">
                            <div class="media">
                                <div class="media-left"> <a href="javascript:void(0)"> <img alt="64x64" src="https://bootdey.com/img/Content/avatar/avatar1.png" class="media-object"> </a> </div>
                                <div class="media-body">
                                    <h4 class="media-heading">Astha Smith<br> <small class="date"><i class="fa fa-clock-o"></i> Yesterday, 2:00 am</small> </h4>
                                    <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
                                </div>
                            </div>
                            <div class="media">
                                <div class="media-left"> <a href="javascript:void(0)"> <img alt="64x64" src="https://bootdey.com/img/Content/avatar/avatar1.png" class="media-object"> </a> </div>
                                <div class="media-body">
                                    <h4 class="media-heading">Lucky Sans<br> <small class="date"><i class="fa fa-clock-o"></i> Yesterday, 2:00 am</small> </h4>
                                    <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus. </p>
                                    <div class="media">
                                        <div class="media-left"> <a href="javascript:void(0)"> <img alt="64x64" src="https://bootdey.com/img/Content/avatar/avatar1.png" class="media-object"> </a> </div>
                                        <div class="media-body">
                                            <h4 class="media-heading">Astha Smith<br> <small class="date"><i class="fa fa-clock-o"></i> Yesterday, 2:00 am</small> </h4>
                                            <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
                                        </div>
                                    </div>
                                </div>
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