<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>

    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <link href="CSS/home.css" rel="stylesheet" type="text/css">
    <link href="CSS/profile.css" rel="stylesheet" type="text/css">
    <link href="CSS/miageNav.css" rel="stylesheet" type="text/css">
    <script src="JS/users.js"></script>

    <title>MiageBook</title>
</head>
<%@include file="header.jsp"%>
<body>
<div id="outer">
    <%
        if (currentUser == null) {
            response.sendRedirect("/login.jsp");
        } else {
    %>
    <input type="hidden" id="login" value="<%=currentUser.getLogin()%>">
    <%
        }
    %>

    <script src="JS/feed.js"></script>
    <script src="JS/commentaire.js"></script>

    <div class="jumbotron jumbotron-fluid">
        <div class="container">
            <h1> Mon feed </h1>
            <p>
                Tous mes status !
            </p>
        </div>
    </div>

    <div class="container-fluid">
        <div class="row">
            <div id="inner-first" class="first-column">
                <div class="col-lg-10 col-sm-offset-1 posttimeline">
                    <div id="status" class="panel panel-default">

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<!--<%@include file="footer.jsp"%>-->
</html>