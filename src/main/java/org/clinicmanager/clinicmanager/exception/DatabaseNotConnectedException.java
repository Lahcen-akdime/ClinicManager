package org.clinicmanager.clinicmanager.exception;

public class DatabaseNotConnectedException extends RuntimeException {
    public DatabaseNotConnectedException(String message) {
        super(message);
    }
}
