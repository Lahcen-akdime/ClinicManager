package org.clinicmanager.clinicmanager.Model;

public class Doctor extends User{

    public String matricule ;
    public String titre ;

    public Doctor(String name, String lastName, String email, String password) {
        super(name, lastName, email, password);
    }
}
