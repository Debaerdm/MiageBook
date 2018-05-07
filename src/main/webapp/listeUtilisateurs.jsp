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
    <script src="JS/users.js"></script>
    <link href="CSS/home.css" rel="stylesheet">
    <link href="CSS/miageNav.css" rel="stylesheet" type="text/css">
    <title>Liste des Utilisateurs</title>

    <script>
        $(document).ready(getUsers());

        function getUsers() {
            $.ajax({
                type: 'GET',
                url: '/rest/users/allusers',
                dataType: 'json',
                success: function(json) {

                    let myNode = document.getElementById("allUsers");
                    while (myNode.firstChild) {
                        myNode.removeChild(myNode.firstChild);
                    }

                    $.each(json, function(idx, obj){
                        console.log(obj);
                        let login = obj.login;
                        let nom = obj.nom;
                        let prenom = obj.prenom;
                        let connecter = obj.connecter;
                        let date_connection = obj.date_connection;

                        const mediaDiv = document.createElement("div");
                        setAttributes(mediaDiv, {"class":"media", "style":"border: dotted 1px"});

                        const profilLink = document.createElement("a");
                        profilLink.value = 'Voir le profile';

                        const form = document.createElement("form");
                        setAttributes(form, {"onsubmit":"return confirm('Etes-vous sur ?')", "action": "/addfriendservice", "method": "post" });
                        if (login !== document.getElementById("login").value) {
                            const buttonSubmit = document.createElement("button");
                            buttonSubmit.innerHTML = "Ajouter à mes amis";
                            setAttributes(buttonSubmit, {"class": "btn btn-primary followbtn", "type": "submit"});
                            form.appendChild(buttonSubmit);
                        }
                        const inputAddHidden = document.createElement("input");
                        form.appendChild(inputAddHidden);
                        const divLogo = document.createElement("div");
                        divLogo.setAttribute("class", "media-left");
                        const aLogo = document.createElement("a");
                        divLogo.appendChild(aLogo);
                        const imgLogo = document.createElement("img");
                        imgLogo.setAttribute("src", "https://bootdey.com/img/Content/avatar/avatar1.png");
                        setAttributes(imgLogo, {"src":"https://bootdey.com/img/Content/avatar/avatar1.png", "alt":"", "class":"media-object"});
                        aLogo.appendChild(imgLogo);
                        const divName = document.createElement("div");
                        divName.setAttribute("class", "media-body");
                        const hName = document.createElement("h4");
                        hName.setAttribute("class", "media-heading");
                        const spanName = document.createElement("span");
                        divName.appendChild(hName);
                        divName.appendChild(spanName);

                        profilLink.setAttribute("href", "profile.jsp#"+login);
                        aLogo.setAttribute("href",  "profile.jsp#"+login);
                        setAttributes(inputAddHidden, {"id":"ajouterAmis", "name":"ajouter", "type":"hidden", "value": login});
                        hName.innerHTML  = nom + " " + prenom;
                        if (connecter !== 0) {
                            spanName.innerHTML  = "En ligne"
                        } else {
                            let date = new Date(date_connection);

                            let MM = ["Jan", "Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov", "Dec"];

                            spanName.innerHTML = "Dernière connexion le " + ((date.getDate() < 10)? "0":"") + date.getDate() + " " + MM[date.getMonth()] + ". "+ date.getHours()+":"+date.getMinutes();
                        }

                        mediaDiv.appendChild(profilLink);
                        mediaDiv.appendChild(form);
                        mediaDiv.appendChild(divLogo);
                        mediaDiv.appendChild(divName);

                        $("#allUsers").append(mediaDiv);
                    });
                }
            }).complete(function() {
                timer1();
            })
        }

        window.onhashchange = function () {
            clearTimeout(timer1);
        };

        let timer1 = setTimeout(function () {getUsers();}, 10000);

    </script>
</head>
<%@include file="header.jsp"%>
<body>
<%
    if (currentUser == null) {
        response.sendRedirect("/login.jsp");
    } else {
%>
<input type="hidden" id="login" value="<%=currentUser.getLogin()%>">
<input type="hidden" id="nom" value="<%=currentUser.getNom()%>">
<input type="hidden" id="prenom" value="<%=currentUser.getPrenom()%>">
<input type="hidden" id="email" value="<%=currentUser.getEmail()%>">
<input type="hidden" id="connecter" value="<%=currentUser.getConnecter()%>">
<input type="hidden" id="date_connection" value="<%=currentUser.getDate_connection()%>">
<%
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

