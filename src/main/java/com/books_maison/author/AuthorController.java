package com.books_maison.author;

import com.books_maison.author.entity.Author;
import com.books_maison.book.BookService;
import java.util.Optional;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/author")
public class AuthorController {

  private AuthorService authorService;
  private BookService bookService;

  public AuthorController(AuthorService authorService, BookService bookService) {
    this.authorService = authorService;
    this.bookService = bookService;
  }

  @GetMapping("/{id}")
  public String getAuthorDetails(
    @PathVariable String id,
    @RequestParam("tab") Optional<String> tab,
    @RequestParam("page") Optional<Integer> page,
    Model model
  ) {
    int pageNumber = page.orElse(1) - 1;

    Author author = authorService.getAuthorById(id);

    if (tab.isPresent() && tab.get().equals("books")) {
      Pageable pageable = PageRequest.of(pageNumber, 10).withSort(
        Direction.fromString("DESC"),
        "publishedYear"
      );

      model.addAttribute("paginatedBooks", bookService.getPaginatedBooksByAuthorId(pageable, author.getId()));
    }

    model.addAttribute("author", author);
    return "pages/author-details";
  }
}
