package org.clinicmanager.clinicmanager.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class TestConnection {

        public static void main(String[] args) {
            String url = "jdbc:postgresql://localhost:5432/clinic_manager";
            String user = "postgres";
            String password = "lahcen2025";

            try (Connection connection = DriverManager.getConnection(url, user, password)) {
                System.out.println("connected");
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
}
