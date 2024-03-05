package com.mantrilogix.checkout;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mantrilogix.checkout.entity.Checkout;

@Service
public class CheckoutService {
  private CheckoutRepository checkoutRepository;

  public CheckoutService(CheckoutRepository checkoutRepository) {
    this.checkoutRepository = checkoutRepository;
  }

  public Checkout createCheckout(Checkout checkout) {
    return checkoutRepository.save(checkout);
  }

  public Checkout getCheckout(String id) {
    return checkoutRepository.findById(id).orElse(null);
  }

  public void deleteCheckout(String id) {
    checkoutRepository.deleteById(id);
  }

  public Checkout updateCheckout(Checkout checkout) {
    return checkoutRepository.save(checkout);
  }

  public List<Checkout> getAllCheckouts() {
    return checkoutRepository.findAll();
  }
}