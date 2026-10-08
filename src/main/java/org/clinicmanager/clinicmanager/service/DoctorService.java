package org.clinicmanager.clinicmanager.service;

import org.clinicmanager.clinicmanager.Model.Departement;
import org.clinicmanager.clinicmanager.Model.Doctor;
import org.clinicmanager.clinicmanager.Model.Patient;
import org.clinicmanager.clinicmanager.Model.User;
import org.clinicmanager.clinicmanager.repository.HibernateImplJpa.DoctorRepoJpaImpl;
import org.clinicmanager.clinicmanager.repository.HibernateImplJpa.UserRepoJpaImpl;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Bool;

import java.util.List;
import java.util.Optional;

public class DoctorService {
    private static DoctorRepoJpaImpl doctorRepoJpa = new DoctorRepoJpaImpl() ;
    private static UserRepoJpaImpl userRepoJpa = new UserRepoJpaImpl() ;

    public void save(Doctor doctor){
        doctorRepoJpa.save(doctor) ;
    }

    public void changeStatus(Doctor doctor , Boolean currentStatus){
        User user = doctor.getUser() ;
        user.setActive(!currentStatus);
        userRepoJpa.update(user);
    }

    public Doctor findById(Long id){
        Optional<Doctor> doctor = doctorRepoJpa.findById(id) ;
        return doctor.get() ;
    }

    public Optional<List<Doctor>> getAll(){
        return doctorRepoJpa.getAll() ;
    }

}
