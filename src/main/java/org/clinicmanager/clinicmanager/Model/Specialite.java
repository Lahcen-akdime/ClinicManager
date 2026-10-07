package org.clinicmanager.clinicmanager.Model;

import jakarta.persistence.*;

@Entity
@Table(name = "specialites")
public class Specialite {

    @Id
    private Long id ;

    private String name ;

    @OneToOne
    @JoinColumn(name = "departement_id" , referencedColumnName = "id" , unique = true , nullable = false)
    private Departement departement ;

    public Specialite(String name, Departement departement) {
        this.name = name;
        this.departement = departement;
    }

    public Specialite() {

    }

    public Long getId() {
        return id;
    }

    public Departement getDepartement() {
        return departement;
    }

    public String getName() {
        return name;
    }
}
