package org.clinicmanager.clinicmanager.service;

import org.clinicmanager.clinicmanager.Enum.Role;
import org.clinicmanager.clinicmanager.Model.User;
import org.clinicmanager.clinicmanager.exception.EmailAlreadyExistException;
import org.clinicmanager.clinicmanager.repository.HibernateImplJpa.UserRepoJpaImpl;
import org.clinicmanager.clinicmanager.util.ValidationUtil;

public class AuthService {

    private static UserRepoJpaImpl userRepoJpa = new UserRepoJpaImpl() ;

    public User register(String name, String lastName, String email, String password, Role userRole){
        // Validations
        ValidationUtil.validatePasswordLenght(password);
        ValidationUtil.validateEmail(email) ;
        // Save
        try {
        User user = userRepoJpa.save(name, lastName, email, password, userRole) ;
        return user;
        } catch (EmailAlreadyExistException e) {
            System.out.println(e.getMessage());
        }
        return null ;
    }

}
