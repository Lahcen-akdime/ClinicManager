package org.clinicmanager.clinicmanager.Strategy;

import org.clinicmanager.clinicmanager.Model.Doctor;
import org.clinicmanager.clinicmanager.Model.Patient;
import org.clinicmanager.clinicmanager.service.DoctorService;

public class DesactivateDoctorStrategie implements IdesactivateStrategie{

    private DoctorService doctorService = new DoctorService() ;

    @Override
    public void changeStatus(Object object, Boolean currentStatus) {
        Doctor doctor = (Doctor) object ;
        doctorService.changeStatus(doctor,currentStatus);
    }
}
