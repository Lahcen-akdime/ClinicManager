package org.clinicmanager.clinicmanager.repository.HibernateImplJpa;

import jakarta.persistence.EntityManager;
import org.clinicmanager.clinicmanager.Model.Departement;
import org.clinicmanager.clinicmanager.Model.Specialite;
import org.clinicmanager.clinicmanager.config.JpaConnection;
import org.clinicmanager.clinicmanager.repository.Jpa.DepartmentRepository;

import javax.swing.text.html.parser.Entity;
import java.util.List;
import java.util.Optional;

public class DepartementRepoJpaImpl implements DepartmentRepository {

    @Override
    public Departement save(Departement departement) {
        EntityManager entityManager = JpaConnection.getEntityManager() ;
        try {
        entityManager.getTransaction().begin();
        entityManager.persist(departement);
        entityManager.getTransaction().commit();
        } catch (IllegalStateException e) {
            throw e ;
        }
        return departement;
    }

    @Override
    public List<Departement> getAll() {
        EntityManager entityManager = JpaConnection.getEntityManager() ;
        entityManager.getTransaction().begin();
        List<Departement> departements = entityManager.createQuery("SELECT d FROM Departement d",Departement.class).getResultList() ;
        entityManager.getTransaction().commit();
        return departements ;
    }

    public Optional<Departement> findById(Long id){
        EntityManager entityManager = JpaConnection.getEntityManager() ;
        entityManager.getTransaction().begin() ;
        Departement departement = entityManager.find(Departement.class,id) ;
        entityManager.getTransaction().commit();
        return Optional.ofNullable(departement) ;
    }
}
