package com.services;

import com.configs.QuizConfig;
import com.entities.Domain;
import com.entities.Option;
import com.entities.Question;
import com.repositories.DomainRepository;
import com.repositories.QuestionRepository;
import com.session.Quiz;
import com.entities.QuestionResponse;
import org.hibernate.Hibernate;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Service

public class QuizService {
    @Autowired
    DomainRepository domainRepository;

    @Autowired
    QuestionRepository questionRepository;


    public Domain getDomainWithQuestions(Long id) {
        Domain domain = domainRepository.findOne(id);
        Hibernate.initialize(domain.getQuestions());
        return domain;
    }

    public Question getQuestionOptions(Question question) {
        question = questionRepository.findOne(question.getId());
        Hibernate.initialize(question.getOptions());
        return question;
    }

    public Question getQuestionWithScore(Integer score, Quiz quiz) {
        List<Long> usedQuestions = new ArrayList<>();
        for (QuestionResponse response : quiz.getResponses()) {
            Question question = response.getQuestion();
            usedQuestions.add(question.getId());
        }
        List<Question> available;
        if (usedQuestions.isEmpty()) {
            available = questionRepository.findByScore(quiz.getDomain(), score);
        } else {
            available = questionRepository.findNewByScore(quiz.getDomain(), score, usedQuestions);
        }
        if (available.isEmpty()) {
            return null;
        }

        Random randGen = new Random();
        Integer chosenPos = randGen.nextInt(available.size());
        Question chosen = available.get(chosenPos);
        return getQuestionOptions(chosen);
    }

    public Integer computedResponseScore(QuestionResponse response) {
        Integer questionScore = response.getQuestion().getScore();
        if (response.isCorrect()) {
            questionScore = Math.min(++questionScore, QuizConfig.MAX_QUESTION_SCORE);
        } else {
            --questionScore;
        }
        return questionScore;
    }

    //Первые NUM_SETUP_QUESTIONS используются для калибровки теста и игнорируются в подсчете
    public List<QuestionResponse> getScoreResponses(Quiz quiz) {
        List<QuestionResponse> responses = quiz.getResponses();
        if (responses.size() < QuizConfig.NUM_SETUP_QUESTIONS) {
            return responses.subList(responses.size(), responses.size());
        }
        return responses.subList(QuizConfig.NUM_SETUP_QUESTIONS, responses.size());
    }

    public Double calcMean(Quiz quiz) {
        Integer sumScores = 0;
        List<QuestionResponse> responses = getScoreResponses(quiz);

        if (responses.size() == 0) {
            return 0.0;
        }

        for (QuestionResponse response : responses) {
            sumScores += computedResponseScore(response);
        }

        return sumScores / (double) responses.size();
    }

    public Double calcError(Quiz quiz) {
        //Среднеквадратическое отклонение
        Double mean = calcMean(quiz);
        Double devSum = 0.0;
        List<QuestionResponse> responses = getScoreResponses(quiz);

        if (responses.size() == 0) {
            return 0.0;
        }

        for (QuestionResponse response : responses) {
            Integer questionScore = computedResponseScore(response);
            devSum += Math.pow((questionScore - mean), 2);
        }
        Double stdDev = Math.sqrt(devSum / responses.size());

        //Стандартная ошибка
        return stdDev / Math.sqrt(responses.size());
    }

    public Question chooseNextQuestion(Quiz quiz) {
        if (quiz.getResponses().isEmpty()) {
            return getQuestionWithScore(QuizConfig.START_QUESTION_SCORE, quiz);
        } else if (quiz.getResponses().size() >= QuizConfig.MAX_QUESTIONS) {
            return null;
        }

        if (quiz.getResponses().size() > QuizConfig.MIN_QUESTIONS && calcError(quiz) < QuizConfig.ERROR_LIMIT) {
            return null;
        }

        QuestionResponse mostRecentResponse = quiz.getMostRecentResponse();
        Integer nextQuestionScore;
        if (mostRecentResponse.isCorrect()) {
            nextQuestionScore = Math.min(mostRecentResponse.getQuestion().getScore() + 1, QuizConfig.MAX_QUESTION_SCORE);
        } else {
            nextQuestionScore = Math.max(mostRecentResponse.getQuestion().getScore() - 1, QuizConfig.MIN_QUESTION_SCORE);
        }
        return getQuestionWithScore(nextQuestionScore, quiz);
    }

    public Integer calcFinalScore(Quiz quiz) {
        Double mean = calcMean(quiz);
        return (int) (100 * mean / QuizConfig.MAX_QUESTION_SCORE);
    }

    public void debugLastResponse(Quiz quiz) {
        List<QuestionResponse> responses = quiz.getResponses();
        QuestionResponse lastResponse = responses.get(quiz.getResponses().size() - 1);

        System.out.print("ID вопроса: ");
        System.out.println(lastResponse.getQuestion().getId());

        System.out.print("Балл: ");
        System.out.println(lastResponse.getQuestion().getScore());

        System.out.print("ID верного ответа:");
        for (Option option : lastResponse.getQuestion().getCorrectOptions()) {
            System.out.print(" ");
            System.out.print(option.getId());
        }
        System.out.println();

        System.out.print("ID выбранного ответа:");
        for (Option option : lastResponse.getSelectedOptions()) {
            System.out.print(" ");
            System.out.print(option.getId());
        }
        System.out.println();

        System.out.print("Верно ответил: ");
        System.out.println(lastResponse.isCorrect());

        System.out.print("Текущий балл: ");
        System.out.println(calcMean(quiz));

        System.out.print("Текущая ошибка: ");
        System.out.println(calcError(quiz));

        System.out.println("___________________________________ ");
    }
}