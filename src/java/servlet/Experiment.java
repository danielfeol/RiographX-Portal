package servlet;

import dao.SubmitDAO;
import entidades.Submit;
import entidades.Usuario;
import java.io.IOException;
import static java.lang.Boolean.parseBoolean;
import static java.lang.Integer.parseInt;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.Erro;

@WebServlet(name = "Experiment", urlPatterns = { "/submitAnExperiment.jsp" })
public class Experiment extends HttpServlet
{
    protected void processRequest(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
        
        final Erro erros = new Erro();
        
        final HttpServletRequest req = (HttpServletRequest)request;
        final HttpSession session = req.getSession();
        final Usuario user = (Usuario)session.getAttribute("usuarioLogado");

        if (request.getParameter("submitOK") != null) {
            final String name = request.getParameter("name");
            final String function = request.getParameter("function");
            final String min_max_order = request.getParameter("min_max_order");            
            final String ordermin = request.getParameter("ordermin");
            final String ordermax = request.getParameter("ordermax");
            final String mindegree = request.getParameter("minDegree");
            final String maxdegree = request.getParameter("maxDegree");
            final String maxresults = request.getParameter("maxResults");
            final String triangle_free = request.getParameter("triangleFree");
            final String connected = request.getParameter("allowDiscGraphs");
            final String bipartite = request.getParameter("biptOnly");
            final String adjacency1 = request.getParameter("adjacency1");
            final String laplacian = request.getParameter("laplacian");
            final String slaplacian = request.getParameter("slaplacian");
            final String adjacencyB = request.getParameter("adjacencyB");
            final String laplacianB = request.getParameter("laplacianB");
            final String slaplacianB = request.getParameter("slaplacianB");
            final String chromatic = request.getParameter("chromatic");
            final String chromaticB = request.getParameter("chromaticB");
            final String click = request.getParameter("click");
            final String clickB = request.getParameter("clickB");
            final String largestDegree = request.getParameter("largestDegree");
//            final String numEdxges = request.getParameter("numEdxges");
            if (name == null || name.isEmpty()) {
                erros.add("You must provide an Submission name!");
            }
            if (function == null || function.isEmpty()) {
                erros.add("You must provide an Optimization Function!");
            }
            if (ordermin == null || ordermin.isEmpty()) {
                erros.add("You must provide the Minimun Order value!");
            }else if (ordermax == null || ordermax.isEmpty()) {
                erros.add("You must provide the Maximun Order value!");
            }else if (parseInt(ordermin) > parseInt(ordermax)) {
                erros.add("The Minimun Order value must be less than Maximun Order!");
            }
            
            if (mindegree == null || mindegree.isEmpty()) {
                erros.add("You must provide the Minimun Degree value!");
            }else if (maxdegree == null || maxdegree.isEmpty()) {
                erros.add("You must provide the Maximum Degree value!");
            }else if (parseInt(mindegree) > parseInt(maxdegree)) {
                erros.add("The Minimun Degree value must be less than Maximun Degree!");
            }
            if (maxresults == null || maxresults.isEmpty()) {
                erros.add("You must provide the Maximum Results value!");
            }
            if (!erros.isExisteErros()) {
                Submit su = new Submit();
                su.setName(name);
                su.setFunction(function);
                su.setMin_max(parseBoolean(min_max_order));
                su.setMin_order(parseInt(ordermin));
                su.setMax_order(parseInt(ordermax));
                su.setMin_degree(parseInt(mindegree));
                su.setMax_degree(parseInt(maxdegree));
                su.setMax_results(parseInt(maxresults));
                su.setTriang_free(parseBoolean(triangle_free));
                su.setConnected(parseBoolean(connected));
                su.setBipartite(parseBoolean(bipartite));
                su.setLambda(parseBoolean(adjacency1));
                su.setMu(parseBoolean(laplacian));
                su.setQ(parseBoolean(slaplacian));
                su.setOv_lambda(parseBoolean(adjacencyB));
                su.setOv_mu(parseBoolean(laplacianB));
                su.setOv_q(parseBoolean(slaplacianB));
                su.setChi(parseBoolean(chromatic));
                su.setOv_chi(parseBoolean(chromaticB));
                su.setOmega(parseBoolean(click));
                su.setOv_omega(parseBoolean(clickB));
                su.setLarg_deg(parseBoolean(largestDegree));
    //            su.setEdges(parseInt(numEdxges));
                su.setUser(user.getCodigo());
                final SubmitDAO dao = new SubmitDAO();
                final Submit submit = dao.save(su);
                response.sendRedirect("results.jsp");
                return;
            }
        }
        request.setAttribute("mensagens", (Object)erros);
        final String URL = "/WEB-INF/view/submitAnExperiment.jsp";
        final RequestDispatcher rd = request.getRequestDispatcher(URL);
        rd.forward((ServletRequest)request, (ServletResponse)response);
    }
    
    protected void doGet(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
        this.processRequest(request, response);
    }
    
    protected void doPost(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
        this.processRequest(request, response);
    }
    
    public String getServletInfo() {
        return "Short description";
    }
}