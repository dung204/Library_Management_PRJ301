package com.books_maison.user_favourite_book.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.IdClass;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "user_favourite_books")
@IdClass(UserFavouriteBookId.class)
public class UserFavouriteBook {

  @Id
  private String userId;

  @Id
  private String bookId;
}
