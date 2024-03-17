package com.books_maison.book;

import com.books_maison.book.entity.Book;
import java.util.List;

import org.antlr.v4.runtime.atn.SemanticContext.AND;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface BookRepository extends JpaRepository<Book, String> {
  // Find by all properties containing the given keyword
  @Query(
    value = "SELECT b " +
            "FROM Book b " +
            "JOIN b.authors ba " +
            "WHERE b.isbn LIKE '%' || :keyword || '%' " +
            "OR b.title LIKE '%' || :keyword || '%' " +
            "OR b.description LIKE '%' || :keyword || '%' " +
            "OR cast(b.publishedYear as string) LIKE '%' || :keyword || '%' " +
            "OR b.publisher LIKE '%' || :keyword || '%' " +
            "OR b.language LIKE '%' || :keyword || '%' " +
            "OR ba.name LIKE '%' || :keyword || '%'",
    countQuery = "SELECT COUNT(b) " +
                 "FROM Book b " +
                 "JOIN b.authors ba " +
                 "WHERE b.isbn LIKE '%' || :keyword || '%' " +
                 "OR b.title LIKE '%' || :keyword || '%' " +
                 "OR b.description LIKE '%' || :keyword || '%' " +
                 "OR cast(b.publishedYear as string) LIKE '%' || :keyword || '%' " +
                 "OR b.publisher LIKE '%' || :keyword || '%' " +
                 "OR b.language LIKE '%' || :keyword || '%' " +
                 "OR ba.name LIKE '%' || :keyword || '%'"
  )
  Page<Book> findByAllCriteriaContainingIgnoreCase(Pageable pageable, @Param("keyword") String keyword);

  @Query(
    value = "SELECT b " +
            "FROM Book b " +
            "JOIN b.authors ba " +
            "JOIN b.categories bc " +
            "WHERE b.isbn LIKE '%' || :keyword || '%' " +
            "OR b.title LIKE '%' || :keyword || '%' " +
            "OR b.description LIKE '%' || :keyword || '%' " +
            "OR cast(b.publishedYear as string) LIKE '%' || :keyword || '%' " +
            "OR b.publisher LIKE '%' || :keyword || '%' " +
            "OR b.language LIKE '%' || :keyword || '%' " +
            "OR ba.name LIKE '%' || :keyword || '%' " +
            "AND bc.id IN (:categoryIds)", 
    countQuery = "SELECT COUNT(b) " +
                 "FROM Book b " +
                 "JOIN b.authors ba " +
                 "JOIN b.categories bc " +
                 "WHERE b.isbn LIKE '%' || :keyword || '%' " +
                 "OR b.title LIKE '%' || :keyword || '%' " +
                 "OR b.description LIKE '%' || :keyword || '%' " +
                 "OR cast(b.publishedYear as string) LIKE '%' || :keyword || '%' " +
                 "OR b.publisher LIKE '%' || :keyword || '%' " +
                 "OR b.language LIKE '%' || :keyword || '%' " +
                 "OR ba.name LIKE '%' || :keyword || '%' " +
                 "AND bc.id IN (:categoryIds)"
  )
  Page<Book> findByAllCriteriaContainingIgnoreCaseAndCategoryIdsIn(
    Pageable pageable,
    @Param("keyword") String keyword,
    @Param("categoryIds") List<String> categoryIds
  );

  @Query(
    value = "SELECT b " +
            "FROM Book b " +
            "JOIN b.categories bc " +
            "WHERE bc.id IN (:categoryIds)",
    countQuery = "SELECT COUNT(b) " +
                 "FROM Book b " +
                 "JOIN b.categories bc " +
                 "WHERE bc.id IN (:categoryIds)"
  )
  Page<Book> findByCategoryIdsIn(Pageable pageable, List<String> categoryIds);

  @Query(
    value = "SELECT b " +
            "FROM Book b " +
            "JOIN b.authors ba " +
            "WHERE ba.id = :authorId",
    countQuery = "SELECT COUNT(b) " +
                 "FROM Book b " +
                 "JOIN b.authors ba " +
                 "WHERE ba.id = :authorId"
  )
  Page<Book> findByAuthorId(Pageable pageable, @Param("authorId") String authorId);

  @Query(
    value = "SELECT b FROM Book b JOIN b.userFavouriteBooks fb WHERE fb.userId = :userId",
    countQuery = "SELECT COUNT(b) FROM Book b JOIN b.userFavouriteBooks fb WHERE fb.userId = :userId"
  )
  Page<Book> findFavouriteBooksByUserId(Pageable pageable, @Param("userId") String userId);
}
