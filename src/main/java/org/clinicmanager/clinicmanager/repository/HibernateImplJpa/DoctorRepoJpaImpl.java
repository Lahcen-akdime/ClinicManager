package org.clinicmanager.clinicmanager.repository.HibernateImplJpa;

import jakarta.persistence.EntityManager;
import org.clinicmanager.clinicmanager.Model.Doctor;
import org.clinicmanager.clinicmanager.Model.Patient;
import org.clinicmanager.clinicmanager.Model.User;
import org.clinicmanager.clinicmanager.config.JpaConnection;
import org.clinicmanager.clinicmanager.repository.Jpa.DoctorRepository;

import java.util.List;
import java.util.Optional;

public class DoctorRepoJpaImpl implements DoctorRepository {
    private static EntityManager entityManager = JpaConnection.getEntityManager() ;
    @Override
    public Doctor save(Doctor doctor) {
        try {
        entityManager.getTransaction().begin();
        entityManager.persist(doctor);
        entityManager.getTransaction().commit();
            System.out.println("Le doctor a bien crée");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return doctor ;
    }

    @Override
    public Optional<List<Doctor>> getAll() {
        entityManager.getTransaction().begin();
        List<Doctor> doctors =  entityManager.createQuery("SELECT d FROM Doctor d",Doctor.class).getResultList();
        entityManager.getTransaction().commit();
        return Optional.of(doctors) ;
    }

    public Optional<Doctor> findById(Long id){
        EntityManager entityManager = JpaConnection.getEntityManager() ;
        entityManager.getTransaction().begin() ;
        Doctor doctor = entityManager.find(Doctor.class,id) ;
        entityManager.getTransaction().commit();
        return Optional.ofNullable(doctor) ;
    }
}
