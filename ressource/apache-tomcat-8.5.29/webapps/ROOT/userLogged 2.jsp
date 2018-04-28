<%--
  Created by IntelliJ IDEA.
  User: debaerdm
  Date: 20/03/2018
  Time: 13:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="bean.LoginBean" %>

<html>
<head>
    <link href="CSS/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="CSS/signin.css" rel="stylesheet">
    <title> Connexion réussi </title> </head>
    <body>
            <%
                LoginBean currentUser = (LoginBean) (session.getAttribute("currentSessionUser"));

                String userName = null;
                String sessionID = null;

                Cookie[] cookies = request.getCookies();
                if(cookies !=null){
                    for(Cookie cookie : cookies){
                        if(cookie.getName().equals("user")) userName = cookie.getValue();
                        if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();
                    }
                }
            %>

            <h3>Bonjour, <%= userName %>, connexion réussi. Votre Session ID = <%= sessionID %></h3>
        <br>
            User = <%= currentUser.getLogin() %>
        <br>
            <a href="checkoutPage.jsp">Verifier la page</a>
            <form action="/logoutService" method="post">
                <button class="btn btn-lg btn-primary btn-block" type="submit">Deconnexion</button>
            </form>
    </body>
</html>