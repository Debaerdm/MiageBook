<%--
  Created by IntelliJ IDEA.
  User: debaerdm
  Date: 13/03/2018
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
    <title>Login Process</title>
</head>
<body>
<%@page import="dao.LoginDao"%>
<jsp:useBean id="obj" class="bean.LoginBean"/>

<jsp:setProperty property="*" name="obj"/>

<%
    boolean status = LoginDao.validate(obj);
    if(status) {
        out.println("You'r successfully logged in");
        session.setAttribute("session","TRUE");
    } else {
        out.print("Sorry, login or password error");
%>
<jsp:include page="myindex.jsp"/>
<%
    }
%>
</body>
</html>
