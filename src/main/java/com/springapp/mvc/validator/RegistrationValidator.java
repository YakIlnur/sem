package com.springapp.mvc.validator;


import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class RegistrationValidator implements ConstraintValidator<ValidRegistration,String> {
    @Override
    public void initialize(ValidRegistration constraintAnnotation) {

    }

    @Override
    public boolean isValid(String password, ConstraintValidatorContext context) {
        if(password == null){
            return false;
        }
        if(password.matches("^[a-z0-9_-]{3,12}$")){
            return true;
        }
        else {
            return false;
        }
    }
}
