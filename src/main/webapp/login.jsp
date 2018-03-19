<%--
  Created by IntelliJ IDEA.
  User: debaerdm
  Date: 13/03/2018
  Time: 16:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
    <title>Login Page</title>
</head>
<body>
<h1> Login Page</h1>
<%@ include file="myindex.jsp" %>
<hr/>

<h3>Login Form</h3>
<%
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

<form action="loginprocess.jsp" method="post">
    Login: <input type="text" name="login"/> <br/><br/>
    Password: <input type="password" name="password"/> <br/><br/>
    <input type="submit" value="login"/>"
</form>
</body>
</html>
