package org.clinicmanager.clinicmanager.repository.HibernateImplJpa;

import jakarta.persistence.EntityManager;
import org.clinicmanager.clinicmanager.Model.Doctor;
import org.clinicmanager.clinicmanager.config.JpaConnection;
import org.clinicmanager.clinicmanager.exception.RecuperationException;
import org.clinicmanager.clinicmanager.repository.Jpa.DoctorRepository;

import java.util.List;
import java.util.Optional;

public class DoctorRepoJpaImpl implements DoctorRepository {

    @Override
    public Doctor save(Doctor doctor) {
        EntityManager entityManager = JpaConnection.getEntityManager();
        try {
            entityManager.getTransaction().begin();
            entityManager.persist(doctor);
            entityManager.getTransaction().commit();
            return doctor;
        } catch (Exception e) {
            if (entityManager.getTransaction().isActive()) {
                entityManager.getTransaction().rollback();
            }
            throw new RuntimeException("le doctor ne cree pas");
        } finally {
            entityManager.close();
        }
    }

    @Override public Optional<List<Doctor>> getAll() {
        EntityManager entityManager = JpaConnection.getEntityManager();
        try {
            entityManager.getTransaction().begin();
            List<Doctor> doctors = entityManager.createQuery("SELECT d FROM Doctor d", Doctor.class).getResultList();
            entityManager.getTransaction().commit(); return Optional.of(doctors);
        } catch (Exception e) {
            if (entityManager.getTransaction().isActive()) {
                entityManager.getTransaction().rollback();
            }
            throw new RecuperationException("la récupération des doctors ne fonctionne pas");
        } finally { entityManager.close();
        }
    }

    @Override
    public Optional<Doctor> findById(Long id) {
        EntityManager entityManager = JpaConnection.getEntityManager();
        try {
            entityManager.getTransaction().begin();
            Doctor doctor = entityManager.find(Doctor.class, id);
            entityManager.getTransaction().commit();
            return Optional.ofNullable(doctor);
        } catch (Exception e) {
            if (entityManager.getTransaction().isActive()) {
                entityManager.getTransaction().rollback();
            }
            throw new RecuperationException(" le doctor ne vien pas ");
        } finally {
            entityManager.close();
        }
    }
}
