package org.clinicmanager.clinicmanager.repository.Jpa;

import org.clinicmanager.clinicmanager.Enum.Genre;
import org.clinicmanager.clinicmanager.Enum.GroupSuinguin;
import org.clinicmanager.clinicmanager.Model.Patient;
import org.clinicmanager.clinicmanager.Model.User;

import java.time.LocalDate;

public interface PatientRepository {
    public Patient save(Patient patient) ;
}
