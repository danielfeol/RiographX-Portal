<%-- 
    Document   : header
    Created on : 06/12/2018, 15:55:12
    Author     : Daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Spectral Simulation Workflow Portal</title>
		<link rel="stylesheet" href="/PortalGraphX/css/style.css?id=400" type="text/css"/>
		<link rel="stylesheet" href="/PortalGraphX/css/jquery.dataTables.css?id=400" type="text/css"/>
		<link rel="stylesheet" href="/PortalGraphX/css/tipTip.css" type="text/css"/>	
        <link href='https://fonts.googleapis.com/css?family=Lato:400' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Open+Sans+Condensed:700' rel='stylesheet' type='text/css'>


		<script src="/PortalGraphX/js/jquery-1.11.0.min.js"></script>
		<script src="/PortalGraphX/js/jquery.tipTip.minified.js"></script>	
		<script src="/PortalGraphX/js/script.js"></script>
		<script src="/PortalGraphX/js/jquery.dataTables.js"></script>
		
        <script>
        function form() {
            window.location.href="userForm";
        }

        function requestData() {
            window.location.href="requestData";
        }

        </script>
	</head>
	
	<body>
        <div id="page">
        <a href="/riographx/" class="logo"><img src="/PortalGraphX/img/logo.png"></a>
            
        <div class="log_reg">
                    <p>Olá ${sessionScope.usuarioLogado.nome}</p>
        <ul>
            <li>
                <a href="${pageContext.request.contextPath}/logout.jsp">Sair</a>
            </li>
        </ul>    
        </div>
            
        <div class="clear"></div>
        
        <div id="menu">
            <ul>
                <li><a href="../index.jsp">Home</a></li>
                <li><a href="../desc.jsp">Description</a></li>
                <li class="sae"><a href="submitAnExperiment.jsp" onclick="form()">Submit an experiment</a></li>
                <li><a href="myExperiments.jsp" onclick="requestData();">My experiments</a></li>
            </ul>    
        </div>
        
        <div class="clear"></div>
            
			<!--- <div id="msgBar">
				<div id="msgBarBody" >
					<span id="msgText"></span> 
				</div>
			</div> --->
			
			
