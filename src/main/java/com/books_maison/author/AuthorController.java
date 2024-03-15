package com.books_maison.author;

import com.books_maison.author.entity.Author;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/author")
public class AuthorController {

  private AuthorService authorService;

  public AuthorController(AuthorService authorService) {
    this.authorService = authorService;
  }

  @GetMapping("/{id}")
  public String getAuthorDetails(@PathVariable String id, Model model) {
    Author author = authorService.getAuthorById(id);

    model.addAttribute("author", author);
    return "pages/author-details";
  }
}
