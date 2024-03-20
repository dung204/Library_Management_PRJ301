package com.books_maison.checkout_status;

import com.books_maison.checkout_status.entity.CheckoutStatus;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CheckoutStatusRepository extends JpaRepository<CheckoutStatus, Integer> {}
