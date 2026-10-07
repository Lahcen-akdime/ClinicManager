package org.clinicmanager.clinicmanager.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.clinicmanager.clinicmanager.Security.SessionKeys;
import org.clinicmanager.clinicmanager.Security.SessionUser;

import java.io.IOException;

@WebFilter({"/admin/*","/patient/*","/doctor/*"})
public class RoleFilter implements Filter {
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
        if(session != null){
            user = (SessionUser) session.getAttribute(SessionKeys.USER) ;
        }
        if (user != null && servletRequest.getServletPath().startsWith("/"+user.getRole().name().toLowerCase())){
            chain.doFilter(servletRequest,servletResponse);
        } else servletResponse.sendError(403,"You cant access this page");
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
