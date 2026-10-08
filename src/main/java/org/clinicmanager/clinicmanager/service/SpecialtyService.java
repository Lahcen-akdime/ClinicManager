package org.clinicmanager.clinicmanager.service;

import org.clinicmanager.clinicmanager.Model.Departement;
import org.clinicmanager.clinicmanager.Model.Doctor;
import org.clinicmanager.clinicmanager.Model.Specialite;
import org.clinicmanager.clinicmanager.repository.HibernateImplJpa.SpecialiteRepoJpaImpl;

import java.util.List;
import java.util.Optional;

public class SpecialtyService {

    private SpecialiteRepoJpaImpl specialiteRepoJpa = new SpecialiteRepoJpaImpl() ;

    public List<Specialite> getAll(){
        return specialiteRepoJpa.getAll() ;
    }

    public Specialite save(String name , Departement departement){
        Specialite specialite = new Specialite(name,departement);
        return specialiteRepoJpa.save(specialite) ;
    }

    public Specialite findById(Long id){
        Optional<Specialite> specialite = specialiteRepoJpa.findById(id) ;
        return specialite.get() ;
    }


}
