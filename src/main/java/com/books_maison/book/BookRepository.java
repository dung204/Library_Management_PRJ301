package com.books_maison.book;

import com.books_maison.book.entity.Book;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface BookRepository extends JpaRepository<Book, String> {
  Page<Book> findByTitleContainingIgnoreCase(Pageable pageable, String title);

  @Query(
    value = "SELECT b.* FROM books b " +
    "INNER JOIN books_categories bc " +
    "ON b.id = bc.book_id " +
    "WHERE bc.category_id IN (:categoryIds)",
    countQuery = "SELECT COUNT(*) FROM books b " +
    "INNER JOIN books_categories bc " +
    "ON b.id = bc.book_id " +
    "WHERE bc.category_id IN (:categoryIds)",
    nativeQuery = true
  )
  Page<Book> findByCategoryIdsIn(Pageable pageable, List<String> categoryIds);

  @Query(
    value = "SELECT b.* FROM books b " +
    "INNER JOIN books_categories bc " +
    "ON b.id = bc.book_id " +
    "WHERE bc.category_id IN (:categoryIds)" +
    "AND b.title LIKE %:title%",
    countQuery = "SELECT COUNT(*) FROM books b " +
    "INNER JOIN books_categories bc " +
    "ON b.id = bc.book_id " +
    "WHERE bc.category_id IN (:categoryIds)" +
    "AND b.title LIKE %:title%",
    nativeQuery = true
  )
  Page<Book> findByTitleContainingIgnoreCaseAndCategoryIdsIn(
    Pageable pageable,
    @Param("title") String title,
    @Param("categoryIds") List<String> categoryIds
  );

  @Query(
    value = "SELECT b.* FROM books b " +
    "INNER JOIN books_authors ba " +
    "ON b.id = ba.book_id " +
    "WHERE ba.author_id = :authorId",
    countQuery = "SELECT COUNT(*) FROM books b " +
    "INNER JOIN books_authors ba " +
    "ON b.id = ba.book_id " +
    "WHERE ba.author_id = :authorId",
    nativeQuery = true
  )
  Page<Book> findByAuthorId(Pageable pageable, @Param("authorId") String authorId);

  @Query(
    value = "SELECT b FROM Book b JOIN FETCH b.userFavouriteBooks fb WHERE fb.userId = :userId",
    countQuery = "SELECT COUNT(b) FROM Book b JOIN b.userFavouriteBooks fb WHERE fb.userId = :userId"
  )
  Page<Book> findFavouriteBooksByUserId(Pageable pageable, String userId);
}
