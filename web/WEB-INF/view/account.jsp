<%-- 
    Document   : index
    Created on : 06/12/2018, 15:48:50
    Author     : Daniel
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page = "header.jsp" />
<!--<img src="img/grafos1.png" class="alignright" style="margin-right: -60px; margin-top: -20px;">-->
<c:if test="${mensagens.existeErros}">
    <div id="erro">
        <ul>
            <c:forEach var="erro" items="${mensagens.erros}">
                <li> ${erro} </li>
            </c:forEach>
        </ul>
    </div>
</c:if>
<div class="metade"> 
    <h1 class="titulo">Fill in the fields below</h1>
        <form method="post" action="account.jsp">
            <table>
                <tr>
                    <th>Name: </th>
                    <td><input type="text" name="name"/></td>
                </tr>
                <tr>
                    <th>E-mail: </th>
                    <td><input type="text" name="email"></td>
                </tr>                
                <tr>
                    <th>Password: </th>
                    <td><input type="password" name="senha1"/></td>
                </tr>
                <tr>
                    <th>Re-Password: </th>
                    <td><input type="password" name="senha2"/></td>
                </tr>                
                <tr>
                    <td colspan="2"> 
                        <input type="submit" class="submitJob" name="accountOK" value="Create Account"/>
                    </td>
                </tr>
            </table>
        </form>
</div>
<div class="metade"> 
    <h1 class="titulo">Guidelines</h1>
        
            
                <table>               
                    <tr>
                        <td><a>Fill in the form with your full name, e-mail address and password.</a></td>
                        
                    </tr>
                    <tr>
                        <td><a>The password must have at least 8 characters.</a></td>
                    </tr>                
                    <tr>
                        <td><a>You will receave an e-mail with a link to activate your account.</a></td>
                    </tr>
                <tr>
                    <td> 
                        <br><br><br><br><br><br>
                    </td>
                </tr>                    
                </table>

            

        
</div>
<div class="clear"></div>

<jsp:include page = "footer.jsp" />