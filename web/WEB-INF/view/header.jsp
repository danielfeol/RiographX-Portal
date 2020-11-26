<%-- 
    Document   : header
    Created on : 06/12/2018, 15:55:12
    Author     : Daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="icon" type="image/png" href="img/favicon.png">
<html>
    <head>
        <title>RiographX - A Science Gateway in Spectral Graph Theory</title>
        <meta name="google-site-verification" content="eMsON1pFM_nhWZOFvqyyrq6Nj9fzjX5JIoADuv-QYro" />
        <link rel="stylesheet" href="css/style.css?id=400" type="text/css"/>
        <link rel="stylesheet" href="css/jquery.dataTables.css?id=400" type="text/css"/>
        <link rel="stylesheet" href="/css/tipTip.css" type="text/css"/>	
        <link href='https://fonts.googleapis.com/css?family=Lato:400' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Open+Sans+Condensed:700' rel='stylesheet' type='text/css'>


        <script src="js/jquery-1.12.0.js"></script>
        <script src="js/jquery.tipTip.minified.js"></script>	
        <script src="js/script.js"></script>
        <script src="js/jquery.dataTables.js"></script>

        <script>
            function form() {
                window.location.href = "userForm";
            }

            function requestData() {
                window.location.href = "requestData";
            }

        </script>
    </head>

    <body>
        <div id="page">
            <a href="index.jsp" class="logo"><img src="img/logo.png"></a>

            <div class="log_reg">
                <%if (session.getAttribute("usuarioLogado") == null) { %>
                <a href="login.jsp">Login</a> or <a href="account.jsp">Create an account</a>
                <%} else { %> ${sessionScope.usuarioLogado.nome}
                <a href="${pageContext.request.contextPath}/logout.jsp">(Exit)</a><%} %>
                <%if (session.getAttribute("adminLogado") != null) { %>
                <a href="admin.jsp">Admin Area</a>
                <%}%>
            </div>
            <div class="clear"></div>

            <div id="menu">
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="documents.jsp">Documents</a></li>
                    <li class="sae"><a href="submitAnExperiment.jsp" onclick="form()">Submit an experiment</a></li>
                    <li><a href="results.jsp" onclick="requestData();">My experiments</a></li>
                </ul>    
            </div>

            <div class="clear"></div>

            <div id="msgBar">
                <div id="msgBarBody" >
                    <span id="msgText"></span> 
                </div>
            </div>


