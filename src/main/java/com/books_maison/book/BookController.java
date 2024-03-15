package com.books_maison.book;

import com.books_maison.book.entity.Book;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/book")
public class BookController {

  private final BookService bookService;

  public BookController(BookService bookService) {
    this.bookService = bookService;
  }

  @GetMapping("/{id}")
  public String details(@PathVariable String id, Model model) {
    Book book = bookService.getBookById(id);

    model.addAttribute("book", book);
    return "pages/book-details";
  }
}
