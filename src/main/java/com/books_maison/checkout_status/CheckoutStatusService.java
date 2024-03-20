package com.books_maison.checkout_status;

import com.books_maison.checkout_status.entity.CheckoutStatus;
import com.books_maison.checkout_status.entity.CheckoutStatusId;
import org.springframework.stereotype.Service;

@Service
public class CheckoutStatusService {

  private final CheckoutStatusRepository checkoutStatusRepository;

  public CheckoutStatusService(CheckoutStatusRepository checkoutStatusRepository) {
    this.checkoutStatusRepository = checkoutStatusRepository;
  }

  public CheckoutStatus getCheckoutStatusById(CheckoutStatusId checkoutStatusId) {
    return checkoutStatusRepository
      .findById(checkoutStatusId.value)
      .orElseThrow(() -> new RuntimeException("Checkout status not found"));
  }
}
