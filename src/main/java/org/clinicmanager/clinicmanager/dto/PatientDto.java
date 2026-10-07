package org.clinicmanager.clinicmanager.dto;

import org.clinicmanager.clinicmanager.Enum.Genre;
import org.clinicmanager.clinicmanager.Enum.GroupSuinguin;

public class PatientDto {
    private Long id ;
    private String name ;
    private String phone ;
    private Genre genre ;
    private String adress ;
    private GroupSuinguin groupSuinguin ;
    private Boolean isActive ;

    public PatientDto(String name , String phone, Long id, Genre genre, String adress, GroupSuinguin groupSuinguin,Boolean isActive) {
        this.phone = phone;
        this.id = id;
        this.genre = genre;
        this.adress = adress;
        this.groupSuinguin = groupSuinguin;
        this.name = name ;
        this.isActive = isActive ;
    }

    public String getName() {
        return name ;
    }

    public String getPhone() {
        return phone;
    }

    public Genre getGenre() {
        return genre;
    }

    public String getAdress() {
        return adress;
    }

    public GroupSuinguin getGroupSuinguin() {
        return groupSuinguin;
    }

    public Boolean getIsActive() {
        return isActive;
    }

    public Long getId() {
        return id;
    }
}
