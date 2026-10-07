package org.clinicmanager.clinicmanager.Migration;

import org.clinicmanager.clinicmanager.Enum.Role;
import org.clinicmanager.clinicmanager.Model.User;
import org.clinicmanager.clinicmanager.repository.HibernateImplJpa.UserRepoJpaImpl;

public class AdminMigration {
    private static UserRepoJpaImpl userRepoJpa = new UserRepoJpaImpl() ;
    public static void main(String[] args){
        //try {
        //userRepoJpa.save(new User("moul chi","admin",Role.ADMIN ,"admin@gmail.com","admin@gmail.com" )) ;
        //}
        // catch (Exception e) {
        //    e.printStackTrace();
        //}
    }
}
