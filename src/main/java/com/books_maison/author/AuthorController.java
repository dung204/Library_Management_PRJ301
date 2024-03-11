package com.books_maison.author;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/author")
public class AuthorController {
  @GetMapping("/details/{id}")
  public String getAuthorDetails() {
    return "pages/author-details";
  }
}
