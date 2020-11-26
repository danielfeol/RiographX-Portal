<%-- 
    Document   : header
    Created on : 06/12/2018, 15:55:12
    Author     : Daniel
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page = "header.jsp" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<style type="text/css">

</style>
<script type="text/javascript" src="js/Markdown.Converter.js"></script>
<script type="text/javascript" src="js/Markdown.Sanitizer.js"></script>
<script type="text/javascript" src="js/Markdown.Editor.js"></script>
<script type="text/javascript" src="js/Markdown.Extra.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js?config=TeX-AMS_HTML-full"></script>
<script type="text/javascript" src="js/mathjax-editing_writing.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>


<div id="wmd-preview" class="column wmd-preview" align="center">
    <noscript>This text editor requires JavaScript.</noscript>
</div>
<c:if test="${mensagens.existeErros}">
    <div id="erro">
        <ul>
            <c:forEach var="erro" items="${mensagens.erros}">
                <li> ${erro} </li>
                </c:forEach>
        </ul>
    </div>
</c:if>
<form method="post" name="formFunction" id="formFunction" action="submitAnExperiment.jsp" >
    <div class="metade" style="height: 395px;">				
        <div class="titulo">Workflow Submission</div>

        <table>
            <tr>
                <td>Submission name:</td>
                <td><input style="width:240px; float: right;" type="text" name="name" id="name" size="105" /></td>
            </tr>            
            <tr>
                <td >Optimization Function</td>
                <td>&nbsp;</td>
            </tr>            
            <td>
                <input style="width:206%" name="function" id="wmd-input" class="column wmd-input" spellcheck="false" placeholder="Usage: $ latex argument $ "></td>
            <td>&nbsp;</td>
            <tr>
                <td>Maximize or minimize:</td>
                <td>
                    <input style="width:15px" type="radio" name="min_max_order" value="false" checked/>Min
                    <input style="width:15px" type="radio" name="min_max_order" value="true" />Max
                </td>
            </tr>
            <tr>
                <td>Minimum order <select style="width:40px; float: right;" type="text" name="ordermin" id="ordermin" size="1" /><option value=""><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option></select></td>
            <td>Maximum order <select style="width:40px; float: right;" type="text" name="ordermax" id="ordermax" size="1" /><option value=""><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option></select></td>
            </tr>

            <tr>
                <td>Minimum degree <select style="width:40px; float: right;" type="text" name="minDegree" id="minDegree" size="1" /><option value=""></option><option value="0">0</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option></select></td>
            <td>Maximum degree <select style="width:40px; float: right;" type="text" name="maxDegree" id="maxDegree" size="1" /><option value=""></option><option value="0">0</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option></select></td>
            </tr>

            <tr>
                <td>Number of results to show</td>
                <td><input style="float: right; width:40px;" type="text"  name="maxResults" id="maxResults" size="5" /></td>
            </tr>


            <tr>
                <td style="width:50%">Only generate triangle free graphs?</td>
                <td><input style="float: right; width:15px" type="checkbox"  value="true" name="triangleFree" /> </td>
            </tr>
            <tr>
                <td style="width:50%">Only generate connected graphs?</td>
                <td><input style="float: right; width:15px" type="checkbox"  value="true" name="allowDiscGraphs" id="allowDiscGraphs" /></td>
            </tr>
            <tr>
                <td style="width:50%">Only generate bipartite graphs?</td>
                <td ><input style="float: right; width:15px" type="checkbox" value="true" name="biptOnly" /></td>
            </tr>
        </table>
        <div class="clear"></div>
    </div>

    <div class="metade" style="height: 395px;">
        <div class="titulo">processing statistics (in graph order)</div>
        <table>
            <c:forEach var="experiment" items="${estatisticasPortal}">
            <tr  >
                <td style="width:70%">n = ${experiment.order}</td>
                <td>${experiment.average} minutes</td>
            </tr>
            </c:forEach>           
        </table>
        <div class="clear"></div>
    </div>	
    <div class="clear"></div>
    <table>
        <tr  >
            <td><input type="submit" class="submitJob" name="submitOK"  value="Submit Job"/></td>
            <td><input type="button" onclick="window.location.reload()" class="submitJob" name="refreshPage"  value="Clean"/></td>
        </tr>
    </table>       


