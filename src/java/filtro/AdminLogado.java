// 
// Decompiled by Procyon v0.5.36
// 

package filtro;

import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import java.io.IOException;
import javax.servlet.http.HttpSession;
import entidades.Usuario;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.FilterChain;
import javax.servlet.ServletResponse;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebFilter;
import javax.servlet.Filter;

@WebFilter(filterName = "AdminLogado", urlPatterns = { "/*" })
public class AdminLogado implements Filter
{
    private String contextPath;
    
    @Override
    public void doFilter(final ServletRequest request, final ServletResponse response, final FilterChain chain) throws IOException, ServletException {
        final HttpServletResponse res = (HttpServletResponse)response;
        final HttpServletRequest req = (HttpServletRequest)request;
        final HttpSession session = req.getSession();
        final Usuario u = (Usuario)session.getAttribute("adminLogado");
        if (u == null) {
            session.invalidate();
            res.sendRedirect(this.contextPath + "/login.jsp");
        }
        else {
            res.setHeader("Cache-control", "no-cache, no-store");
            res.setHeader("Pragma", "no-cache");
            res.setHeader("Expires", "-1");
            chain.doFilter(request, response);
        }
    }
    
    @Override
    public void destroy() {
    }
    
    @Override
    public void init(final FilterConfig filterConfig) {
        this.contextPath = filterConfig.getServletContext().getContextPath();
    }
}
