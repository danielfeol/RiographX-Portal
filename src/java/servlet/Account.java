package servlet;

import dao.UsuarioDAO;
import static dao.UsuarioDAO.md5Spring;
import entidades.Usuario;
import java.io.IOException;
import java.time.LocalDateTime;
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

@WebServlet(name = "Account", urlPatterns = { "/account.jsp" })
public class Account extends HttpServlet
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
        if (request.getParameter("accountOK") != null) {
            final String name = request.getParameter("name");
            final String email = request.getParameter("email");
            final String pass1 = request.getParameter("senha1");
            final String pass2 = request.getParameter("senha2");
            if (name == null || name.isEmpty()) {
                erros.add("Username missing!");
            }
            if (email == null || email.isEmpty()) {
                erros.add("E-mail missing!");
            }
//            else if (!isValidEmailAddress(email)) {
//                erros.add("E-mail format is not correct!");
//            }         
            if (pass1 == null || pass1.isEmpty() || pass2 == null || pass2.isEmpty()) {
                erros.add("Password missing!");
            }else if (pass1.length()< 8) {
                erros.add("Password must contain at least 8 characters!");
            }else if (pass1.compareTo(pass2) != 0) {
                erros.add("Passwords are different!");
            }
            
            if (!erros.isExisteErros()) {
                final UsuarioDAO dao = new UsuarioDAO();
                final Usuario user = dao.getSingle(email);
                if (user == null) {
                        Usuario new_user = new Usuario();
                        new_user.setNome(name);
                        new_user.setLogin(email);
                        new_user.setToken(md5Spring(email+LocalDateTime.now()));
                        final String senhaCripto = new_user.setSenhaWeb(pass1);
                        new_user.setSenha(senhaCripto);
                        dao.create(new_user);
                String content = "Click on link to activate your account http://antares.eic.cefet-rj.br:8888/PortalRioGraphx/validation.jsp?pass=" + new_user.getToken();
                String resultMessage = "";
                try {
                    EmailUtility.sendEmail(host, port, mailuser, pass, email, "Account validation on Portal Riographx",
                    content);
                    resultMessage = "The e-mail was sent successfully";
                } catch (Exception ex) {
                    ex.printStackTrace();
                    resultMessage = "There were an error: " + ex.getMessage();
                }
                erros.add("Congratulations! Your account was successfully created.");
                erros.add("An account activation link has been sent to your email.");
                }
                else {
                    erros.add("User already exists!");
                }
            }
        }
        request.getSession().invalidate();
        request.setAttribute("mensagens", (Object)erros);
        final String URL = "/WEB-INF/view/account.jsp";
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
//    public static boolean isValidEmailAddress(String email) {
//    boolean result = true;
//    try {
//        InternetAddress emailAddr = new InternetAddress(email);
//        emailAddr.validate();
//    } catch (AddressException ex) {
//        result = false;
//    }
//    return result;
//}
}