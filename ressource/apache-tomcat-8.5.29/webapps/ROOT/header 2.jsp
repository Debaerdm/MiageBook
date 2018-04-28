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
                <li class="active" ><a href="myindex.jsp">Home</a></li>
                <li><a href="#">Page 1</a></li>
                <li><a href="#">Page 2</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <%
                    LoginBean currentUser = (LoginBean) (session.getAttribute("currentSessionUser"));

                    /*String userName = null;
                    String sessionID = null;

                    Cookie[] cookies = request.getCookies();
                    if(cookies !=null){
                        for(Cookie cookie : cookies){
                            if(cookie.getName().equals("user")) userName = cookie.getValue();
                            if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();
                        }
                    }*/

                    if (currentUser != null) { %>
                         <li>
                             <a href="profile.jsp"><span class="glyphicon glyphicon-user"></span>
                                 <%= currentUser.getLogin() %>
                             </a>
                         </li>
                         <li><a href="/logoutService"><span class="glyphicon glyphicon-log-in"></span> Déconnexion </a></li>
                    <% } else { %>
                        <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login </a> </li>
                        <li><a href="inscription.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up </a> </li>
                    <% } %>
            </ul>
        </div>
    </nav>
</header>