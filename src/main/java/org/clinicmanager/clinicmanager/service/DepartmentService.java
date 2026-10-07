package org.clinicmanager.clinicmanager.service;

import org.clinicmanager.clinicmanager.Model.Departement;
import org.clinicmanager.clinicmanager.repository.HibernateImplJpa.DepartementRepoJpaImpl;

import java.util.List;

public class DepartmentService {

    private static DepartementRepoJpaImpl departementRepoJpa = new DepartementRepoJpaImpl() ;

    public Departement save(String name , String description){
        Departement departement = new Departement(name,description) ;
        departementRepoJpa.save(departement) ;
        return departement ;
    }

    public List<Departement> getAll(){
        return departementRepoJpa.getAll() ;
    }

}
