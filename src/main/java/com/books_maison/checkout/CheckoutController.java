package com.books_maison.checkout;

import ch.qos.logback.core.model.Model;
import com.books_maison.checkout.dto.CreateCheckoutDTO;
import com.books_maison.security.SecurityUtils;
import com.books_maison.user.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/checkout")
public class CheckoutController {

  private final CheckoutService checkoutService;

  public CheckoutController(CheckoutService checkoutService) {
    this.checkoutService = checkoutService;
  }

  @RequestMapping("/add/{bookId}")
  public String addCheckout(@PathVariable String bookId, Model model) {
    User currentUser = SecurityUtils.getCurrentSessionUser();

    if (currentUser == null) {
      return "redirect:/auth/login";
    }

    CreateCheckoutDTO createCheckoutDTO = new CreateCheckoutDTO();
    createCheckoutDTO.setBookId(bookId);
    createCheckoutDTO.setUserId(currentUser.getId());

    checkoutService.createCheckout(createCheckoutDTO);
    return "redirect:/book/%s".formatted(bookId);
  }
}
