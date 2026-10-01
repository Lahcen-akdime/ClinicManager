package org.clinicmanager.clinicmanager.repository.Jpa;

import org.clinicmanager.clinicmanager.Enum.Role;
import org.clinicmanager.clinicmanager.Model.User;

import java.util.Optional;
import java.util.UUID;

public interface UserRepository {

    public User save(User user) ;
    public User update(User user) ;
    public Optional<User> findByEmail(String email) ;
    public Optional<User> findById(Long id) ;

}
