package org.clinicmanager.clinicmanager.service;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.clinicmanager.clinicmanager.Enum.Genre;
import org.clinicmanager.clinicmanager.Enum.GroupSuinguin;
import org.clinicmanager.clinicmanager.Enum.Role;
import org.clinicmanager.clinicmanager.Model.Doctor;
import org.clinicmanager.clinicmanager.Model.Patient;
import org.clinicmanager.clinicmanager.Model.Specialite;
import org.clinicmanager.clinicmanager.Model.User;
import org.clinicmanager.clinicmanager.exception.EmailAlreadyExistException;
import org.clinicmanager.clinicmanager.exception.EmailNotExistException;
import org.clinicmanager.clinicmanager.exception.PasswordNotMatchException;
import org.clinicmanager.clinicmanager.repository.HibernateImplJpa.DoctorRepoJpaImpl;
import org.clinicmanager.clinicmanager.repository.HibernateImplJpa.PatientRepoJpaImpl;
import org.clinicmanager.clinicmanager.repository.HibernateImplJpa.UserRepoJpaImpl;
import org.clinicmanager.clinicmanager.util.ValidationUtil;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

public class AuthService {

    private static UserRepoJpaImpl userRepoJpa = new UserRepoJpaImpl() ;
    private static PatientService patientService = new PatientService() ;
    private static DoctorService doctorService = new DoctorService() ;
    private static SpecialtyService specialtyService = new SpecialtyService() ;

    public User register(HttpServletRequest request)throws IOException{
        String name = request.getParameter("name") ;
        String last_name = request.getParameter("lastName") ;
        String email = request.getParameter("email") ;
        String password = request.getParameter("password") ;
        String user_role = request.getParameter("role") ;
        // Validations
        ValidationUtil.validatePasswordLenght(password);
        ValidationUtil.validateEmail(email) ;
        // Save
        try {
            Role role = Role.valueOf(user_role) ;
            User user = new User(name, last_name,role,email,password) ;
            userRepoJpa.save(user) ;
        if(role.equals(Role.DOCTOR)){
             saveDoctor(request,user);
        }else if (role.equals(Role.PATIENT)) {
            savePatient(request,user);
        }
        return user;
        } catch (EmailAlreadyExistException e) {
            System.out.println(e.getMessage());
        }
        return null ;
    }

    public User login(HttpServletRequest request){
        String email = request.getParameter("email") ;
        String password = request.getParameter("password") ;
        Optional<User> user = userRepoJpa.findByEmail(email) ;
        if (!user.isPresent()){
            throw new EmailNotExistException("This email is not exist") ;
        } else if (!user.get().getPassword().equals(password)) {
            throw new PasswordNotMatchException("The password is not match") ;
        }
        else
            return user.get() ;
    }

    // login

    public static void saveDoctor(HttpServletRequest request, User user){
        String matricule = request.getParameter("matricule") ;
        Specialite specialite = specialtyService.findById(Long.valueOf(request.getParameter("specialite_id")));
        Doctor doctor = new Doctor(matricule,user,specialite) ;
        doctorService.save(doctor);
    }
    public static void savePatient(HttpServletRequest request,User user){
        String phone = request.getParameter("phone") ;
        String cin = request.getParameter("cin") ;
        LocalDate date_de_naissance = LocalDate.parse(request.getParameter("dateNaissance")) ;
        Genre genre = Genre.valueOf(request.getParameter("genre")) ;
        String adress = request.getParameter("adresse") ;
        GroupSuinguin groupSuinguin = GroupSuinguin.valueOf(request.getParameter("groupeSanguin")) ;
        Patient patient = new Patient(phone,cin,date_de_naissance,genre,adress,groupSuinguin,user) ;
        patientService.save(patient) ;
    }

    public List<User> getAll(){
        return userRepoJpa.getAll() ;
    }

}
