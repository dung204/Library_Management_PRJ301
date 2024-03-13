package com.books_maison.book.entity;

import java.time.LocalDate;
import java.util.List;

import org.hibernate.annotations.Nationalized;

import com.books_maison.author.entity.Author;
import com.books_maison.category.entity.Category;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
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
  @Nationalized
  private String title;

  @Column(nullable = false)
  private LocalDate publishedDate;

  @Column(nullable = false)
  @Nationalized
  private String language;

  @Column()
  private String imageUrl;

  @ManyToMany
  @JoinTable(name = "books_authors", joinColumns = @JoinColumn(name = "book_id"), inverseJoinColumns = @JoinColumn(name = "author_id"))
  private List<Author> authors;

  @ManyToMany
  @JoinTable(name = "books_categories", joinColumns = @JoinColumn(name = "book_id"), inverseJoinColumns = @JoinColumn(name = "category_id"))
  private List<Category> categories;
}