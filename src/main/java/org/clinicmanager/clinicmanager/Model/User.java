package org.clinicmanager.clinicmanager.Model;

import jakarta.persistence.*;
import org.clinicmanager.clinicmanager.Enum.Role;
import org.hibernate.annotations.ColumnDefault;

import java.util.UUID;

@Entity
@Table(name = "users")
@Inheritance(strategy = InheritanceType.JOINED)
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id ;

    private String name ;
    private String lastName ;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Role userRole ;

    @Column(unique = true,nullable = false)
    private String email ;
    private String password ;

    private Boolean isActive  = true ;

    public User(){}

    public User( String name, String lastName, Role userRole, String email, String password) {
        this.name = name;
        this.lastName = lastName;
        this.userRole = userRole;
        this.email = email;
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public Role getUserRole() {
        return userRole;
    }



    public void setPassword(String password) {
        this.password = password;
    }

    public void setUserRole(Role userRole) {
        this.userRole = userRole;
    }

    public Long getId() {
        return id;
    }

    @Override
    public String toString() {
        return "User{" +
                "name='" + name + '\'' +
                ", lastName='" + lastName + '\'' +
                ", userRole=" + userRole +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                '}';
    }

    public Boolean getActive() {
        return isActive;
    }

    public void setActive(Boolean active) {
        isActive = active;
    }
}
