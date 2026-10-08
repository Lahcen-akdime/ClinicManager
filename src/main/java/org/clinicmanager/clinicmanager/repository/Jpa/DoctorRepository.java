package org.clinicmanager.clinicmanager.repository.Jpa;

import org.clinicmanager.clinicmanager.Model.Doctor;
import org.clinicmanager.clinicmanager.Model.User;

import java.util.List;
import java.util.Optional;

public interface DoctorRepository {
    public Doctor save(Doctor doctor) ;
    public Optional<List<Doctor>> getAll() ;
    public Optional<Doctor> findById(Long id) ;
}
