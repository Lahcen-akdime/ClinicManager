package org.clinicmanager.clinicmanager.config;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import org.clinicmanager.clinicmanager.exception.DatabaseNotConnectedException;

import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

public class JpaConnection {
    public static Map<String, Object> config = new HashMap<>();
    public static Properties properties = new Properties() ;

    public static EntityManager getEntityManager(){
        try (InputStream input = JpaConnection.class.getClassLoader().getResourceAsStream("db.properties")){
            properties.load(input);
            config.put("jakarta.persistence.jdbc.url",properties.getProperty("db.url"));
            config.put("jakarta.persistence.jdbc.user",properties.getProperty("db.username"));
            config.put("jakarta.persistence.jdbc.password",properties.getProperty("db.password"));
            EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("clinic_m",config);
            EntityManager entityManager = entityManagerFactory.createEntityManager() ;
            return entityManager ;
        } catch (Exception e) {
            e.printStackTrace();
            throw new DatabaseNotConnectedException("La db ne connecte pas");
        }
    }
}
