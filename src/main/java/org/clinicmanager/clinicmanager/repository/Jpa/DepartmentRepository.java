package org.clinicmanager.clinicmanager.repository.Jpa;

import org.clinicmanager.clinicmanager.Model.Departement;

import java.util.List;

public interface DepartmentRepository {

    public Departement save(Departement departement) ;
    public List<Departement> getAll() ;

}
