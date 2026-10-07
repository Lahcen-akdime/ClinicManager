package org.clinicmanager.clinicmanager.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.clinicmanager.clinicmanager.Model.User;
import org.clinicmanager.clinicmanager.Security.SessionKeys;
import org.clinicmanager.clinicmanager.Security.SessionUser;

import javax.security.sasl.AuthenticationException;
import java.io.IOException;
@WebFilter({"/admin/*","/doctor/*","/patient/*"})
public class AuthenticationFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest servletRequest = (HttpServletRequest) request ;
        HttpServletResponse servletResponse = (HttpServletResponse) response ;
        HttpSession session = servletRequest.getSession(false) ;
        SessionUser user = null ;
        if (session != null ){
            user = (SessionUser) session.getAttribute(SessionKeys.USER) ;
        }
        if(user != null ){
         chain.doFilter(servletRequest,servletResponse);
         return;
        } else servletResponse.sendRedirect(servletRequest.getContextPath()+"/login");
        return;
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
