package com.dtos;

import com.entities.Domain;

import javax.validation.constraints.NotNull;

public class QuizRequestDTO {
    @NotNull
    private Domain domain;

    public Domain getDomain() {
        return domain;
    }

    public void setDomain(Domain domain) {
        this.domain = domain;
    }
}
