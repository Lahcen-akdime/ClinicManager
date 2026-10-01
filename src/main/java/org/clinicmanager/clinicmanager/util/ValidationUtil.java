package org.clinicmanager.clinicmanager.util ;

import org.clinicmanager.clinicmanager.exception.InvalidEmailException;
import org.clinicmanager.clinicmanager.exception.InvalidPasswordException;

public class ValidationUtil {

    public static void validatePasswordLenght(String password){
        if(password.isEmpty()){
            throw new InvalidPasswordException("S'il vous plis entrer un mot de pass") ;
        } else if (password.length() < 8) {
            throw new InvalidPasswordException("S'il vous plis entrer un mot de pass qui contient au moin 8 chifre") ;
        }
    }

    public static void validateEmail(String email){
        if(email.isEmpty()){
            throw new InvalidEmailException("S'il vous plis entrer un mot de pass");
        } else if (email.length() < 8 || !email.contains("@gmail.com")) {
            throw new InvalidEmailException("S'il vous plis entrer un email valid , ex : email@gmailcom") ;
        }
    }
}