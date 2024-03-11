package com.books_maison.book;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/book")
public class BookController {
  @GetMapping("/details/{id}")
  public String details(@PathVariable String id, Model model) {
    return "pages/book-details";
  }
}