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

    private String titre ;

    @OneToOne
    @JoinColumn(name = "user_id",referencedColumnName = "id",unique = true,nullable = false)
    private User user ;

    protected Doctor(){

    }

    public Doctor(String matricule, String titre, User user) {
        this.matricule = matricule;
        this.titre = titre;
        this.user = user;
    }

    public String getMatricule() {
        return matricule;
    }

    public Long getId() {
        return id;
    }

    public String getTitre() {
        return titre;
    }

    public User getUser() {
        return user;
    }

}
