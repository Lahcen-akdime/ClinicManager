package org.clinicmanager.clinicmanager.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.clinicmanager.clinicmanager.Enum.Role;
import org.clinicmanager.clinicmanager.Model.User;
import org.clinicmanager.clinicmanager.service.AuthService;

import java.io.FileNotFoundException;
import java.io.IOException;

@WebServlet(name = "register",value = "/register")
public class RgisterController extends HttpServlet {

    private String message;
    private AuthService authService = new AuthService() ;

    public void init() {
        message = "register page!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException , ServletException , FileNotFoundException {
        request.getRequestDispatcher("auth/register.jsp").forward(request,response);
    }

    public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
        User user = authService.register(request) ;
        HttpSession session = request.getSession() ;
        session.setAttribute("email",request.getParameter("email"));
        request.getRequestDispatcher(user.getUserRole().name().toLowerCase()+
                                    "/Dashboard.jsp").forward(request,response) ;
    }

    public void destroy() {

    }

}
