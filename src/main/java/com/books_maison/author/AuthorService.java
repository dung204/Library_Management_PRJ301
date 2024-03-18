package com.books_maison.author;

import com.books_maison.author.entity.Author;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class AuthorService {

  private final AuthorRepository authorRepository;

  public AuthorService(AuthorRepository authorRepository) {
    this.authorRepository = authorRepository;
  }

  public Page<Author> getPaginatedAuthors(Pageable pageable) {
    if (pageable == null) throw new IllegalArgumentException("Pageable is required");

    return authorRepository.findAll(pageable);
  }

  public Page<Author> getPaginatedAuthors(Pageable pageable, String keyword) {
    if (pageable == null) throw new IllegalArgumentException("Pageable is required");

    if (keyword == null) return getPaginatedAuthors(pageable);

    return authorRepository.findByAllCriteriaContainingIgnoreCase(pageable, keyword);
  }

  public Page<Author> getPaginatedAuthors(Pageable pageable, List<String> categoryIds) {
    if (pageable == null) throw new IllegalArgumentException("Pageable is required");

    if (categoryIds == null || categoryIds.isEmpty()) return getPaginatedAuthors(pageable);

    return authorRepository.findByContainingBooksWithCategoriesIn(pageable, categoryIds);
  }

  public Page<Author> getPaginatedAuthors(Pageable pageable, List<String> categoryIds, String keyword) {
    if (pageable == null) throw new IllegalArgumentException("Pageable is required");

    boolean categoryIdsAreNullOrEmpty = categoryIds == null || categoryIds.isEmpty();
    boolean keywordIsNull = keyword == null;

    if (categoryIdsAreNullOrEmpty && !keywordIsNull) return getPaginatedAuthors(pageable, keyword);

    if (!categoryIdsAreNullOrEmpty && keywordIsNull) return getPaginatedAuthors(pageable, categoryIds);

    if (categoryIdsAreNullOrEmpty && keywordIsNull) return getPaginatedAuthors(pageable);

    return authorRepository.findByAllCriteriaContainingIgnoreCaseAndContainingBooksWithCategoriesIn(
      pageable,
      keyword,
      categoryIds
    );
  }

  public Long getTotalAuthorCount() {
    return authorRepository.count();
  }

  public Author getAuthorById(String id) {
    if (id == null) throw new IllegalArgumentException("Author id cannot be null");

    return authorRepository.findById(id).orElseThrow(() -> new RuntimeException("Author not found"));
  }
}
