package org.clinicmanager.clinicmanager.repository.HibernateImplJpa;

import jakarta.persistence.EntityManager;
import org.clinicmanager.clinicmanager.Model.Doctor;
import org.clinicmanager.clinicmanager.Model.User;
import org.clinicmanager.clinicmanager.config.JpaConnection;
import org.clinicmanager.clinicmanager.repository.Jpa.DoctorRepository;

public class DoctorRepoJpaImpl implements DoctorRepository {
    EntityManager entityManager = JpaConnection.getEntityManager() ;
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
}
