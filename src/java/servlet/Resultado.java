package servlet;

import dao.ResultsDAO;
import entidades.Results;
import entidades.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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


@WebServlet(name = "Resultado", urlPatterns = { "/results.jsp" })
public class Resultado extends HttpServlet
{   private String contextPath;
    protected void processRequest(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
        final HttpServletResponse res = (HttpServletResponse)response;
        final HttpServletRequest req = (HttpServletRequest)request;
        final HttpSession session = req.getSession();
        final Usuario user = (Usuario)session.getAttribute("usuarioLogado");
        if (user == null) {
        session.invalidate();
        res.sendRedirect(this.contextPath + "/login.jsp");
        }
                String result = request.getParameter("result");
            if (result != null){
                int id_result = Integer.valueOf(result);
            final ResultsDAO dao = new ResultsDAO();
            try {
                dao.eraseResult(id_result);
            } catch (SQLException ex) {
                Logger.getLogger(Resultado.class.getName()).log(Level.SEVERE, null, ex);
            }
            }
        final ResultsDAO dao = new ResultsDAO();
        final List<Results> resultados = dao.getResults(user);
        request.setAttribute("resultadosUsuario", resultados);
        final String URL = "/WEB-INF/view/results.jsp";
        final RequestDispatcher rd = request.getRequestDispatcher(URL);
        rd.forward((ServletRequest)request, (ServletResponse)response);        
    }
    
    protected void doGet(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
        this.processRequest(request, response);
final Erro erros = new Erro();
        
        final HttpServletRequest req = (HttpServletRequest)request;
        final HttpSession session = req.getSession();
        final Usuario user = (Usuario)session.getAttribute("usuarioLogado");

        if (user != null) {
        String filename = request.getParameter("filename");
            if (request.getParameter("filename") != null) {
		PrintWriter out = response.getWriter();
		  String filepath = "/opt/spark-data/reports/"; 
		  response.setContentType("application/pdf");
		  response.setHeader("Content-Disposition","attachment; filename="+filename); 
		  java.io.FileInputStream fileInputStream = new java.io.FileInputStream(filepath + filename);
		  
		  int i; 
		  while ((i=fileInputStream.read()) != -1) {
		    out.write(i); 
		  } 
		  fileInputStream.close(); 
		  out.close(); 
            }
        }
//        final String URL = "/WEB-INF/view/results.jsp";
//        final RequestDispatcher rd = request.getRequestDispatcher(URL);
//        rd.forward((ServletRequest)request, (ServletResponse)response);        
    }
    
    protected void doPost(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
        this.processRequest(request, response);
        
        final Erro erros = new Erro();
        
        final HttpServletRequest req = (HttpServletRequest)request;
        final HttpSession session = req.getSession();
        final Usuario user = (Usuario)session.getAttribute("usuarioLogado");
        
        if (user != null) {

        }
//        
        response.setHeader("Refresh", "0");
        final String URL = "/WEB-INF/view/results.jsp";
        final RequestDispatcher rd = request.getRequestDispatcher(URL);
        rd.forward((ServletRequest)request, (ServletResponse)response);        
    }
    
    public String getServletInfo() {
        return "Short description";
    }
}