package com.controllers;

import com.entities.QuizResult;
import com.repositories.QuizResultRepository;
import com.session.AuthedUser;
import com.dtos.PasswordChangeDTO;
import com.entities.User;
import com.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;
import java.util.List;

@Controller
public class MiscController {
    @Autowired
    private UserService userService;

    @Autowired
    QuizResultRepository quizResultRepository;

    @RequestMapping(value = "/changepass", method = RequestMethod.GET)
    public String showPasswordChangeForm(PasswordChangeDTO passwordChangeDTO) {
        return "change_password";
    }

    @RequestMapping(value = "/changepass", method = RequestMethod.POST)
    public String changePassword(@Valid PasswordChangeDTO passwordChangeDTO, BindingResult bindingResult) {
        if (!bindingResult.hasErrors()) {
            AuthedUser auth = (AuthedUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            User user = auth.getUser();

            user = userService.changeUserPassword(passwordChangeDTO, user);
            if (user == null) {
                bindingResult.rejectValue("old_password", "message.changePassError");
            }
        }

        if (bindingResult.hasErrors()) {
            return "change_password";
        }

        return "change_password_success";
    }

    @RequestMapping(value = "/allresults", method = RequestMethod.GET)
    public String showAllUserResults(Model model){
        System.out.println("ALLRESULT");
        AuthedUser auth = (AuthedUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User user = auth.getUser();

        List<QuizResult> qrr = quizResultRepository.findByUser(user);
        model.addAttribute("", qrr);
        return "allresults";
    }
}
