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
    
        <c:if test="${mensagens.existeErros}">
            <div id="erro">
                <ul>
                    <c:forEach var="erro" items="${mensagens.erros}">
                        <li> ${erro} </li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>
        <c:if test="${tokenUsuario}">
            <h1 class="titulo">INSERT NEW PASSWORD</h1>
           <form method="post" action="setpass.jsp">
               <input type="text" name="pass" hidden="false" value="${pass}"/>
                <table>
                    <tr>
                        <th>E-mail: </th>
                        <td>${tokenLogin}<input type="text" name="email" hidden="true"
                                   value="${tokenLogin}"/></td>
                    </tr>
                    <tr>
                        <th>Password: </th>
                        <td><input type="password" name="senha1" /></td>                    
                    </tr>
                    <tr>
                        <th>Re-Password: </th>
                        <td><input type="password" name="senha2"/></td>
                    </tr>                     
                    <tr>
                        <td colspan="2"> 
                            <input type="submit" class="submitJob" name="resetOK" value="Submit"/>
                        </td>
                    </tr>
                </table>
            </form> 
           
        </c:if>
        
</div>

<div class="clear"></div>

<jsp:include page = "footer.jsp" />