package com.pisien.myhome.controller;

import com.pisien.myhome.entity.Board;
import com.pisien.myhome.entity.User;
import com.pisien.myhome.repository.UserRepository;
import com.pisien.myhome.service.UserService;
import com.pisien.myhome.validator.AccountValidator;
import com.pisien.myhome.validator.BoardValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/account")
public class AccountController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private AccountValidator accountValidator;

    @GetMapping("/login")
    public String login() {
        return "account/login";
    }

    @GetMapping("/register")
    public String register(Model model) {
        List<User> users = userRepository.findAll();

        model.addAttribute("users", users);

        return "account/register";
    }

    @GetMapping("/register/{id}")
    public String registerById(Model model, @RequestParam(required = false) Long id) {
        if (id == null) {
            model.addAttribute("board", new Board());
        } else {
            User user = userRepository.findById(id).orElse(null);
            model.addAttribute("user", user);
        }
        return "account/register";
    }

    @PostMapping("/register")
    public String register(@Valid User user, BindingResult bindingResult, Authentication authentication) {
        accountValidator.validate(user, bindingResult);

        if (bindingResult.hasErrors()) {
            return "account/register";
        }
        userService.save(user);
        return "redirect:/";
    }


}
