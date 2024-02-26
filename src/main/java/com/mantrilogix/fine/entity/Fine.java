package com.mantrilogix.fine.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
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

  @Transient
  private Integer overdueHours;

  @Transient
  private Double fineAmount;

  // TODO: relationship with checkout
}