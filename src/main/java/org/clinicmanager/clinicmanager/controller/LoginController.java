package org.clinicmanager.clinicmanager.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.clinicmanager.clinicmanager.Model.User;
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
        request.getRequestDispatcher(user.getUserRole().name().toLowerCase()+
                "/Dashboard.jsp").forward(request,response) ;
    }
}
