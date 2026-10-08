package org.clinicmanager.clinicmanager.controller.Admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.clinicmanager.clinicmanager.Model.Patient;
import org.clinicmanager.clinicmanager.dto.PatientDto;
import org.clinicmanager.clinicmanager.service.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "admin/Dashboard",value = "/admin/Dashboard")
public class AdminController extends HttpServlet {

    private PatientService patientService = new PatientService() ;
    private DepartmentService departmentService = new DepartmentService() ;
    private SpecialtyService specialtyService = new SpecialtyService() ;
    private DoctorService doctorService = new DoctorService() ;
    private AuthService authService = new AuthService() ;


    public void doGet(HttpServletRequest request , HttpServletResponse response)throws ServletException, IOException {
        HttpSession session = request.getSession(false) ;
        Long totalPatients = patientService.getAllPatients().stream().count() ;
        Long totalDoctors = doctorService.getAll().get().stream().count();
        Long totalSpecialities = specialtyService.getAll().stream().count() ;
        Long totalDepartments = departmentService.getAll().stream().count() ;
        Long totalUsers = authService.getAll().stream().count() ;
        request.setAttribute("totalPatients",totalPatients);
        request.setAttribute("totalDoctors",totalDoctors);
        request.setAttribute("totalSpecialities",totalSpecialities);
        request.setAttribute("totalDepartments",totalDepartments);
        request.setAttribute("totalUsers",totalUsers);
        request.getRequestDispatcher("/admin/Dashboard.jsp").forward(request,response);
    }

}
