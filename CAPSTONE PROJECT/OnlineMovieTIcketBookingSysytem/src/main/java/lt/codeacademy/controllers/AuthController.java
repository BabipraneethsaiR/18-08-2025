package lt.codeacademy.controllers;

import lt.codeacademy.entities.User;
import lt.codeacademy.services.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@Controller
public class AuthController {

    private final UserService userService;

    public AuthController(UserService userService) {
        this.userService = userService;
    }

    // -------- USER LOGIN PAGE --------
    @GetMapping("/login")
    public String loginPage(Model model) {
        model.addAttribute("isAdminLogin", false);
        return "login";
    }

    // -------- USER LOGIN PROCESS --------
    @PostMapping("/login")
    public String processLogin(
            @RequestParam String email,
            @RequestParam String password,
            HttpSession session,
            Model model) {

        Optional<User> userOpt = userService.login(email, password);

        if (userOpt.isPresent()) {
            session.setAttribute("loggedUser", userOpt.get());
            return "redirect:/user/dashboard";
        }

        model.addAttribute("error", true);
        model.addAttribute("isAdminLogin", false);
        return "login";
    }

    // -------- LOGOUT --------
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}
