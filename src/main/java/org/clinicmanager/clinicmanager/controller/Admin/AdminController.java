package org.clinicmanager.clinicmanager.controller.Admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "admin/Dashboard",value = "/admin/Dashboard")
public class AdminController extends HttpServlet {

    public void doGet(HttpServletRequest request , HttpServletResponse response)throws ServletException, IOException {
        //PrintWriter out = response.getWriter() ;
        HttpSession session = request.getSession(false) ;
        //out.println("this work secussfuly ! ");
        //out.println("Session : "+session.getAttribute("email"));
        request.getRequestDispatcher("/admin/Dashboard.jsp").forward(request,response);
    }
}
