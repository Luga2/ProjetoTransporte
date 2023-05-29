<%-- 
    Document   : home
    Created on : 27 de abr. de 2023, 14:29:27
    Author     : QI
--%>

<%@include file="session/verify.jsp" %>
<%@page import="model.User"%>
<%   
    User userSession = (User) session.getAttribute("newUserSession");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transporte</title>
    </head>
    <body>
        
        <p>
            Bem vindo <%=
                                (userSession != null)
                                ? userSession.getUserName()
                                : "visitante"
                                %>!<br>
                            <button type="button" onclick="window.location.href='session/logout.jsp'"  style="vertical-align:middle"><span>Logout </span></button>
        </p>
       
        <main>
            <button onclick="window.location.href='cadastro.jsp'" style="vertical-align:middle"><span>Cadastrar</span></button>
            <button onclick="window.location.href='lista.jsp'"style="vertical-align:middle"><span>Listar</span></button>
        </main>
        
    </body>
</html>
