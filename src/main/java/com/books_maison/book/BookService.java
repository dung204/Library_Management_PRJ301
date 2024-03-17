package com.books_maison.book;

import com.books_maison.book.entity.Book;
import jakarta.transaction.Transactional;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class BookService {

  private BookRepository bookRepository;

  public BookService(BookRepository bookRepository) {
    this.bookRepository = bookRepository;
  }

  public List<Book> getAllBooks() {
    return bookRepository.findAll();
  }

  public Page<Book> getPaginatedBooks(Pageable pageable) {
    if (pageable == null) throw new IllegalArgumentException("Pageable is required");

    return bookRepository.findAll(pageable);
  }

  public Page<Book> getPaginatedBooks(Pageable pageable, List<String> categoryIds) {
    if (pageable == null) throw new IllegalArgumentException("Pageable is required");

    if (categoryIds == null || categoryIds.isEmpty()) return getPaginatedBooks(pageable);

    return bookRepository.findByCategoryIdsIn(pageable, categoryIds);
  }

  public Page<Book> getPaginatedBooks(Pageable pageable, String keyword) {
    if (pageable == null) throw new IllegalArgumentException("Pageable is required");

    if (keyword == null) return getPaginatedBooks(pageable);

    return bookRepository.findByAllCriteriaContainingIgnoreCase(pageable, keyword);
  }

  public Page<Book> getPaginatedBooks(Pageable pageable, List<String> categoryIds, String keyword) {
    if (pageable == null) throw new IllegalArgumentException("Pageable is required");

    boolean categoryIdsAreNullOrEmpty = categoryIds == null || categoryIds.isEmpty();
    boolean keywordIsNull = keyword == null;

    if (categoryIdsAreNullOrEmpty && !keywordIsNull) return getPaginatedBooks(pageable, keyword);

    if (!categoryIdsAreNullOrEmpty && keywordIsNull) return getPaginatedBooks(pageable, categoryIds);

    if (categoryIdsAreNullOrEmpty && keywordIsNull) return getPaginatedBooks(pageable);

    return bookRepository.findByAllCriteriaContainingIgnoreCaseAndCategoryIdsIn(pageable, keyword, categoryIds);
  }

  public Page<Book> getPaginatedBooksByAuthorId(Pageable pageable, String authorId) {
    if (pageable == null) throw new IllegalArgumentException("Pageable is required");
    if (authorId == null || authorId.isEmpty()) throw new IllegalArgumentException("Author id is required");

    return bookRepository.findByAuthorId(pageable, authorId);
  }

  public Page<Book> getPaginatedFavouriteBooksByUserId(Pageable pageable, String userId) {
    if (pageable == null) throw new IllegalArgumentException("Pageable is required");
    if (userId == null || userId.isEmpty()) throw new IllegalArgumentException("User id is required");

    return bookRepository.findFavouriteBooksByUserId(pageable, userId);
  }

  public Long getTotalBookCount() {
    return bookRepository.count();
  }

  public Book getBookById(String id) {
    if (id == null || id.isEmpty()) throw new IllegalArgumentException("Book id is required");

    return bookRepository.findById(id).orElseThrow(() -> new RuntimeException("Book not found"));
  }
}
