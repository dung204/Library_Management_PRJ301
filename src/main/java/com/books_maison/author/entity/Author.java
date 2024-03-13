package com.books_maison.author.entity;

import java.time.LocalDate;

import org.hibernate.annotations.Nationalized;

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
@Table(name = "authors")
public class Author {
  @Id
  @GeneratedValue(strategy = GenerationType.UUID)
  private String id;

  @Column(nullable = false)
  @Nationalized
  private String firstName;

  @Column(nullable = false)
  @Nationalized
  private String lastName;

  @Column()
  private LocalDate dateOfBirth;

  @Column()
  @Nationalized
  private String nationality;

  @Column()
  private String imageUrl;
}