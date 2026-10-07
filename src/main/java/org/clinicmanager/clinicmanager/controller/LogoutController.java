package org.clinicmanager.clinicmanager.controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.clinicmanager.clinicmanager.Security.SessionKeys;

import java.io.IOException;
import java.rmi.ServerException;

@WebServlet(name = "logout" , value = "/logout")
public class LogoutController extends HttpServlet  {

    public void doPost(HttpServletRequest request , HttpServletResponse response)throws IOException , ServerException {
        HttpSession session = request.getSession(false) ;
        session.invalidate();
        response.sendRedirect(request.getContextPath()+"/login");
    }
}
