package org.clinicmanager.clinicmanager.Strategy;

import org.clinicmanager.clinicmanager.Model.Patient;
import org.clinicmanager.clinicmanager.service.PatientService;

import java.util.HashMap;
import java.util.Map;

public class DesactivateStrategy {

    Map<String,IdesactivateStrategie> strategies = new HashMap<>() ;

    public DesactivateStrategy(){
        strategies.put("patient",new DesactivatePatientStrategie());
        strategies.put("doctor",new DesactivateDoctorStrategie());
    }

    public IdesactivateStrategie doStrategy(String entityName){
        IdesactivateStrategie idesactivateStrategie = strategies.get(entityName) ;
        return idesactivateStrategie ;
    }

}
