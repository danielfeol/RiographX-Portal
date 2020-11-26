<%-- 
    Document   : header
    Created on : 06/12/2018, 15:55:12
    Author     : Daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page = "header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="function">
    <img id="functionImage" style="margin: 0 auto; display:block" src="">
</div>
<div class="oitenta" style="padding: 0px 0px 20px 0px;">
    <div class="titulo" style="margin-bottom: 20px;">Current users</div>

    <table class="tableForm" id="example">
        <thead>
            <tr>
                <th>Name</th>
                <th>Open reports</th>
                <th>E-mail</th>
                <th>Active</th>
                <th>Delete</th>
            </tr>
        </thead>

        <tbody>
        <c:forEach var="users" items="${listaUsuario}">
            <tr> 
                <td>
                       
                            
                            <a>${users.nome}        </a></td><td>
                    <c:if test="${users.active}">
                        <form id="formAdmin" method="get" action="resultsAdmin.jsp">
                        <input type="text" hidden="true" id="id" name="id" value="${users.codigo}"/>
                        <input type="submit" class="submitReportList" value="Go!"/></form>
                    </c:if>
                    </td>
                   
                <td><div class="left">${users.login}</div></td>
                <td><div class="center">${users.active}</div></td>
                <td>
                    <div class="center">
                        <form method="post" action="admin.jsp">
                            <input type="hidden" name="id" value="${users.codigo}"/>
                            <input type="image" src="img/delete.png" class="input-result" name="bOK" value="submit" id="submit"/>
                        </form>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>

        <div class="clear"></div>
    </table>
    <div class="clear"></div>
</div>
<jsp:include page = "footer.jsp" />

<script>

    function back() {
        window.location.href = "index";
    }

    function getFiles(exp) {
        $("#users").val(exp);
        $("#formFunction").submit();
    }

    $(document).ready(function () {
        $('#example').dataTable({
            "oLanguage": {
                "sUrl": "js/pt_BR.txt"
            },
            "iDisplayLength": 20,
            "bLengthChange": false,
            "fnInitComplete": function (oSettings, json) {
                doTableComplete();
            },
            "bAutoWidth": false,
            "sPaginationType": "full_numbers",
            "aoColumns": [
                {"sWidth": "45%"},
                {"sWidth": "5%"},
                {"sWidth": "45%"},
                {"sWidth": "10%"},
                {"sWidth": "5%"}]
        }).fnSort([[0, 'desc']]);
    });
    if ( window.history.replaceState ) {
        window.history.replaceState( null, null, window.location.href );
    }
</script>				
