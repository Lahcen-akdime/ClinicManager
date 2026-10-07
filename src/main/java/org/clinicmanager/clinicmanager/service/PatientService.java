package org.clinicmanager.clinicmanager.service;

import org.clinicmanager.clinicmanager.Model.Patient;
import org.clinicmanager.clinicmanager.Model.User;
import org.clinicmanager.clinicmanager.dto.PatientDto;
import org.clinicmanager.clinicmanager.mapper.MapPatientsListToDto;
import org.clinicmanager.clinicmanager.repository.HibernateImplJpa.PatientRepoJpaImpl;
import org.clinicmanager.clinicmanager.repository.HibernateImplJpa.UserRepoJpaImpl;

import java.util.List;
import java.util.Optional;

public class PatientService {
    private static PatientRepoJpaImpl patientRepoJpa = new PatientRepoJpaImpl() ;
    private static UserRepoJpaImpl userRepoJpa = new UserRepoJpaImpl() ;

    public List<PatientDto> getAllPatients(){
        List<Patient> patients = patientRepoJpa.getAllPatients() ;
        List<PatientDto> patientDtoList = MapPatientsListToDto.MapPatientsListToDto(patients) ;
        return patientDtoList ;
    }

    public void changeStatus(Patient patient , Boolean currentStatus){
        User user = patient.getUser() ;
        user.setActive(!currentStatus);
        userRepoJpa.update(user);
    }

    public Patient save(Patient patient){
        return patientRepoJpa.save(patient) ;
    }

    public Patient findById(Long id){
        Optional<Patient> patient = patientRepoJpa.findById(id) ;
        return patient.get() ;
    }
}
