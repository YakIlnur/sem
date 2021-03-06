package com.springapp.mvc.validator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Documented
@Constraint(validatedBy = UserValidator.class)
@Target( { ElementType.METHOD, ElementType.FIELD })
@Retention(RetentionPolicy.RUNTIME)
public @interface ValidUser {
    String message() default "incorrectly username";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
