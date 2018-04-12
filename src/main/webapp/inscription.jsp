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
    <title>Inscription Page</title>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <link href="CSS/index.css" rel="stylesheet" type="text/css">
    <link href="CSS/miageNav.css" rel="stylesheet" type="text/css">
</head>
<%@include file="header.jsp"%>
<body class="text-center">
    <div class="container-fluid">
        <section class="container">
            <div class="container-page">
                <div class="col-md-6">
                    <h3 class="dark-grey">Registration</h3>

                    <div class="form-group col-lg-12">
                        <label for="inputLogin" class="sr-only">Nom d'utilisateur</label>
                        <input type="text" id="inputLogin" class="form-control" placeholder="Utilisateur" name="login" required autofocus>
                    </div>

                    <div class="form-group col-lg-12">
                        <label for="inputPassword" class="sr-only">Mot de passe</label>
                        <input type="password" id="inputPassword" class="form-control" placeholder="Mot de passe" name="password" required>
                    </div>

                    <div class="form-group col-lg-12">
                        <label for="inputPasswordRequiered" class="sr-only">Confirmer mot de passe</label>
                        <input type="password" id="inputPasswordRequiered" class="form-control" placeholder="Confirmer mot de passe" name="passwordRequired" required>
                    </div>

                    <div class="form-group col-lg-12">
                        <label for="inputEmail" class="sr-only">Adresse mail</label>
                        <input type="email" id="inputEmail" class="form-control" placeholder="Email" name="email" required>
                    </div>
                </div>

                <div class="col-md-6">
                    <h3 class="dark-grey">Terms and Conditions</h3>
                    <p>
                        By clicking on "Register" you agree to The Company's' Terms and Conditions
                    </p>
                    <p>
                        While rare, prices are subject to change based on exchange rate fluctuations -
                        should such a fluctuation happen, we may request an additional payment. You have the option to request a full refund or to pay the new price. (Paragraph 13.5.8)
                    </p>
                    <p>
                        Should there be an error in the description or pricing of a product, we will provide you with a full refund (Paragraph 13.5.6)
                    </p>
                    <p>
                        Acceptance of an order by us is dependent on our suppliers ability to provide the product. (Paragraph 13.5.6)
                    </p>

                    <button type="submit" class="btn btn-primary">S'enregistrer</button>
                    <a href="login.jsp">Déjà inscrit ?</a>
                </div>
            </div>
        </section>
    </div>

<!--<h1> Login Page</h1>
<!%@ include file="myindex.jsp" %>
<hr/>

<h3>Login Form</h3>
<!%
    String profile_msg = (String) request.getAttribute("profile_msg");
    if(profile_msg != null) {
        out.print(profile_msg);
    }

    String login_msg = (String) request.getAttribute("login_msg");
    if(login_msg != null) {
        out.print(login_msg);
    }
%>
<br/>

<form action="/inscriptionManager" class="form-signin" method="post">
    <img class="mb-4" src="https://shift8-stardothostingin.netdna-ssl.com/wp-content/uploads/2014/11/ser02.png" alt="" width="72" height="72">
    <h1 class="h3 mb-3 font-weight-normal">Inscrivez vous</h1>
    <label for="inputPrenom" class="sr-only">Prénom</label>
    <input type="text" id="inputPrenom" class="form-control" placeholder="Prenom" name="prenom" required autofocus>
    <label for="inputNom" class="sr-only">Nom</label>
    <input type="text" id="inputNom" class="form-control" placeholder="Nom" name="nom" required autofocus>
    <label for="inputMail" class="sr-only">E-mail</label>
    <input type="email" id="inputMail" class="form-control" placeholder="E-mail" name="mail" required autofocus>
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
    <a href="login.jsp">Déjà inscrit ?</a>
    <p class="mt-5 mb-3 text-muted">&copy; MiageBook 2018</p>
</form>-->
</body>
<%@include file="footer.jsp"%>
</html>
