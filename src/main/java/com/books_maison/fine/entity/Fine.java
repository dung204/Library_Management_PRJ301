package com.books_maison.fine.entity;

import com.books_maison.checkout.entity.Checkout;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.IdClass;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@Entity
@Table(name = "fines")
public class Fine {
  @Id
  @GeneratedValue(strategy = GenerationType.UUID)
  private String id;

  @OneToOne
  @JoinColumn(name = "checkout_id", referencedColumnName = "id", nullable = false)
  private Checkout checkout;

  @Transient
  private Integer overdueHours;

  @Transient
  private Double fineAmount;

}