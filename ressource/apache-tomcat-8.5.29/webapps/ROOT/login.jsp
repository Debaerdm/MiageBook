<%--
  Created by IntelliJ IDEA.
  User: debaerdm
  Date: 13/03/2018
  Time: 16:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
    <title>Login Page</title>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <link href="CSS/signin.css" rel="stylesheet" type="text/css">
</head>

<body class="text-center">
<form action="/loginManager" class="form-signin" method="post">
    <img class="mb-4" src="https://shift8-stardothostingin.netdna-ssl.com/wp-content/uploads/2014/11/ser02.png" alt="" width="72" height="72">
    <h1 class="h3 mb-3 font-weight-normal">Connectez-vous, s'il vous plaît</h1>
    <label for="inputLogin" class="sr-only">Nom d'utilisateur</label>
    <input type="text" id="inputLogin" class="form-control" placeholder="Utilisateur" name="login" required autofocus>
    <label for="inputPassword" class="sr-only">Mot de passe</label>
    <input type="password" id="inputPassword" class="form-control" placeholder="Mot de passe" name="password" required>
    <div class="checkbox mb-3">
        <label>
            <input type="checkbox" value="remember-me"> Se souvenir de moi
        </label>
    </div>
    <button class="btn btn-lg btn-primary btn-block" type="submit">Connexion</button>
    <a href="inscription.jsp">Pas encore inscrit ?</a>

    <p class="mt-5 mb-3 text-muted">&copy; MiageBook 2018</p>
</form>
</body>
</html>
