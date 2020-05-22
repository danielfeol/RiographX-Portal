package servlet;

import entidades.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet(name = "Reports", urlPatterns = { "/reports.jsp" })
public class Reports extends HttpServlet {

    protected void processRequest(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {

    }
    
    protected void doGet(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
        this.processRequest(request, response);
                
        final Erro erros = new Erro();
        
        final HttpServletRequest req = (HttpServletRequest)request;
        final HttpSession session = req.getSession();
        final Usuario user = (Usuario)session.getAttribute("usuarioLogado");


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
        final String URL = "/WEB-INF/view/results.jsp";
        final RequestDispatcher rd = request.getRequestDispatcher(URL);
        rd.forward((ServletRequest)request, (ServletResponse)response);
    }
    
    protected void doPost(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
        this.processRequest(request, response);
    }
    
    public String getServletInfo() {
        return "Short description";
    }
}