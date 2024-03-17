package com.books_maison.user_favourite_book.entity;

import java.io.Serializable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class UserFavouriteBookId implements Serializable {

  private String userId;
  private String bookId;
}
