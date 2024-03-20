package com.books_maison.fine.entity;

import com.books_maison.app.AppUtils;
import com.books_maison.checkout.entity.Checkout;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Period;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "fines")
public class Fine {

  @Id
  @GeneratedValue(strategy = GenerationType.UUID)
  private String id;

  @OneToOne(cascade = CascadeType.ALL)
  @JoinColumn(name = "checkout_id", referencedColumnName = "id", unique = true, nullable = false)
  private Checkout checkout;

  @Transient
  private Integer overdueDays;

  @Transient
  private BigDecimal fineAmount;

  private final BigDecimal FINE_AMOUNT_PER_DAY = BigDecimal.valueOf(5_000);

  public Integer getOverdueDays() {
    return Period.between(checkout.getDueTimestamp().toLocalDate(), LocalDate.now()).getDays();
  }

  public BigDecimal getFineAmount() {
    return FINE_AMOUNT_PER_DAY.multiply(BigDecimal.valueOf(getOverdueDays()));
  }

  @Column
  @CreationTimestamp
  private LocalDateTime createdAt;

  public String getFormattedFineAmount() {
    return AppUtils.formatMoney(getFineAmount());
  }
}
