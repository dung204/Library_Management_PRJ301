package com.books_maison.checkout;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.books_maison.checkout.entity.Checkout;

@Repository
public interface CheckoutRepository extends JpaRepository<Checkout, String> {
}