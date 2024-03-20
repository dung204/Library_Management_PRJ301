package com.books_maison.book;

import com.books_maison.book.entity.Book;
import com.books_maison.checkout.CheckoutService;
import com.books_maison.security.SecurityUtils;
import com.books_maison.user.entity.User;
import com.books_maison.user_favourite_book.UserFavouriteBookService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/book")
public class BookController {

  private final BookService bookService;
  private final UserFavouriteBookService userFavouriteBookService;
  private final CheckoutService checkoutService;

  public BookController(
    BookService bookService,
    UserFavouriteBookService userFavouriteBookService,
    CheckoutService checkoutService
  ) {
    this.bookService = bookService;
    this.userFavouriteBookService = userFavouriteBookService;
    this.checkoutService = checkoutService;
  }

  @GetMapping("/{bookId}")
  public String details(@PathVariable String bookId, Model model) {
    User currentUser = SecurityUtils.getCurrentSessionUser();
    Book book = bookService.getBookById(bookId);

    if (currentUser != null) {
      model.addAttribute(
        "userHasFavouredBook",
        userFavouriteBookService.userHasFavouredBook(currentUser.getId(), bookId)
      );

      model.addAttribute(
        "userIsRentingThisBook",
        checkoutService.userHasNotYetReturnedCheckoutByBookId(currentUser.getId(), bookId)
      );
    }

    model.addAttribute("book", book);

    return "pages/book-details";
  }
}
