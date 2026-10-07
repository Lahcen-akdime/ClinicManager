package org.clinicmanager.clinicmanager.dto;

import org.clinicmanager.clinicmanager.Enum.Genre;
import org.clinicmanager.clinicmanager.Enum.GroupSuinguin;

public class DoctorDto {

    private String matricule ;
    private String titre ;

    public DoctorDto(String matricule, String titre) {
        this.matricule = matricule;
        this.titre = titre;
    }

    public String getMatricule() {
        return matricule;
    }

    public String getTitre() {
        return titre;
    }
}
