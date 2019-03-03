package com.validators;

import com.dtos.PasswordCheckDTO;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class PasswordMatchesValidator implements ConstraintValidator<PasswordMatches, Object> {
    @Override
    public void initialize(PasswordMatches constraintAnnotation) {
    }

    @Override
    public boolean isValid(Object obj, ConstraintValidatorContext context) {
        PasswordCheckDTO passwordCheckDTO = (PasswordCheckDTO) obj;
        return passwordCheckDTO.getPassword().equals(passwordCheckDTO.getPassword_confirm());
    }
}