</form>
<script>
    function checkOptions(funct) {

        $("#allowDiscGraphs").prop('checked', false);



        if (funct.indexOf("overline{\\alpha") > -1) {
            $("#allowDiscGraphs").prop('checked', true);
            funct = funct.replace('overline{\\alpha', '');
        }
        if (funct.indexOf("\\alpha") > -1) {
            $("#allowDiscGraphs").prop('checked', true);
            funct = funct.replace('\\alpha', '');
        }
        if (funct.indexOf("overline{\\rho") > -1) {
            $("#allowDiscGraphs").prop('checked', true);
            funct = funct.replace('overline{\\rho', '');
        }
        if (funct.indexOf("\\rho") > -1) {
            $("#allowDiscGraphs").prop('checked', true);
            funct = funct.replace('\\rho', '');
        }
        if (funct.indexOf("overline{\\gamma") > -1) {
            $("#allowDiscGraphs").prop('checked', true);
            funct = funct.replace('overline{\\gamma', '');
        }
        if (funct.indexOf("\\gamma") > -1) {
            $("#allowDiscGraphs").prop('checked', true);
            funct = funct.replace('\\gamma', '');
        }
        if (funct.indexOf("overline{E_D") > -1 || funct.indexOf("overline{E}_D") > -1) {
            $("#allowDiscGraphs").prop('checked', true);
            funct = funct.replace('overline{E_D', '');
        }
        if (funct.indexOf("E_D") > -1) {
            $("#allowDiscGraphs").prop('checked', true);
            funct = funct.replace('E_D', '');
        }   
        if (funct.indexOf("overline{LE_D") > -1 || funct.indexOf("overline{LE}_D") > -1) {
            $("#allowDiscGraphs").prop('checked', true);
            funct = funct.replace('overline{LE_D', '');
        }
        if (funct.indexOf("LE_D") > -1) {
            $("#allowDiscGraphs").prop('checked', true);
            funct = funct.replace('LE_D', '');
        }  
        if (funct.indexOf("overline{SLE_D") > -1 || funct.indexOf("overline{SLE}_D") > -1) {
            $("#allowDiscGraphs").prop('checked', true);
            funct = funct.replace('overline{SLE_D', '');
        }
        if (funct.indexOf("SLE_D") > -1) {
            $("#allowDiscGraphs").prop('checked', true);
            funct = funct.replace('SLE_D', '');
        }          

    }
    function showFunctionImage() {
        var uncoded = $("#wmd-input").val();
        checkOptions(uncoded);
        var theFunction = encodeURIComponent(uncoded);

        if (theFunction.length > 0) {
            $("#functionImage").attr("src", "getPreview?function=" + theFunction);
            $("#functionImage").css("display", "block");
        } else {
            $("#functionImage").css("display", "none");
        }
    }


    $(document).ready(function () {
        $("#adjacency").focus();


        $("#checks").children().bind('click', function () {
            return false;
        });

        $("#wmd-input").keyup(function (event) {
            showFunctionImage();
        });

        showFunctionImage();
    });
    function back() {
        window.location.href = "index";
    }


</script>				
<script type="text/javascript">
    togglemathjax = function (enabled) {
        if (enabled) {
            if (!latexenabledonce)
            {
                MathJax.Hub.Config(
                        {"HTML-CSS": {preferredFont: "TeX", availableFonts: ["STIX", "TeX"], linebreaks: {automatic: true}, EqnChunk: (MathJax.Hub.Browser.isMobile ? 10 : 50)},
                            tex2jax: {inlineMath: [["$", "$"], ["\\\\(", "\\\\)"]], displayMath: [["$$", "$$"], ["\\[", "\\]"]], processEscapes: true, ignoreClass: "tex2jax_ignore|dno"},
                            TeX: {noUndefined: {attributes: {mathcolor: "red", mathbackground: "#FFEEEE", mathsize: "90%"}}, Macros: {href: "{}"}},
                            messageStyle: "none", skipStartupTypeset: true});
                mjpd1.mathjaxEditing.prepareWmdForMathJax(editor, '', [["$", "$"]]);
                latexenabledonce = true;
                if (editor.refreshPreview !== undefined)
                    editor.refreshPreview();
            } else {
                MathJax.Hub.queue.pending = 0;
                MathJax.Hub.Queue(["Typeset", MathJax.Hub, "wmd-preview"]);
            }
        } else {
            MathJax.Hub.queue.pending = 1;
            if (editor.refreshPreview !== undefined)
                editor.refreshPreview();
            else {
                MathJax.Hub.Config({skipStartupTypeset: true});
            }
        }
    }

    var mode = 0;
    var latexenabledonce = false;
    var latexenabled = localStorage.getItem("latex") !== "0";
    var converter = Markdown.getSanitizingConverter();
    Markdown.Extra.init(converter);
    var editor = new Markdown.Editor(converter, '');
    var mjpd1 = new mjpd();
    togglemathjax(latexenabled);
    editor.run();
</script>
<jsp:include page = "footer.jsp" />