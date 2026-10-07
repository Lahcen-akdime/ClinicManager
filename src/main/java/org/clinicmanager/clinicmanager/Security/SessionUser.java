package org.clinicmanager.clinicmanager.Security;

import org.clinicmanager.clinicmanager.Enum.Role;

import java.io.Serializable;

public class SessionUser {

    private final Long id ;
    private final String name ;
    private final String email ;
    private final Role role ;

    public SessionUser(Long id, String name, String email, Role role) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.role = role;
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public Role getRole() {
        return role;
    }
}
