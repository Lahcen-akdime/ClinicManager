package org.clinicmanager.clinicmanager.repository.HibernateImplJpa;

import jakarta.persistence.EntityManager;
import org.clinicmanager.clinicmanager.Enum.Genre;
import org.clinicmanager.clinicmanager.Enum.GroupSuinguin;
import org.clinicmanager.clinicmanager.Model.Patient;
import org.clinicmanager.clinicmanager.Model.User;
import org.clinicmanager.clinicmanager.config.JpaConnection;
import org.clinicmanager.clinicmanager.repository.Jpa.PatientRepository;

import java.time.LocalDate;

public class PatientRepoJpaImpl implements PatientRepository {
    private static EntityManager entityManager = JpaConnection.getEntityManager() ;
    @Override
    public Patient save(Patient patient) {
        try{
            entityManager.getTransaction().begin();
            entityManager.persist(patient);
            entityManager.getTransaction().commit();
            System.out.println("Le patient a bien crée");
    } catch (Exception e) {
        e.printStackTrace();
    }
        return patient ;
    }
}
