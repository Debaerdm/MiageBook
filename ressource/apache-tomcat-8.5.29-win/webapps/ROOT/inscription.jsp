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
    <link href="CSS/home.css" rel="stylesheet" type="text/css">
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
                        <form action="${pageContext.request.contextPath}/registerservice" method="post" id="fileForm" role="form" onsubmit="return sure()">
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
                                    <input class="form-control" type="text" name="login" id = "login" onkeyup = "loginTest(this.value); return false;" placeholder="Nom d'utilisateur" required />
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
                                    <p><span class="req">* </span> REQUIRED.</p>
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
</body>
<!--<%@include file="footer.jsp"%>-->
</html>
