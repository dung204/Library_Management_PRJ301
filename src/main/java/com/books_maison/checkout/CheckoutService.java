package com.books_maison.checkout;

import com.books_maison.book.BookService;
import com.books_maison.book.entity.Book;
import com.books_maison.checkout.dto.CreateCheckoutDTO;
import com.books_maison.checkout.entity.Checkout;
import com.books_maison.checkout_status.CheckoutStatusService;
import com.books_maison.checkout_status.entity.CheckoutStatusId;
import com.books_maison.user.UserService;
import com.books_maison.user.entity.User;
import jakarta.transaction.Transactional;
import java.time.LocalDateTime;
import java.util.Optional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class CheckoutService {

  private final CheckoutRepository checkoutRepository;
  private final CheckoutStatusService checkoutStatusService;
  private final BookService bookService;
  private final UserService userService;
  private final int CHECKOUT_MAX_DAYS = 14;

  public CheckoutService(
    CheckoutRepository checkoutRepository,
    BookService bookService,
    UserService userService,
    CheckoutStatusService checkoutStatusService
  ) {
    this.checkoutRepository = checkoutRepository;
    this.bookService = bookService;
    this.userService = userService;
    this.checkoutStatusService = checkoutStatusService;
  }

  public Page<Checkout> getPaginatedCheckoutsByUserId(Pageable pageable, String userId) {
    if (pageable == null) throw new IllegalArgumentException("Pageable is required");

    return checkoutRepository.findAllByUserId(pageable, userId);
  }

  public Checkout createCheckout(CreateCheckoutDTO createCheckoutDTO) {
    if (createCheckoutDTO == null) throw new IllegalArgumentException("Invalid checkout data");

    if (
      this.userHasUnexpiredCheckoutByBookId(createCheckoutDTO.getUserId(), createCheckoutDTO.getBookId())
    ) throw new RuntimeException("Checkout already exists");

    Book book = bookService.getBookById(createCheckoutDTO.getBookId());
    User user = userService.getUserById(createCheckoutDTO.getUserId());

    Checkout checkout = new Checkout();
    checkout.setBook(book);
    checkout.setUser(user);
    checkout.setDueTimestamp(
      LocalDateTime.now().plusDays(CHECKOUT_MAX_DAYS + 1).withHour(0).withMinute(0).withSecond(0)
    );
    checkout.setStatus(checkoutStatusService.getCheckoutStatusById(CheckoutStatusId.RENTING));

    bookService.decrementOneToQuantity(book.getId());

    return checkoutRepository.save(checkout);
  }

  public Optional<Checkout> getUnexpiredCheckoutByUserIdAndBookId(String userId, String bookId) {
    return checkoutRepository.findUnexpiredCheckoutByUserIdAndBookId(userId, bookId);
  }

  public boolean userHasUnexpiredCheckoutByBookId(String userId, String bookId) {
    return checkoutRepository.findUnexpiredCheckoutByUserIdAndBookId(userId, bookId).isPresent();
  }
}
