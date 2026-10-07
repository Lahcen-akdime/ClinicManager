package org.clinicmanager.clinicmanager.mapper;

import org.clinicmanager.clinicmanager.Model.Patient;
import org.clinicmanager.clinicmanager.dto.PatientDto;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class MapPatientsListToDto {

    public static List<PatientDto> MapPatientsListToDto(List<Patient> patients){
        List<PatientDto> patientListDto = new ArrayList<>();
            patients.forEach(patient -> {
                patientListDto.add(getPatientDto(patient)) ;
            }
            );
            return patientListDto ;
    }

    public static PatientDto getPatientDto(Patient patient){
        PatientDto patientsDto = new PatientDto(patient.getUser().getName(),
                                                patient.getPhone(),patient.getId(),
                                                patient.getGenre(),patient.getAdress(),
                                                patient.getGroupSuinguin(),
                                                patient.getUser().getActive()) ;
        return patientsDto ;
    }
}
