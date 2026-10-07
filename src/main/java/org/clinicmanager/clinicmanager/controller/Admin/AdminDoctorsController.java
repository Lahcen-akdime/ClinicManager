package org.clinicmanager.clinicmanager.controller.Admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.clinicmanager.clinicmanager.Model.Doctor;
import org.clinicmanager.clinicmanager.Model.Patient;
import org.clinicmanager.clinicmanager.Strategy.DesactivateStrategy;
import org.clinicmanager.clinicmanager.Strategy.IdesactivateStrategie;
import org.clinicmanager.clinicmanager.dto.PatientDto;
import org.clinicmanager.clinicmanager.service.DoctorService;
import org.clinicmanager.clinicmanager.service.PatientService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "admin/Doctors",value = "/admin/Doctors")
public class AdminDoctorsController extends HttpServlet {

    private static DesactivateStrategy desactivateStrategy = new DesactivateStrategy() ;
    private static DoctorService doctorService = new DoctorService() ;

    public void doGet(HttpServletRequest request , HttpServletResponse response)throws IOException, ServletException {
        //List<PatientDto> patients = doctorService.getAllPatients() ;
        //request.setAttribute("patients",patients);
        request.getRequestDispatcher("/admin/Doctors.jsp").forward(request,response);
    }

    public void doPost(HttpServletRequest request , HttpServletResponse response){
        String id = request.getParameter("id") ;
        //Doctor doctor = doctorService.findById(Long.decode(id)) ;
        //IdesactivateStrategie idesactivateStrategie = desactivateStrategy.doStrategy("doctor") ;
        //idesactivateStrategie.changeStatus((Object) doctor , doctor.getUser().getActive());
    }

}
