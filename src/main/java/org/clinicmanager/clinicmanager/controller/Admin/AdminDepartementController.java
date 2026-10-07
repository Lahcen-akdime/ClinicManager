package org.clinicmanager.clinicmanager.controller.Admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.clinicmanager.clinicmanager.Model.Departement;
import org.clinicmanager.clinicmanager.service.DepartmentService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "admin/departement" ,value = "/admin/departements")
public class AdminDepartementController extends HttpServlet {

    private static DepartmentService departmentService = new DepartmentService() ;

    public void doGet(HttpServletRequest request , HttpServletResponse response)throws IOException, ServletException {
        List<Departement> departements = departmentService.getAll() ;
        request.setAttribute("departments",departements);
        request.getRequestDispatcher("/admin/Departements.jsp").forward(request,response); ;
    }

    public void doPost(HttpServletRequest request , HttpServletResponse response)throws IOException{
        String name = request.getParameter("name") ;
        String description = request.getParameter("descreption") ;
        departmentService.save(name,description) ;
        response.sendRedirect(request.getContextPath()+"/admin/departements");
    }

}
