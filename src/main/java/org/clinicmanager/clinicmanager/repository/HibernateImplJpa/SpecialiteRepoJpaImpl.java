package org.clinicmanager.clinicmanager.repository.HibernateImplJpa;

import jakarta.persistence.EntityManager;
import org.clinicmanager.clinicmanager.Model.Patient;
import org.clinicmanager.clinicmanager.Model.Specialite;
import org.clinicmanager.clinicmanager.config.JpaConnection;
import org.clinicmanager.clinicmanager.repository.Jpa.SpecialtyRepository;

import javax.swing.text.html.parser.Entity;
import java.util.List;
import java.util.Optional;

public class SpecialiteRepoJpaImpl implements SpecialtyRepository {
    @Override
    public Specialite save(Specialite specialite) {
        EntityManager entityManager = JpaConnection.getEntityManager() ;
        entityManager.getTransaction().begin();
        entityManager.persist(specialite);
        entityManager.getTransaction().commit();
        return specialite ;
    }

    @Override
    public List<Specialite> getAll() {
        EntityManager entityManager = JpaConnection.getEntityManager() ;
        entityManager.getTransaction().begin();
        List<Specialite> specialites = entityManager.createQuery("SELECT s FROM Specialite s",Specialite.class).getResultList() ;
        entityManager.getTransaction().commit();
        return specialites ;
    }

    public Optional<Specialite> findById(Long id){
        EntityManager entityManager = JpaConnection.getEntityManager() ;
        entityManager.getTransaction().begin() ;
        Specialite specialite = entityManager.find(Specialite.class,id) ;
        entityManager.getTransaction().commit();
        return Optional.ofNullable(specialite) ;
    }
}
