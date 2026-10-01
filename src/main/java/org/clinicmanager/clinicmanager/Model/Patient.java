package org.clinicmanager.clinicmanager.Model;

import jakarta.persistence.*;
import org.clinicmanager.clinicmanager.Enum.Genre;
import org.clinicmanager.clinicmanager.Enum.GroupSuinguin;
import org.clinicmanager.clinicmanager.Enum.Role;

import java.time.LocalDate;
import java.util.UUID;

@Entity
@Table(name = "patients")
public class Patient {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id ;

    private String phone ;
    private String cin ;
    private LocalDate date_de_naissance ;
    private Genre genre ;
    private String adress ;
    private GroupSuinguin groupSuinguin ;

    @OneToOne
    @JoinColumn(name = "user_id",referencedColumnName = "id",unique = true,nullable = false)
    private User user ;

    protected Patient(){}

    public Patient(String phone, String cin, LocalDate date_de_naissance, Genre genre, String adress, GroupSuinguin groupSuinguin, User user) {
        this.phone = phone;
        this.cin = cin;
        this.date_de_naissance = date_de_naissance;
        this.genre = genre;
        this.adress = adress;
        this.groupSuinguin = groupSuinguin;
        this.user = user;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
