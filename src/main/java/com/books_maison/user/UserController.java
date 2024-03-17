package com.books_maison.user;

import com.books_maison.book.BookService;
import com.books_maison.security.SecurityUtils;
import com.books_maison.user.dto.UpdateUserDTO;
import com.books_maison.user.entity.User;
import java.time.ZoneId;
import java.util.Date;
import java.util.Optional;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/user")
public class UserController {

  private final UserService userService;
  private final BookService bookService;

  public UserController(UserService userService, BookService bookService) {
    this.userService = userService;
    this.bookService = bookService;
  }

  @GetMapping("/me/**")
  public String showCurrentUser(
    @RequestParam("page") Optional<Integer> page,
    @RequestParam("tab") String tab,
    Model model
  ) {
    User currentUser = SecurityUtils.getCurrentSessionUser();

    if (currentUser == null) {
      return "redirect:/auth/login";
    }

    Date createdDate = Date.from(currentUser.getCreatedTimestamp().atZone(ZoneId.systemDefault()).toInstant());

    if (tab.equals("favourite-books")) {
      Pageable pageable = PageRequest.of(page.isPresent() ? page.get() - 1 : 0, 10).withSort(
        Direction.DESC,
        "publishedYear"
      );

      model.addAttribute(
        "paginatedFavouriteBooks",
        bookService.getPaginatedFavouriteBooksByUserId(pageable, currentUser.getId())
      );
    }

    model.addAttribute("user", currentUser);
    model.addAttribute("createdDate", createdDate);
    return "pages/user-details";
  }

  @PostMapping("/me/add-favourite-book")
  public String addFavouriteBookToCurrentUser(@RequestParam("book-id") String bookId) {
    User currentUser = SecurityUtils.getCurrentSessionUser();

    if (currentUser == null) {
      return "redirect:/auth/login";
    }

    userService.addFavouriteBook(currentUser, bookId);
    return "redirect:/book/%s".formatted(bookId);
  }

  @PostMapping("/me/remove-favourite-book")
  public String removeFavouriteBookToCurrentUser(@RequestParam("book-id") String bookId) {
    User currentUser = SecurityUtils.getCurrentSessionUser();

    if (currentUser == null) {
      return "redirect:/auth/login";
    }

    userService.removeFavouriteBook(currentUser, bookId);
    return "redirect:/book/%s".formatted(bookId);
  }

  @SuppressWarnings("null")
  @PostMapping("/me/edit")
  public String editCurrentUser(
    @ModelAttribute("editInfoForm") UpdateUserDTO updateUserDTO,
    BindingResult bindingResult,
    Model model
  ) {
    User currentUser = SecurityUtils.getCurrentSessionUser();

    if (currentUser == null) {
      return "redirect:/auth/login";
    }

    if (updateUserDTO.getEmail() != null && !updateUserDTO.getEmail().equals(currentUser.getEmail())) {
      Optional<User> existingUserByEmail = userService.getUserByEmail(updateUserDTO.getEmail());
      if (existingUserByEmail.isPresent()) {
        bindingResult.rejectValue("email", "UpdateError", "Email đã tồn tại");
      }
    }

    if (
      !updateUserDTO.getPassword().equals(currentUser.getPassword()) &&
      !updateUserDTO.getPassword().equals(updateUserDTO.getConfirmPassword())
    ) {
      bindingResult.rejectValue("confirmPassword", "UpdateError", "Mật khẩu xác thực không khớp");
    }

    if (bindingResult.hasErrors()) {
      bindingResult
        .getFieldErrors()
        .forEach(error -> {
          model.addAttribute("%sErrorMessage".formatted(error.getField()), error.getDefaultMessage());
          model.addAttribute("%sRejectedValue".formatted(error.getField()), error.getRejectedValue());
        });
      return "pages/user-details";
    }

    userService.updateUser(currentUser, updateUserDTO);
    return "redirect:/user/me/edit?success";
  }
}
