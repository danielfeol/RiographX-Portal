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
    <div class="titulo" style="margin-bottom: 20px;">Request Result Data</div>

    <table class="tableForm" id="example">
        <thead>
        
            <tr><div class="center">User: ${Usuario.nome}</div>
                <th>Experiment</th>
                <th>Start Date/Time</th>
                <th>Status</th>
                <th>Elapsed Time(Minutes)</th>
                <th>File</th>
                <th>Delete</th>
            </tr>
        </thead>

        <tbody>
        <c:forEach var="experiment" items="${resultadosUsuario}">
            <tr>
                <td><div class="center">${experiment.name}</div></td>
                <td><div class="center">${experiment.start_datetime}</div></td>
                <td><div class="center">${experiment.status}</div></td>
                <td><div class="center">${experiment.elapsed}</div></td>
                <td><div class="center">
                            <c:if test="${experiment.status=='FINISHED'}">
                                <a href="Reports?filename=${experiment.submit}.pdf">Download</a>
                            </c:if>
                </div></td>
                <td><div class="center">
                            <c:if test="${experiment.status=='FINISHED' or experiment.status=='ERROR'}">
                                <form method="post" action="results.jsp">
                                    <input type="hidden" name="result" value="${experiment.result}"/>
                                    <input type="image" src="img/delete.png" class="input-result" name="bOK" value="submit" id="submit"/>
                                </form>
                            </c:if>
                    </div></td>
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
        $("#experiment").val(exp);
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
                {"sWidth": "25%"},
                {"sWidth": "25%"},
                {"sWidth": "25%"},
                {"sWidth": "30%"},
                {"sWidth": "10%"},
                {"sWidth": "5%"}]
        }).fnSort([[0, 'desc']]);
    });
    if ( window.history.replaceState ) {
        window.history.replaceState( null, null, window.location.href );
    }
</script>				

<%-- <jsp:include page = "footer.jsp" /> --%>