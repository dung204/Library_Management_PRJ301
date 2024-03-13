package com.books_maison.author.entity;

import java.time.LocalDate;
import java.util.List;

import org.hibernate.annotations.Nationalized;

import com.books_maison.book.entity.Book;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "authors")
public class Author {
  @Id
  @GeneratedValue(strategy = GenerationType.UUID)
  private String id;

  @Column(nullable = false)
  @Nationalized
  private String name;

  @Column()
  private Integer yearOfBirth;

  @Column()
  private Integer yearOfDeath;

  @Column()
  @Nationalized
  private String nationality;

  @Column()
  private String imageUrl;

  @Column(columnDefinition = "NTEXT")
  private String biography;

  @ManyToMany(mappedBy = "authors")
  private List<Book> books;

  public int getTotalBookCount() {
    return books.size();
  }
}