package com.books_maison.checkout_status.entity;

public enum CheckoutStatusId {
  RENTING(1),
  OVERDUE(2),
  RETURNED(3);

  public final int value;

  private CheckoutStatusId(int value) {
    this.value = value;
  }
}
