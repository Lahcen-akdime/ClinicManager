package org.clinicmanager.clinicmanager.Model;

import jakarta.persistence.*;
import org.clinicmanager.clinicmanager.Enum.Role;

import java.util.UUID;

@Entity
@Table(name = "doctors")
public class Doctor {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id ;

    @Column(unique = true,nullable = false)
    private String matricule ;

    @OneToOne
    @JoinColumn(name = "user_id",referencedColumnName = "id",unique = true,nullable = false)
    private User user ;

    @ManyToOne
    @JoinColumn(name = "specialite_id",referencedColumnName = "id",nullable = false)
    private Specialite specialite ;


    public Doctor(String matricule, User user , Specialite specialite) {
        this.matricule = matricule;
        this.user = user;
        this.specialite = specialite ;
    }

    public Doctor() {

    }

    public String getMatricule() {
        return matricule;
    }

    public Long getId() {
        return id;
    }


    public User getUser() {
        return user;
    }

    public Specialite getSpecialite() {
        return specialite;
    }
}
