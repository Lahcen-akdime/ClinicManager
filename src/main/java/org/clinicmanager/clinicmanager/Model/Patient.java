package org.clinicmanager.clinicmanager.Model;

import jakarta.persistence.*;
import org.clinicmanager.clinicmanager.Enum.Genre;
import org.clinicmanager.clinicmanager.Enum.GroupSuinguin;

import java.time.LocalDate;

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

    public String getCin() {
        return cin;
    }

    public LocalDate getDate_de_naissance() {
        return date_de_naissance;
    }

    public Genre getGenre() {
        return genre;
    }

    public Long getId() {
        return id;
    }

    public String getAdress() {
        return adress;
    }

    public GroupSuinguin getGroupSuinguin() {
        return groupSuinguin;
    }

    public User getUser() {
        return user;
    }
}
