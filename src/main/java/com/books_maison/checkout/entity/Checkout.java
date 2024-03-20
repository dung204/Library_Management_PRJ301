package com.books_maison.checkout.entity;

import com.books_maison.book.entity.Book;
import com.books_maison.checkout_status.entity.CheckoutStatus;
import com.books_maison.user.entity.User;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "checkouts")
public class Checkout {

  @Id
  @GeneratedValue(strategy = GenerationType.UUID)
  private String id;

  @ManyToOne
  @JoinColumn(name = "user_id", referencedColumnName = "id", nullable = false)
  private User user;

  @ManyToOne
  @JoinColumn(name = "book_id", referencedColumnName = "id", nullable = false)
  private Book book;

  @Column(nullable = false)
  @CreationTimestamp
  private LocalDateTime checkoutTimestamp;

  @Column(nullable = false)
  private LocalDateTime dueTimestamp;

  @ManyToOne
  private CheckoutStatus status;
}
