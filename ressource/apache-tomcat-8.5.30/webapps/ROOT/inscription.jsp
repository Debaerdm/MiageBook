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
    <link href="CSS/register.css" rel="stylesheet" type="text/css">
    <script src="JS/register.js"></script>
</head>
<%@include file="header.jsp"%>
<body class="text-center">
    <div class="container-fluid">
            <div class="container">
                <div class="row">
                    <div class="center-block">
                        <form action="/InscriptionManager" method="post" id="fileForm" role="form">
                            <fieldset><legend class="text-center">Plusieurs informations sont requis pour l'inscriptions.</legend>

                                <div class="form-group">
                                    <label for="nom"><span class="req">* </span> Nom : </label>
                                    <input class="form-control" type="text" name="nom" id ="nom" onkeyup = "Validate(this); return false;" placeholder="Nom" required autofocus/>
                                    <!--<div id="errFirst"></div>-->
                                </div>

                                <div class="form-group">
                                    <label for="prenom"><span class="req">* </span> Prénom : </label>
                                    <input class="form-control" type="text" name="prenom" id = "prenom" onkeyup = "Validate(this); return false;" placeholder="Prénom" required />
                                    <!--<div id="errLast"></div>-->
                                </div>

                                <div class="form-group">
                                    <label for="email"><span class="req">* </span> Email Address: </label>
                                    <input class="form-control"  type="email" name="email" id = "email"  onkeyup="email_validate(this.value); return false;" placeholder="example@miagebook.com" required/>
                                    <div class="status" id="status"></div>
                                </div>

                                <div class="form-group">
                                    <label for="login"><span class="req">* </span> Nom d'utilisateur :  <small> Votre nom d'utilisateur vu par les autres.</small> </label>
                                    <input class="form-control" type="text" name="login" id = "login" onkeyup = "Validate(this); return false;" placeholder="Nom d'utilisateur" required />
                                    <!--<div id="errLast"></div>-->
                                </div>

                                <div class="form-group">
                                    <label for="password"><span class="req">* </span> Votre mot de passe : </label>
                                    <input required name="password" type="password" class="form-control inputpass" minlength="4" maxlength="16" placeholder="Votre mot de passe"  id="password" />

                                    <label for="passwordRequired"><span class="req">* </span> Confirmer votre mot de passe : </label>
                                    <input required name="password" type="password" class="form-control inputpass" minlength="4" maxlength="16" placeholder="Confirmer votre mot de passe"  id="passwordRequired" onkeyup="checkPass(); return false;" />
                                    <span id="confirmMessage" class="confirmMessage"></span>
                                </div>

                                <div class="form-group">

                                    <?php //$date_entered = date('m/d/Y H:i:s'); ?>
                                    <input type="hidden" value="<?php //echo $date_entered; ?>" name="dateregistered">
                                    <input type="hidden" value="0" name="activate" />
                                    <hr>

                                    <input type="checkbox" required name="terms" onchange=
                                            "this.setCustomValidity(validity.valueMissing ? 'S\'il vous plaît accepter les ': '');"
                                           id="field_terms">
                                     <label for="field_terms">
                                        J'accepte les <a href="#" title="Lire les condtions d'inscriptions">terms et conditions</a> d'inscription.
                                    </label><span class="req">* </span>
                                </div>

                                <div class="form-group">
                                    <input class="btn btn-success" type="submit" name="submit_reg" value="Register">
                                </div>
                                <!--<h5>You will receive an email to complete the registration and validation process. </h5>
                                <h5>Be sure to check your spam folders. </h5>-->


                            </fieldset>
                        </form><!-- ends register form -->

                        <script type="text/javascript">
                            document.getElementById("field_terms").setCustomValidity("Please indicate that you accept the Terms and Conditions");
                        </script>
                    </div><!-- ends col-6 -->
                </div>
            </div>
    </div>

<!--<h1> Login Page</h1>



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

                    <div class="form-group col-lg-12">
                        <label for="inputNom" class="sr-only">Nomr</label>
                        <input type="text" id="inputNom" class="form-control" placeholder="Nom" name="login" required>
                    </div>

                    <div class="form-group col-lg-12">
                        <label for="inputPrenom" class="sr-only">Prénom</label>
                        <input type="text" id="inputPrenom" class="form-control" placeholder="Prénom" name="login" required>
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

                </div>

                <div class="col-lg-auto">
                    <button type="submit" class="btn btn-primary">S'enregistrer</button>
                    <a href="login.jsp">Déjà inscrit ?</a>
                </div>
            </div>


















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
