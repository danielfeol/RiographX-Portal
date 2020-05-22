<%-- 
    Document   : index
    Created on : 06/12/2018, 15:48:50
    Author     : Daniel
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page = "header.jsp" />


<c:if test="${mensagens.existeErros}">
<div id="erro">
    <ul>
        <c:forEach var="erro" items="${mensagens.erros}">
            <li> ${erro} </li>
        </c:forEach>
    </ul>
</div>
</c:if>


<div class="clear"></div>
<jsp:include page = "footer.jsp" />