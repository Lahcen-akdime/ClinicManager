package org.clinicmanager.clinicmanager.Model;

import com.sun.istack.NotNull;
import com.sun.istack.Nullable;
import jakarta.persistence.*;

@Entity
@Table(name = "departements")
public class Departement {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id ;

    @NotNull
    private String name ;

    private String descreption ;

    public Departement(String name, String descreption) {
        this.name = name;
        this.descreption = descreption;
    }

    public Departement() {

    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getDescreption() {
        return descreption;
    }


}
