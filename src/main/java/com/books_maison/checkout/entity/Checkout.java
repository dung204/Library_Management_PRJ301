package com.books_maison.checkout.entity;

import java.time.LocalDateTime;

import org.hibernate.annotations.CreationTimestamp;

import com.books_maison.book.entity.Book;
import com.books_maison.user.entity.User;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
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

}