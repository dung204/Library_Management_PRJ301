package com.books_maison.author;

import com.books_maison.author.entity.Author;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface AuthorRepository extends JpaRepository<Author, String> {
  @Query(
    value = "SELECT a " +
    "FROM Author a " +
    "WHERE a.name LIKE '%' || :keyword || '%' " +
    "OR a.biography LIKE '%' || :keyword || '%'",
    countQuery = "SELECT COUNT(a) " +
    "FROM Author a " +
    "WHERE a.name LIKE '%' || :keyword || '%' " +
    "OR a.biography LIKE '%' || :keyword || '%'"
  )
  Page<Author> findByAllCriteriaContainingIgnoreCase(Pageable pageable, @Param("keyword") String keyword);

  @Query(
    value = "SELECT a " +
    "FROM Author a " +
    "JOIN a.books ab " +
    "JOIN ab.categories abc " +
    "WHERE abc.id IN (:categoryIds)",
    countQuery = "SELECT COUNT(a) " +
    "FROM Author a " +
    "JOIN a.books ab " +
    "JOIN ab.categories abc " +
    "WHERE abc.id IN (:categoryIds)"
  )
  Page<Author> findByContainingBooksWithCategoriesIn(Pageable pageable, @Param("categoryIds") List<String> categoryIds);

  @Query(
    value = "SELECT a " +
    "FROM Author a " +
    "JOIN a.books ab " +
    "JOIN ab.categories abc " +
    "WHERE a.name LIKE '%' || :keyword || '%' " +
    "OR a.biography LIKE '%' || :keyword || '%' " +
    "AND abc.id IN (:categoryIds)",
    countQuery = "SELECT COUNT(a) " +
    "FROM Author a " +
    "JOIN a.books ab " +
    "JOIN ab.categories abc " +
    "WHERE a.name LIKE '%' || :keyword || '%' " +
    "OR a.biography LIKE '%' || :keyword || '%' " +
    "AND abc.id IN (:categoryIds)"
  )
  Page<Author> findByAllCriteriaContainingIgnoreCaseAndContainingBooksWithCategoriesIn(
    Pageable pageable,
    @Param("keyword") String keyword,
    @Param("categoryIds") List<String> categoryIds
  );
}
