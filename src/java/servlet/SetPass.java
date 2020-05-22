package servlet;

import dao.UsuarioDAO;
import static dao.UsuarioDAO.md5Spring;
import entidades.Usuario;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
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
import util.EmailUtility;
import util.Erro;


@WebServlet(name = "SetPass", urlPatterns = { "/setpass.jsp" })
public class SetPass extends HttpServlet
{
    protected void processRequest(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException, SQLException {
        String URL = "/WEB-INF/view/setpass.jsp";
        final Erro erros = new Erro();
        boolean tokenOK = false;
        String token = request.getParameter("pass");
        if(token !=null){
            String email = UsuarioDAO.checkLink(token);
            if(email != null){
                tokenOK = true;
                request.setAttribute("tokenLogin", email);
            }else{erros.add("Account not found.");}
        }else{erros.add("Invalid link.");}
        
        if (request.getParameter("resetOK") != null) {
            final String email = request.getParameter("email");
            final String pass1 = request.getParameter("senha1");
            final String pass2 = request.getParameter("senha2");
            if (email == null || email.isEmpty()) {
                erros.add("E-mail missing!");
            }       
            if (pass1 == null || pass1.isEmpty() || pass2 == null || pass2.isEmpty()) {
                erros.add("Password missing!");
            }else if (pass1.length()< 6) {
                erros.add("Password must contain at least 8 characters!");
            }else if (pass1.compareTo(pass2) != 0) {
                erros.add("Passwords are different!");
            }
            
            if (!erros.isExisteErros()) {
                final UsuarioDAO dao = new UsuarioDAO();
                final Usuario user = dao.getSingle(email);
                if (user != null) {
                        user.setToken(token);
                        final String senhaCripto = user.setSenhaWeb(pass1);
                        user.setSenha(senhaCripto);
                        if(dao.update(user)>0){
                            erros.add("Congratulations! Your password was successfully updated.");
                            URL = "/WEB-INF/view/login.jsp";
                        }else{
                            erros.add("Sorry! An unexpected error ocurred. Try again later.");
                        }
//                String content = "Click on link to activate your account http://antares.eic.cefet-rj.br:8888/PortalRioGraphx/validation.jsp?pass=" + new_user.getToken();
//                String resultMessage = "";
//                try {
//                    EmailUtility.sendEmail(host, port, mailuser, pass, email, "Account validation on Portal Riographx",
//                    content);
//                    resultMessage = "The e-mail was sent successfully";
//                } catch (Exception ex) {
//                    ex.printStackTrace();
//                    resultMessage = "There were an error: " + ex.getMessage();
//                }
                }
                else {
                    erros.add("User already exists!");
                }
            }
        }
        request.setAttribute("pass", token); 
        request.setAttribute("tokenUsuario", tokenOK);       
        request.setAttribute("tokenUsuario", tokenOK);   
        request.setAttribute("mensagens", (Object)erros);
        final RequestDispatcher rd = request.getRequestDispatcher(URL);
        rd.forward((ServletRequest)request, (ServletResponse)response);
    }
    
    protected void doGet(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
        try {
            this.processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SetPass.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    protected void doPost(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
        try {
            this.processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SetPass.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public String getServletInfo() {
        return "Short description";
    }
}