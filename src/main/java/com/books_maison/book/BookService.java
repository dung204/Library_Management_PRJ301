package com.books_maison.book;

import org.springframework.stereotype.Service;

import com.books_maison.book.entity.Book;

@Service
public class BookService {
  private BookRepository bookRepository;

  public BookService(BookRepository bookRepository) {
    this.bookRepository = bookRepository;
  }

  public Book createBook(Book book) {
    return bookRepository.save(book);
  }

  public Book getBook(String id) {
    return bookRepository.findById(id).orElse(null);
  }

  public Book updateBook(Book book) {
    return bookRepository.save(book);
  }

  public void deleteBook(String id) {
    bookRepository.deleteById(id);
  }
}