package org.clinicmanager.clinicmanager.controller.Admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.clinicmanager.clinicmanager.Model.Patient;
import org.clinicmanager.clinicmanager.Strategy.DesactivateStrategy;
import org.clinicmanager.clinicmanager.Strategy.IdesactivateStrategie;
import org.clinicmanager.clinicmanager.dto.PatientDto;
import org.clinicmanager.clinicmanager.service.PatientService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "admin/Patients",value = "/admin/Patients")
public class AdminPatientsController extends HttpServlet {

    private static DesactivateStrategy desactivateStrategy = new DesactivateStrategy() ;
    private static PatientService patientService = new PatientService() ;

    public void doGet(HttpServletRequest request , HttpServletResponse response)throws IOException, ServletException {
        List<PatientDto> patients = patientService.getAllPatients() ;
        request.setAttribute("patients",patients);
        request.getRequestDispatcher("/admin/Patients.jsp").forward(request,response);
    }

    public void doPost(HttpServletRequest request , HttpServletResponse response)throws IOException{
        String id = request.getParameter("id") ;
        Patient patient = patientService.findById(Long.decode(id)) ;
        IdesactivateStrategie idesactivateStrategie = desactivateStrategy.doStrategy("patient") ;
        idesactivateStrategie.changeStatus((Object) patient , patient.getUser().getActive());
        response.sendRedirect(request.getContextPath()+"/admin/Patients");
    }

}
