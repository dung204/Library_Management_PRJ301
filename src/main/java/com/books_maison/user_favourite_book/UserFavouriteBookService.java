package com.books_maison.user_favourite_book;

import com.books_maison.user_favourite_book.entity.UserFavouriteBook;
import com.books_maison.user_favourite_book.entity.UserFavouriteBookId;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class UserFavouriteBookService {

  private final UserFavouriteBookRepository userFavouriteBookRepository;

  public UserFavouriteBookService(UserFavouriteBookRepository userFavouriteBookRepository) {
    this.userFavouriteBookRepository = userFavouriteBookRepository;
  }

  public void addOne(String userId, String bookId) {
    userFavouriteBookRepository.save(new UserFavouriteBook(userId, bookId));
  }

  public void removeOne(String userId, String bookId) {
    userFavouriteBookRepository.deleteById(new UserFavouriteBookId(userId, bookId));
  }

  public boolean userHasFavouredBook(String userId, String bookId) {
    return userFavouriteBookRepository.existsById(new UserFavouriteBookId(userId, bookId));
  }
}
