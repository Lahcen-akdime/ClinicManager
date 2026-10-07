package org.clinicmanager.clinicmanager.repository.HibernateImplJpa;

import jakarta.persistence.EntityManager;
import org.clinicmanager.clinicmanager.Enum.Genre;
import org.clinicmanager.clinicmanager.Enum.GroupSuinguin;
import org.clinicmanager.clinicmanager.Model.Patient;
import org.clinicmanager.clinicmanager.Model.User;
import org.clinicmanager.clinicmanager.config.JpaConnection;
import org.clinicmanager.clinicmanager.exception.InvalidSaveException;
import org.clinicmanager.clinicmanager.repository.Jpa.PatientRepository;

import java.time.LocalDate;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

public class PatientRepoJpaImpl implements PatientRepository {

    @Override
    public Patient save(Patient patient) {
        EntityManager entityManager = JpaConnection.getEntityManager() ;
        try{
            entityManager.getTransaction().begin();
            entityManager.persist(patient);
            entityManager.getTransaction().commit();
            System.out.println("Le patient a bien crée");
            return patient ;
        } catch (RuntimeException e) {
            if (entityManager.getTransaction().isActive()){
            entityManager.getTransaction().rollback();
            }
        throw new InvalidSaveException("Le patient n'a pas crée !") ;
        } finally {
            entityManager.close();
        }
    }

    public List<Patient> getAllPatients() {
        EntityManager entityManager = JpaConnection.getEntityManager() ;
        try {
            return entityManager.createQuery("SELECT p FROM Patient p", Patient.class)
                    .getResultList();
        } finally {
            entityManager.close();
        }
    }

    public Optional<Patient> findById(Long id){
        EntityManager entityManager = JpaConnection.getEntityManager() ;
        entityManager.getTransaction().begin() ;
        Patient patient = entityManager.find(Patient.class,id) ;
        entityManager.getTransaction().commit();
        return Optional.ofNullable(patient) ;
    }

}
