package com.books_maison.fine;

import com.books_maison.app.AppUtils;
import com.books_maison.checkout.CheckoutService;
import com.books_maison.checkout.entity.Checkout;
import com.books_maison.fine.entity.Fine;
import jakarta.transaction.Transactional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class FineService {

  private final FineRepository fineRepository;
  private final CheckoutService checkoutService;

  public FineService(FineRepository fineRepository, CheckoutService checkoutService) {
    this.fineRepository = fineRepository;
    this.checkoutService = checkoutService;
  }

  public Page<Fine> getPaginatedFinesByUserId(Pageable pageable, String userId) {
    if (pageable == null) throw new IllegalArgumentException("Pageable is required");

    return fineRepository.findAllByUserId(pageable, userId);
  }

  public Fine createFine(Checkout checkout) {
    Fine fine = new Fine();
    fine.setCheckout(checkout);
    return fineRepository.save(fine);
  }

  @Scheduled(cron = AppUtils.Cron.AT_EVERY_MIDNIGHT)
  public void scheduledCreateFine() {
    checkoutService.getNotYetMarkedOverdueCheckouts().stream().forEach(checkout -> this.createFine(checkout));
  }
}
