<%-- 
    Document   : index
    Created on : 06/12/2018, 15:48:50
    Author     : Daniel
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page = "header.jsp" />
<img src="img/grafos1.png" class="alignright" style="margin-right: -60px; margin-top: -20px;">
<div class="content"> 
    <h1 class="titulo">User authentication</h1>
        <c:if test="${mensagens.existeErros}">
            <div id="erro">
                <ul>
                    <c:forEach var="erro" items="${mensagens.erros}">
                        <li> ${erro} </li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>
        <form method="post" action="login.jsp">
            <table>
                <tr>
                    <th>E-mail: </th>
                    <td><input type="text" name="login"
                               value="${param.login}"/></td>
                </tr>
                <tr>
                    <th>Password: </th>
                    <td><input type="password" name="senha" /></td>                    
                </tr>
                <tr>
                    <th></th>
                    <td><a href="reset.jsp">Forgot your password?</a></td>
                </tr>
                <tr>
                    <td colspan="2"> 
                        <input type="submit" class="submitJob" name="bOK" value="Login"/>
                    </td>
                </tr>
            </table>
        </form>
</div>

<div class="clear"></div>

<jsp:include page = "footer.jsp" />