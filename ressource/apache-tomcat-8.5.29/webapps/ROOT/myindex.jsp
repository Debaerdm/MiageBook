<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
    <head>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <link href="CSS/index.css" rel="stylesheet" type="text/css">
        <link href="CSS/miageNav.css" rel="stylesheet" type="text/css">

        <title>MiageBook</title>
    </head>
    <%@include file="header.jsp"%>
    <body>

        <%
            if (currentUser == null) {
                response.sendRedirect("/login.jsp");
            }
        %>


        <div class="container">
            <h1> Bienvenue sur MiageBook </h1>
            <p> 
                Projet de CAR réalisé par : Dupriez Alexandre et De Baerdemaeker Mathieu !
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBv1sjMLGASVkWL2cU0YtIXPVyyLwPwHGrGniqnAUwlyqoep37">
            </p>
        </div>
    </body>
    <%@include file="footer.jsp"%>
</html>

<!--<body>
        <!%@ include file="header.jsp"%>
        <div class="container">
            <h1>MiageBook</h1>
            <a href="login.jsp">Login</a>
        </div>
        <!%@ include file="footer.jsp"%>

        <script src="JS/bootstrap.min.js"></script>
    </body>
</html>-->