package servlet;

import dao.UsuarioDAO;
import static dao.UsuarioDAO.md5Spring;
import entidades.Usuario;
import java.io.IOException;
import java.time.LocalDateTime;
import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.EmailUtility;
import util.Erro;



@WebServlet(name = "Reset", urlPatterns = { "/reset.jsp"})
public class Reset extends HttpServlet
{
    private String host;
    private String port;
    private String mailuser;
    private String pass;
    
    public void init() {
        // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        mailuser = context.getInitParameter("user");
        pass = context.getInitParameter("pass");
    }    
    protected void processRequest(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
        final Erro erros = new Erro();
        if (request.getParameter("bOK") != null) {
            final String login = request.getParameter("login");
            if (login == null || login.isEmpty()) {
                erros.add("E-mail is missing!");
            }
            if (!erros.isExisteErros()) {
                final UsuarioDAO dao = new UsuarioDAO();
                final Usuario user = dao.getSingle(login);
                if (user != null) {
                user.setToken(md5Spring(login+LocalDateTime.now()));
                dao.updateToken(user);
                String content = "Click on link to change your account password http://antares.eic.cefet-rj.br:8888/PortalRioGraphx/setpass.jsp?pass=" + user.getToken();
                String resultMessage;
                try {
                    EmailUtility.sendEmail(host, port, mailuser, pass, login, "Password reset on Portal Riographx",
                    content);
                    resultMessage = "The e-mail was sent successfully";
                } catch (MessagingException ex) {
                    resultMessage = "There were an error: " + ex.getMessage();
                }
                System.out.println(resultMessage);
                erros.add("A password reset link has been sent to your email.");
                        request.setAttribute("mensagens", (Object)erros);
                        final String URL = "/WEB-INF/view/login.jsp";
                        final RequestDispatcher rd = request.getRequestDispatcher(URL);
                        rd.forward((ServletRequest)request, (ServletResponse)response);
                }
                else{
                    erros.add("Sorry, this account does not exist.");       
                }
            }
        }
        request.getSession().invalidate();
        request.setAttribute("mensagens", (Object)erros);
        final String URL = "/WEB-INF/view/reset.jsp";
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