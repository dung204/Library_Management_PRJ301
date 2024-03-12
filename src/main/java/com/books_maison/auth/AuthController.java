package com.books_maison.auth;

import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.books_maison.auth.dto.RegisterDTO;
import com.books_maison.user.UserService;
import com.books_maison.user.entity.User;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/auth")
public class AuthController {
  private final UserService userService;

  public AuthController(UserService userService) {
    this.userService = userService;
  }

  @GetMapping("/login")
  public String showLoginForm() {
    return "pages/login";
  }

  @GetMapping("/register")
  public String showRegisterForm() {
    return "pages/register";
  }

  @SuppressWarnings("null")
  @PostMapping("/register")
  public String handleRegister(
      @Valid @ModelAttribute("registerForm") RegisterDTO registerDTO,
      BindingResult bindingResult,
      Model model) {
    Optional<User> existingUserByEmail = userService.getUserByEmail(registerDTO.getEmail());
    if (existingUserByEmail.isPresent()) {
      bindingResult.rejectValue("email", "RegisterError", "Email đã tồn tại");
    }

    if (!registerDTO.getPassword().equals(registerDTO.getConfirmPassword())) {
      bindingResult.rejectValue("confirmPassword", "RegisterError", "Mật khẩu xác thực không khớp");
    }

    if (bindingResult.hasErrors()) {
      bindingResult.getFieldErrors().forEach(error -> {
        model.addAttribute("%sErrorMessage".formatted(error.getField()), error.getDefaultMessage());
        model.addAttribute("%sRejectedValue".formatted(error.getField()), error.getRejectedValue());
      });
      return "pages/register";
    }

    userService.createUser(registerDTO);
    return "redirect:/auth/login?register-success";
  }
}
