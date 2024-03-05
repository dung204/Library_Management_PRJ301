package com.mantrilogix.checkout;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mantrilogix.checkout.entity.Checkout;

@Repository
public interface CheckoutRepository extends JpaRepository<Checkout, String> {
}