package com.repositories;

import com.entities.QuizResult;
import com.entities.User;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface QuizResultRepository extends CrudRepository<QuizResult, Long> {
    List<QuizResult> findByUser(User user);
}
