package com.mantrilogix.book.entity;

import java.time.LocalDate;

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
@Table(name = "books")
public class Book {
  @Id
  @GeneratedValue(strategy = GenerationType.UUID)
  private String id;

  @Column(nullable = false, unique = true)
  private String isbn;

  @Column(nullable = false)
  private String title;

  @Column(nullable = false)
  private LocalDate publishedDate;

  @Column(nullable = false)
  private String language;

  @Column()
  private String imageUrl;

  // TODO: relationship with author
  // TODO: relationship with category
}