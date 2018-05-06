<%--
  Created by IntelliJ IDEA.
  User: debaerdm
  Date: 20/03/2018
  Time: 23:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="bean.LoginBean" %>

<header>
    <script>
        $('.nav ul li a').click(function() {
            $('li a').removeClass("active");
            $(this).addClass("active");
        });
    </script>

    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">
                    <img class="mb-4" src="https://shift8-stardothostingin.netdna-ssl.com/wp-content/uploads/2014/11/ser02.png" alt="" width="32" height="32">
                    MiageBook
                </a>
            </div>
            <ul class="nav navbar-nav">
                <li class="active" ><a href="myindex.jsp">Home Page</a></li>
                <li class="active" ><a href="listeUtilisateurs.jsp">Liste des utilisateurs</a></li>
                <li class="active" ><a href="profile.jsp">Mes amis</a></li>
                <li class="active" ><a href="publierStatus.jsp">Publier un status</a></li>
                <li class="active" ><a href="monFeed.jsp">Mon Feed</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <%
                    LoginBean currentUser = (LoginBean) (session.getAttribute("currentSessionUser"));
                    if (currentUser != null) { %>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="profile.jsp" role="button" aria-haspopup="true" aria-expanded="false">
                                <span class="glyphicon glyphicon-user"><strong> <%= currentUser.getLogin() %> </strong></span>
                            </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#"> Mes amis </a>
                                <a class="dropdown-item" href="#"> Liste des membres </a>
                            </div>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/logoutservice?login=<%= currentUser.getLogin() %>"><span class="glyphicon glyphicon-log-in"></span> Déconnexion </a></li>
                    <% } else { %>
                        <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login </a> </li>
                        <li><a href="inscription.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up </a> </li>
                    <% } %>
            </ul>
        </div>
    </nav>
</header>