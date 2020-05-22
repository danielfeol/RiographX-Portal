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
    <div class="metade" style="height: 679px;">				
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
                <td>Minimum order <select style="width:40px; float: right;" type="text" name="ordermin" id="ordermin" size="1" /><option value=""><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option></select></td>
            <td>Maximum order <select style="width:40px; float: right;" type="text" name="ordermax" id="ordermax" size="1" /><option value=""><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option></select></td>
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
                <td><input style="float: right; width:15px" type="checkbox"  value="true" name="allowDiscGraphs" /></td>
            </tr>
            <tr>
                <td style="width:50%">Only generate bipartite graphs?</td>
                <td ><input style="float: right; width:15px" type="checkbox" value="true" name="biptOnly" /></td>
            </tr>
        </table>
        <div class="clear"></div>
    </div>

    <div class="metade" style="float: right;">
        <div class="titulo">Function Parameters</div>
        <table>
            <tr  >
                <td style="width:80%">Adjacency (&lambda;)</td>
                <td><input style="width:15px" type="checkbox" value="true"   name="adjacency1"  id="adjacency1" /></td>
            </tr>
            <tr  >
                <td >Laplacian (&mu;)</td>
                <td><input style="width:15px" type="checkbox" value="true"   name="laplacian" id="laplacian" /></td>
            </tr>
            <tr  >
                <td>Signless Laplacian (q)</td>
                <td><input style="width:15px" type="checkbox" value="true"   name="slaplacian" id="slaplacian" /></td>
            </tr>
            <tr  >
                <td>Distance (&rho;)</td>
                <td><input style="width:15px" type="checkbox" value="true"   name="distance" id="distance" /></td>
            </tr>            
            <tr  >
                <td>Laplacian Distance (&gamma;)</td>
                <td><input style="width:15px" type="checkbox" value="true"   name="distslaplacian" id="distslaplacian" /></td>
            </tr>            
            <tr  >
                <td>Signless Laplacian Distance (&alpha;)</td>
                <td><input style="width:15px" type="checkbox" value="true"   name="signdistslaplacian" id="signdistslaplacian" /></td>
            </tr>
            <tr  >
                <td >Adjacency of the Complement (<SPAN STYLE="text-decoration:overline">&lambda;</SPAN>)</td>
                <td><input style="width:15px" type="checkbox" value="true"   name="adjacencyB"  id="adjacencyB" /></td>
            </tr>
            <tr  >
                <td >Laplacian of the Complement (<SPAN STYLE="text-decoration:overline">&mu;</SPAN>)</td>
                <td><input style="width:15px" type="checkbox" value="true"   name="laplacianB" id="laplacianB" /></td>
            </tr>
            <tr  >
                <td>Signless Laplacian of the Complement (<SPAN STYLE="text-decoration:overline">q</SPAN>)</td>
                <td><input style="width:15px" type="checkbox" value="true"   name="slaplacianB" id="slaplacianB" /></td>
            </tr>
            <tr  >
                <td>Distance of the Complement (<SPAN STYLE="text-decoration:overline">&rho;</SPAN>)</td>
                <td><input style="width:15px" type="checkbox" value="true"   name="distanceB" id="distanceB" /></td>
            </tr>
            <tr  >
                <td>Laplacian Distance of the Complement (<SPAN STYLE="text-decoration:overline">&gamma;</SPAN>)</td>
                <td><input style="width:15px" type="checkbox" value="true"   name="distslaplacianB" id="distslaplacianB" /></td>
            </tr>            
            <tr  >
                <td>Signless Laplacian Distance of the Complement (<SPAN STYLE="text-decoration:overline">&alpha;</SPAN>)</td>
                <td><input style="width:15px" type="checkbox" value="true"   name="signdistslaplacianB" id="signdistslaplacianB" /></td>
            </tr>
            <tr  >
                <td >Chromatic number (&chi;)</td>
                <td><input style="width:15px" type="checkbox" value="true"   name="chromatic"  id="chromatic" /></td>
            </tr>
            <tr  >
                <td >Chromatic number of the Complement (<SPAN STYLE="text-decoration:overline">&chi;</SPAN>)</td>
                <td><input style="width:15px" type="checkbox" value="true"   name="chromaticB" id="chromaticB" /></td>
            </tr>
            <tr  >
                <td>Clique number (&omega;)</td>
                <td><input style="width:15px" type="checkbox" value="true"   name="click" id="click" /></td>
            </tr>
            <tr  >
                <td>Clique number of the Complement(<SPAN STYLE="text-decoration:overline">&omega;</SPAN>)</td>
                <td><input style="width:15px" type="checkbox" value="true"   name="clickB" id="clickB" /></td>
            </tr>
            <tr  >
                <td>Degree (d)</td>
                <td><input style="width:15px" type="checkbox" value="true"   name="largestDegree" id="largestDegree" /></td>
            </tr>
            <tr  >
                <td>
                    <!--                    Num of Edges.(M)-->
                </td>
                <td>
                    <input style="width:15px" type="checkbox" value="true"   name="numEdxges" id="numEdges" />
                </td>
            </tr>
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

        $("#adjacency1").prop('checked', false);
        $("#laplacian").prop('checked', false);
        $("#slaplacian").prop('checked', false);
        $("#distslaplacian").prop('checked', false);
        $("#adjacencyB").prop('checked', false);
        $("#laplacianB").prop('checked', false);
        $("#slaplacianB").prop('checked', false);
        $("#distslaplacianB").prop('checked', false);
        $("#chromatic").prop('checked', false);
        $("#chromaticB").prop('checked', false);
        $("#click").prop('checked', false);
        $("#clickB").prop('checked', false);
        $("#largestDegree").prop('checked', false);
        $("#numEdges").prop('checked', false);


        if (funct.indexOf("overline{\\omega") > -1) {
            $("#clickB").prop('checked', true);
            funct = funct.replace('overline{\\omega', '');
        }

        if (funct.indexOf("overline{\\lambda") > -1) {
            $("#adjacencyB").prop('checked', true);
            funct = funct.replace('overline{\\lambda', '');
        }

        if (funct.indexOf("overline{\\mu") > -1) {
            $("#laplacianB").prop('checked', true);
            funct = funct.replace('overline{\\mu', '');
        }

        if (funct.indexOf("overline{q_") > -1) {
            $("#slaplacianB").prop('checked', true);
            funct = funct.replace('overline{q_', '');
        }
        if (funct.indexOf("overline{\\alpha") > -1) {
            $("#signdistslaplacianB").prop('checked', true);
            funct = funct.replace('overline{\\alpha', '');
        }
        if (funct.indexOf("overline{\\gamma") > -1) {
            $("#distslaplacianB").prop('checked', true);
            funct = funct.replace('overline{\\gamma', '');
        }
        if (funct.indexOf("overline{\\rho") > -1) {
            $("#distanceB").prop('checked', true);
            funct = funct.replace('overline{\\rho', '');
        }        
        if (funct.indexOf("\\omega") > -1) {
            $("#click").prop('checked', true);
            funct = funct.replace('omega', '');
        }

        if (funct.indexOf("\\chi") > -1) {
            $("#chromatic").prop('checked', true);
            funct = funct.replace('chi', '');
        }

        if (funct.indexOf("overline{\\chi") > -1) {
            $("#chromaticB").prop('checked', true);
            funct = funct.replace('overline{\\chi', '');
        }

        if (funct.indexOf("\\lambda") > -1) {
            $("#adjacency1").prop('checked', true);
            funct = funct.replace('lambda', '');
        }

        if (funct.indexOf("\\mu") > -1) {
            $("#laplacian").prop('checked', true);
            funct = funct.replace('mu', '');
        }
        if (funct.indexOf("\\alpha") > -1) {
            $("#signdistslaplacian").prop('checked', true);
            funct = funct.replace('alpha', '');
        }
        if (funct.indexOf("\\gamma") > -1) {
            $("#distslaplacian").prop('checked', true);
            funct = funct.replace('gamma', '');
        }
        if (funct.indexOf("\\rho") > -1) {
            $("#distance").prop('checked', true);
            funct = funct.replace('rho', '');
        }        

        if (funct.indexOf("q_") > -1) {
            funct = funct + " ";
            $("#slaplacian").prop('checked', true);
            var indI = funct.indexOf("q_");
            if (indI > -1) {
                var indF = funct.indexOf(" ", indI);
                var sgnlap = funct.substring(indI, indF);
                //funct = funct.replace( sgnlap,'');
            }
        }

        if (funct.indexOf("d_") > -1) {
            funct = funct + " ";
            $("#largestDegree").prop('checked', true);
            var indI = funct.indexOf("d_");
            if (indI > -1) {
                var indF = funct.indexOf(" ", indI);
                var largdeg = funct.substring(indI, indF);
                //funct = funct.replace( largdeg,'');
            }
        }


        if (funct.indexOf("SIZE") > -1) {
            $("#numEdges").prop('checked', true);
            funct = funct.replace("SIZE", "");
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