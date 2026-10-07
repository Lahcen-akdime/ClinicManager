package org.clinicmanager.clinicmanager.Strategy;

import org.clinicmanager.clinicmanager.Model.Patient;
import org.clinicmanager.clinicmanager.service.PatientService;

public class DesactivatePatientStrategie implements IdesactivateStrategie{

    private PatientService patientService = new PatientService() ;
    @Override
    public void changeStatus(Object object, Boolean currentStatus) {
        Patient patient = (Patient) object ;
        patientService.changeStatus(patient,currentStatus);

    }
}
