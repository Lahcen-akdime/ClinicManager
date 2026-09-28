package org.clinicmanager.clinicmanager.Model;

import org.clinicmanager.clinicmanager.Enum.Genre;
import org.clinicmanager.clinicmanager.Enum.GroupSuinguin;

import java.time.LocalDate;

public class Patient extends User{

    private String phone ;
    private String cin ;
    private LocalDate date_de_naissance ;
    private Genre genre ;
    private String adress ;
    private GroupSuinguin groupSuinguin ;

    public Patient(String name, String lastName, String email, String password, String phone, LocalDate date_de_naissance, String cin, Genre genre, String adress, GroupSuinguin groupSuinguin) {
        super(name, lastName, email, password);
        this.phone = phone;
        this.date_de_naissance = date_de_naissance;
        this.cin = cin;
        this.genre = genre;
        this.adress = adress;
        this.groupSuinguin = groupSuinguin;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
