package com.books_maison;

import com.books_maison.author.AuthorService;
import com.books_maison.book.BookService;
import com.books_maison.book.entity.Book;
import com.books_maison.category.CategoryService;
import java.util.List;
import java.util.Optional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/")
public class AppController {

  private final AuthorService authorService;
  private final BookService bookService;
  private final CategoryService categoryService;

  public AppController(AuthorService authorService, BookService bookService, CategoryService categoryService) {
    this.authorService = authorService;
    this.bookService = bookService;
    this.categoryService = categoryService;
  }

  @GetMapping
  private String showHomePage() {
    return "pages/index";
  }

  @SuppressWarnings("null")
  @GetMapping("/search")
  private String showSearchPage(
    @RequestParam("page") Optional<Integer> page,
    @RequestParam("type") String resultType,
    @RequestParam("category") Optional<List<String>> categoryIds,
    @RequestParam("query") Optional<String> query,
    Model model
  ) {
    if (resultType.equals("book")) {
      Pageable pageable = PageRequest.of(page.isPresent() ? page.get() - 1 : 0, 10).withSort(
        Direction.fromString("DESC"),
        categoryIds.isPresent() ? "published_year" : "publishedYear"
      );

      Page<Book> paginatedBooks = bookService.getPaginatedBooks(pageable, categoryIds.orElse(null), query.orElse(""));
      model.addAttribute("paginatedBooks", paginatedBooks);
    }

    if (resultType.equals("author")) {
      Pageable pageable = PageRequest.of(page.orElse(1), 10).withSort(Direction.fromString("DESC"), "name");
    }

    model.addAttribute("totalBookCount", bookService.getTotalBookCount());
    model.addAttribute("totalAuthorCount", authorService.getTotalAuthorCount());
    model.addAttribute("categories", categoryService.getAllCategories());
    return "pages/search";
  }
}
