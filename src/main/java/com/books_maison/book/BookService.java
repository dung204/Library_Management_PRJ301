package com.books_maison.book;

import com.books_maison.book.entity.Book;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
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

    return bookRepository.findByTitleContainingIgnoreCase(pageable, keyword);
  }

  public Page<Book> getPaginatedBooks(Pageable pageable, List<String> categoryIds, String keyword) {
    if (pageable == null) throw new IllegalArgumentException("Pageable is required");

    boolean categoryIdsAreNullOrEmpty = categoryIds == null || categoryIds.isEmpty();
    boolean keywordIsNull = keyword == null;

    if (categoryIdsAreNullOrEmpty && !keywordIsNull) return getPaginatedBooks(pageable, keyword);

    if (!categoryIdsAreNullOrEmpty && keywordIsNull) return getPaginatedBooks(pageable, categoryIds);

    if (categoryIdsAreNullOrEmpty && keywordIsNull) return getPaginatedBooks(pageable);

    return bookRepository.findByTitleContainingIgnoreCaseAndCategoryIdsIn(pageable, keyword, categoryIds);
  }

  public Long getTotalBookCount() {
    return bookRepository.count();
  }

  public Book getBookById(String id) {
    if (id == null || id.isEmpty()) throw new IllegalArgumentException("Book id is required");

    return bookRepository.findById(id).orElseThrow(() -> new RuntimeException("Book not found"));
  }
}
