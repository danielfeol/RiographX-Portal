package servlet;

import dao.UsuarioDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.Erro;


@WebServlet(name = "Validation", urlPatterns = { "/validation.jsp" })
public class Validation extends HttpServlet
{
    protected void processRequest(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
        final Erro erros = new Erro();
        erros.add("Validating your account...");
        String token = request.getParameter("pass");
        if (token !=null){
        
        if(UsuarioDAO.activate(token) > 0){
            erros.add("Account activated.");
        }else{
            erros.add("Account not found.");
        }
        }else{erros.add("Invalid link.");}
        
    request.setAttribute("mensagens", (Object)erros);
    final String URL = "/WEB-INF/view/validation.jsp";
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