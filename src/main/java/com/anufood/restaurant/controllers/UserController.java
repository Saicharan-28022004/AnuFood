package com.anufood.restaurant.controllers;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.anufood.restaurant.model.User;
import com.anufood.restaurant.service.iface.UserService;
import com.anufood.restaurant.service.impl.EmailService;

@Controller
@RequestMapping("/users")
public class UserController {

    @Autowired
    private EmailService emailService;

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping
    public String listUsers(Model model) {
        List<User> users = userService.getAllUsers();
        model.addAttribute("users", users);
        return "user-list";
    }

    @GetMapping("/create")
    public String showCreateUserForm(Model model) {
        model.addAttribute("user", new User());
        return "user-create";
    }

    @PostMapping("/create")
    public String createUser(@ModelAttribute User user,
                             Model model,
                             RedirectAttributes redirectAttributes) {
        try {
            userService.createUser(user.getUsername(), user.getPassword(), "USER",
                    user.getPhone_number(), user.getEmail(), user.getAddress());

            // Success message
            redirectAttributes.addFlashAttribute("success",
                    "Account created successfully! Please login.");
//            emailService.sendEmail(user.getEmail(), subject, body);
            return "redirect:/login";

        } catch (Exception e) {
            model.addAttribute("error", "Registration failed: " + e.getMessage());
            return "user-create";
        }
    }

    @GetMapping("/edit/{id}")
    public String showEditUserForm(@PathVariable int id, Model model) {
        User user = userService.getUserById(id);
        model.addAttribute("user", user);
        return "user-edit";
    }

    @PostMapping("/update/{id}")
    public String updateUser(@PathVariable int id, @ModelAttribute User user) {
        userService.updateUser(id, user.getUsername(), user.getPassword(), user.getRole(),
                user.getPhone_number(), user.getEmail(), user.getAddress());
        return "redirect:/users";
    }

    @GetMapping("/delete/{id}")
    public String deleteUser(@PathVariable int id) {
        userService.deleteUser(id);
        return "redirect:/users";
    }
}
