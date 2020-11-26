package servlet;

import dao.UsuarioDAO;
import entidades.Usuario;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@WebServlet(name = "Admin", urlPatterns = { "/admin.jsp" })
public class Admin extends HttpServlet
{
    protected void processRequest(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
        final String URL = "/WEB-INF/view/admin.jsp";
        
        final UsuarioDAO dao = new UsuarioDAO();
        final List<Usuario> usuarios = dao.getList();
        request.setAttribute("listaUsuario", usuarios);
        
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