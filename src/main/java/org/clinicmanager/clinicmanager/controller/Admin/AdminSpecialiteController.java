package org.clinicmanager.clinicmanager.controller.Admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.clinicmanager.clinicmanager.Model.Departement;
import org.clinicmanager.clinicmanager.Model.Specialite;
import org.clinicmanager.clinicmanager.service.DepartmentService;
import org.clinicmanager.clinicmanager.service.SpecialtyService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "admin/Specialities",value = "/admin/Specialities")
public class AdminSpecialiteController extends HttpServlet {

    private SpecialtyService specialtyService = new SpecialtyService() ;
    private DepartmentService departmentService = new DepartmentService() ;


    public void doGet(HttpServletRequest request , HttpServletResponse response)throws IOException, ServletException {
        List<Specialite> specialites = specialtyService.getAll() ;
        List<Departement> departements = departmentService.getAll() ;
        request.setAttribute("specialites",specialites);
        request.setAttribute("departements",departements);
        request.getRequestDispatcher("/admin/Specialites.jsp").forward(request,response);
    }

    public void doPost(HttpServletRequest request , HttpServletResponse response)throws IOException{
        String name = request.getParameter("name") ;
        Long departementId = Long.valueOf(request.getParameter("departementId"));
        Departement departement = departmentService.findById(departementId) ;
        System.out.println(departement.getId());
        specialtyService.save(name,departement);
        response.sendRedirect(request.getContextPath()+"/admin/Specialities");
    }
}
