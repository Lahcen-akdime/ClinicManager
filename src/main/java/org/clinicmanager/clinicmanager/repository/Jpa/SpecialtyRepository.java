package org.clinicmanager.clinicmanager.repository.Jpa;

import org.clinicmanager.clinicmanager.Model.Departement;
import org.clinicmanager.clinicmanager.Model.Specialite;

import java.util.List;

public interface SpecialtyRepository {

    public Specialite save(Specialite specialite) ;
    public List<Specialite> getAll() ;

}
