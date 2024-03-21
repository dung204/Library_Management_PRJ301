package com.books_maison.user;

import com.books_maison.security.SecurityUtils;
import com.books_maison.user.entity.User;
import java.util.logging.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

  private final UserService userService;

  public AdminController(UserService userService) {
    this.userService = userService;
  }

  @GetMapping
  public String showAdminPage(Model model) {
    User currentUser = SecurityUtils.getCurrentSessionUser();

    model.addAttribute("currentUser", currentUser);
    return "pages/admin/index";
  }

  @GetMapping("/books")
  public String showBooksPage() {
    return "pages/admin/books";
  }

  @GetMapping("/authors")
  public String showAuthorsPage() {
    return "pages/admin/authors";
  }

  @GetMapping("/users")
  public String showUsersPage() {
    return "pages/admin/users";
  }

  @GetMapping("/checkouts")
  public String showCheckoutsPage() {
    return "pages/admin/checkouts";
  }
}
