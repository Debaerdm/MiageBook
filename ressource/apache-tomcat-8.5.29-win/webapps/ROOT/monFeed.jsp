<%--
  Created by IntelliJ IDEA.
  User: aldup
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

    <title>Feed</title>
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
        <h1> Mon Feed </h1>
        <p>
            Cette page contient tous mes status postés
        </p>
    </div>
</div>

<div class="container">

        <!--  DIV CONTENANT TOUS LES STATUS -->
        <div class="col-md-8 col-sm-12 pull-left posttimeline">
            <!-- DIV CONTENANT UN STATUS AVEC SON CHAMPS DE REPONSE ET LES COMMENTAIRES-->
            <div class="panel panel-default">
                <div class="btn-group pull-right postbtn">
                    <button type="button" class="dotbtn dropdown-toggle" data-toggle="dropdown" aria-expanded="false"> <span class="dots"></span> </button>
                    <ul class="dropdown-menu pull-right" role="menu">
                        <li><a href="javascript:void(0)">Hide this</a></li>
                        <li><a href="javascript:void(0)">Report</a></li>
                    </ul>
                </div>
                <!-- STATUS -->
                <div class="col-md-12">
                    <div class="media">
                        <div class="media-left"> <a href="javascript:void(0)"> <img src="https://bootdey.com/img/Content/avatar/avatar3.png" alt="" class="media-object"> </a> </div>
                        <div class="media-body">
                            <h4 class="media-heading">Lucky Sans<br>
                                <small><i class="fa fa-clock-o"></i> Yesterday, 2:00 am</small> </h4>
                            <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio.Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus. </p>

                            <ul class="nav nav-pills pull-left ">
                                <li><a href="" title=""><i class="glyphicon glyphicon-thumbs-up"></i> 2015</a></li>
                                <li><a href="" title=""><i class=" glyphicon glyphicon-comment"></i> 25</a></li>
                                <li><a href="" title=""><i class="glyphicon glyphicon-share-alt"></i> 15</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- COMMENTAIRES POSTES SUR LE STATUS -->
                <div class="col-md-12 commentsblock border-top">
                    <div class="media">
                        <div class="media-left"> <a href="javascript:void(0)"> <img alt="64x64" src="https://bootdey.com/img/Content/avatar/avatar1.png" class="media-object"> </a> </div>
                        <div class="media-body">
                            <h4 class="media-heading">Astha Smith</h4>
                            <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
                        </div>
                    </div>
                    <div class="media">
                        <div class="media-left"> <a href="javascript:void(0)"> <img alt="64x64" src="https://bootdey.com/img/Content/avatar/avatar1.png" class="media-object"> </a> </div>
                        <div class="media-body">
                            <h4 class="media-heading">Lucky Sans</h4>
                            <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus. </p>
                            <div class="media">
                                <div class="media-left"> <a href="javascript:void(0)"> <img alt="64x64" src="https://bootdey.com/img/Content/avatar/avatar1.png" class="media-object"> </a> </div>
                                <div class="media-body">
                                    <h4 class="media-heading">Astha Smith</h4>
                                    <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
                                </div>
                            </div>
                        </div>
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
                                <small><i class="fa fa-clock-o"></i> Yesterday, 2:00 am</small> </h4>
                            <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio.Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus. </p>

                            <ul class="nav nav-pills pull-left ">
                                <li><a href="" title=""><i class="glyphicon glyphicon-thumbs-up"></i> 2015</a></li>
                                <li><a href="" title=""><i class=" glyphicon glyphicon-comment"></i> 25</a></li>
                                <li><a href="" title=""><i class="glyphicon glyphicon-share-alt"></i> 15</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 commentsblock border-top">
                    <div class="media">
                        <div class="media-left"> <a href="javascript:void(0)"> <img alt="64x64" src="https://bootdey.com/img/Content/avatar/avatar1.png" class="media-object"> </a> </div>
                        <div class="media-body">
                            <h4 class="media-heading">Astha Smith</h4>
                            <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
                        </div>
                    </div>
                    <div class="media">
                        <div class="media-left"> <a href="javascript:void(0)"> <img alt="64x64" src="https://bootdey.com/img/Content/avatar/avatar1.png" class="media-object"> </a> </div>
                        <div class="media-body">
                            <h4 class="media-heading">Lucky Sans</h4>
                            <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus. </p>
                            <div class="media">
                                <div class="media-left"> <a href="javascript:void(0)"> <img alt="64x64" src="https://bootdey.com/img/Content/avatar/avatar1.png" class="media-object"> </a> </div>
                                <div class="media-body">
                                    <h4 class="media-heading">Astha Smith</h4>
                                    <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<!--<%@include file="footer.jsp"%>-->
</html>
