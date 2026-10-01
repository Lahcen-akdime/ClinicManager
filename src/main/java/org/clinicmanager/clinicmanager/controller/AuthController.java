package org.clinicmanager.clinicmanager.controller;

import jakarta.persistence.Enumerated;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.clinicmanager.clinicmanager.Enum.Role;
import org.clinicmanager.clinicmanager.Model.User;
import org.clinicmanager.clinicmanager.service.AuthService;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

@WebServlet(name = "register",value = "/register")
public class AuthController extends HttpServlet {

    private String message;
    private AuthService authService = new AuthService() ;

    public void init() {
        message = "register page!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException , ServletException , FileNotFoundException {
        request.getRequestDispatcher("auth/register.jsp").forward(request,response);
    }

    public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
        String name = request.getParameter("name") ;
        String last_name = request.getParameter("lastName") ;
        String email = request.getParameter("email") ;
        String password = request.getParameter("password") ;
        String user_role = request.getParameter("role") ;
        User user = authService.register(name,last_name,email,password, Role.valueOf(user_role.toUpperCase())) ;
        response.setContentType("text/html");
        //PrintWriter out = response.getWriter() ;
        request.setAttribute("id",user.getId());
        request.setAttribute("name",user.getName());
        request.setAttribute("email",user.getEmail());
        if(user_role.toUpperCase().equals("DOCTOR")){
            saveDoctor(request,response);
        }else if (user_role.toUpperCase().equals("PATIENT")) {
            savePatient(request,response);
        }
    }

    public void destroy() {

    }

    public void saveDoctor(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
        request.getRequestDispatcher("doctor/Dashboard.jsp").forward(request,response) ;
    }

    public void savePatient(HttpServletRequest request , HttpServletResponse response)throws IOException,ServletException{
        request.getRequestDispatcher("patient/Dashboard.jsp").forward(request,response) ;
    }

}
