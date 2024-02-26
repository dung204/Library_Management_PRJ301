package com.mantrilogix.checkout.entity;

import java.time.LocalDateTime;

import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@Entity
@Table(name = "checkouts")
public class Checkout {
  @Id
  @GeneratedValue(strategy = GenerationType.UUID)
  private String id;

  @Column(nullable = false)
  @CreationTimestamp
  private LocalDateTime checkoutTimestamp;

  @Column(nullable = false)
  private LocalDateTime dueTimestamp;

  // TODO: relationship with user
  // TODO: relationship with book

}