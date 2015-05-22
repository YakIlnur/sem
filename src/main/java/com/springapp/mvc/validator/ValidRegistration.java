package com.springapp.mvc.validator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Documented
@Constraint(validatedBy = RegistrationValidator.class)
@Target( { ElementType.METHOD, ElementType.FIELD })
@Retention(RetentionPolicy.RUNTIME)
public @interface ValidRegistration {
    String message() default "incorrectly password";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
