package org.clinicmanager.clinicmanager.repository.Jpa;

import org.clinicmanager.clinicmanager.Model.Doctor;
import org.clinicmanager.clinicmanager.Model.User;

public interface DoctorRepository {
    public Doctor save(Doctor doctor) ;
}
