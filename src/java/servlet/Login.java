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
import util.Erro;



@WebServlet(name = "Login", urlPatterns = { "/login.jsp", "/logout.jsp" })
public class Login extends HttpServlet
{
    protected void processRequest(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
        final Erro erros = new Erro();
        if (request.getParameter("bOK") != null) {
            final String login = request.getParameter("login");
            final String senha = request.getParameter("senha");
            if (login == null || login.isEmpty()) {
                erros.add("User missing!");
            }
            if (senha == null || senha.isEmpty()) {
                erros.add("Password missing!");
            }
            if (!erros.isExisteErros()) {
                final UsuarioDAO dao = new UsuarioDAO();
                final Usuario user = dao.getSingle(login);
                if (user != null) {
                    final String senhaCripto = user.setSenhaWeb(senha);
                    if (user.getSenha().equalsIgnoreCase(senhaCripto)) {
                        request.getSession().setAttribute("usuarioLogado", user);
                        response.sendRedirect("results.jsp");
                        return;
                    }
                    erros.add("User/Password incorrect!");
                }
                else {
                    erros.add("User not found or not active!");
                }
            }
        }
        request.getSession().invalidate();
        request.setAttribute("mensagens", (Object)erros);
        final String URL = "/WEB-INF/view/login.jsp";
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