package com.books_maison.user_favourite_book;

import com.books_maison.user_favourite_book.entity.UserFavouriteBook;
import com.books_maison.user_favourite_book.entity.UserFavouriteBookId;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserFavouriteBookRepository extends JpaRepository<UserFavouriteBook, UserFavouriteBookId> {}
