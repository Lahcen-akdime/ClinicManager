package org.clinicmanager.clinicmanager.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.clinicmanager.clinicmanager.Enum.Role;
import org.clinicmanager.clinicmanager.Model.User;
import org.clinicmanager.clinicmanager.Security.SessionKeys;
import org.clinicmanager.clinicmanager.Security.SessionUser;
import org.clinicmanager.clinicmanager.service.AuthService;

import java.io.IOException;
import java.rmi.ServerException;

@WebServlet(name = "login",value = "/login")
public class LoginController extends HttpServlet {
    private static AuthService authService = new AuthService() ;

    public void doGet(HttpServletRequest request , HttpServletResponse response)throws IOException , ServletException {
        request.getRequestDispatcher("auth/Login.jsp").forward(request,response);
    }

    public void doPost(HttpServletRequest request , HttpServletResponse response)throws IOException,ServletException{
        User user = authService.login(request) ;
        if (!user.getActive()){
            request.setAttribute("message","your acount is desactivated");
            request.getRequestDispatcher("auth/Login.jsp").forward(request,response);
            return;
        }
        HttpSession session = request.getSession() ;
        SessionUser sessionUser = new SessionUser(user.getId(), user.getName(), user.getEmail() , user.getUserRole()) ;
        session.setAttribute(SessionKeys.USER,sessionUser);
        request.changeSessionId() ;
        if (user.getUserRole().equals(Role.ADMIN)){
            response.sendRedirect(request.getContextPath()+"/admin/Dashboard");
            return;
        }
        request.getRequestDispatcher(user.getUserRole().name().toLowerCase()+
                "/Dashboard.jsp").forward(request,response) ;
    }
}
