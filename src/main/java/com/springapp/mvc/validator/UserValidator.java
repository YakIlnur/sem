package com.springapp.mvc.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class UserValidator implements ConstraintValidator<ValidUser,String> {
    @Override
    public void initialize(ValidUser constraintAnnotation) {

    }

    @Override
    public boolean isValid(String username, ConstraintValidatorContext context) {
        if(username == null){
            return false;
        }
        if(username.matches("^[A-Za-z0-9_-]{3,15}$")){
            return true;
        }
        else {
            return false;
        }
    }
}
