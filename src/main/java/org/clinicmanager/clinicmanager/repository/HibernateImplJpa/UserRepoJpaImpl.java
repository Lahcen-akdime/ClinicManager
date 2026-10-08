package org.clinicmanager.clinicmanager.repository.HibernateImplJpa;

import jakarta.persistence.EntityManager;
import org.clinicmanager.clinicmanager.Enum.Role;
import org.clinicmanager.clinicmanager.Model.User;
import org.clinicmanager.clinicmanager.exception.DatabaseNotConnectedException;
import org.clinicmanager.clinicmanager.exception.EmailAlreadyExistException;
import org.clinicmanager.clinicmanager.exception.RecuperationException;
import org.clinicmanager.clinicmanager.repository.Jpa.UserRepository;
import org.clinicmanager.clinicmanager.config.JpaConnection;

import java.util.List;
import java.util.Optional;

public class UserRepoJpaImpl implements UserRepository {

    private String findByEmailQuery = "SELECT u FROM User u WHERE u.email = :email";

    @Override
    public User save(User user) {
        EntityManager entityManager = JpaConnection.getEntityManager() ;
        try {
        entityManager.getTransaction().begin();
        entityManager.persist(user);
        entityManager.getTransaction().commit();
            System.out.println("L'utilisateur a bien crée");
        return user ;
        } catch (EmailAlreadyExistException e) {
            e.printStackTrace();
        }
        catch (DatabaseNotConnectedException e){
            e.printStackTrace();
            throw new DatabaseNotConnectedException(e.getMessage()) ;
        }catch (Exception e) {
            e.printStackTrace();
            return null ;
        } finally {
            entityManager.close();
        }
        return null ;
    }

    @Override
    public User update(User user) {
        try {
        EntityManager entityManager = JpaConnection.getEntityManager() ;
            entityManager.getTransaction().begin();
            User updatedUser = entityManager.merge(user) ;
            entityManager.getTransaction().commit();
            return updatedUser ;
        } catch (DatabaseNotConnectedException e) {
            e.printStackTrace();
            throw new DatabaseNotConnectedException(e.getMessage()) ;
        } catch (NullPointerException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null ;
    }

    @Override
    public Optional<User> findByEmail(String email) {
        try {
            EntityManager entityManager = JpaConnection.getEntityManager() ;
        User user = entityManager.createQuery(findByEmailQuery,User.class)
                                .setParameter("email",email).getSingleResult();
        return Optional.of(user) ;
        } catch (DatabaseNotConnectedException e) {
            e.printStackTrace();
            throw new DatabaseNotConnectedException(e.getMessage()) ;
        }
    }

    @Override
    public Optional<User> findById(Long id) {
        try {
            EntityManager entityManager = JpaConnection.getEntityManager() ;
            User user = entityManager.find(User.class,id) ;
            return Optional.ofNullable(user) ;

        } catch (DatabaseNotConnectedException e){
            e.printStackTrace();
            throw new DatabaseNotConnectedException(e.getMessage()) ;
        }
    }

    public List<User> getAll(){
            EntityManager entityManager = JpaConnection.getEntityManager() ;
        try {
            entityManager.getTransaction().begin();
            List<User> users = entityManager.createQuery("SELECT u FROM User u",User.class).getResultList();
            entityManager.getTransaction().commit();
            return users ;
        } catch (Exception exception){
            if(entityManager.getTransaction().isActive()){
                entityManager.getTransaction().rollback();
            }
            throw new RecuperationException("Les utilisateurs n'arrive pas");
        } finally {
            entityManager.close();
        }
    }
}
