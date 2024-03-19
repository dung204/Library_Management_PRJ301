package com.books_maison;

import com.books_maison.author.AuthorService;
import com.books_maison.author.entity.Author;
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
  private String showHomePage(Model model) {
    model.addAttribute("featuredBooks", bookService.getFiveRandomBooks());
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
    int pageNumber = page.orElse(1) - 1;
    List<String> categoryIdsList = categoryIds.orElse(null);
    String queryStr = query.orElse("");

    model.addAttribute("categories", categoryService.getAllCategories());

    Pageable bookPageable = PageRequest.of(pageNumber, 10).withSort(Direction.DESC, "publishedYear");

    Page<Book> paginatedBooks = bookService.getPaginatedBooks(bookPageable, categoryIdsList, queryStr);
    model.addAttribute("paginatedBooks", paginatedBooks);
    model.addAttribute("totalBookCount", paginatedBooks.getTotalElements());

    Pageable authorPageable = PageRequest.of(pageNumber, 10).withSort(Direction.DESC, "name");
    Page<Author> paginatedAuthors = authorService.getPaginatedAuthors(authorPageable, categoryIdsList, queryStr);
    model.addAttribute("paginatedAuthors", paginatedAuthors);
    model.addAttribute("totalAuthorCount", paginatedAuthors.getTotalElements());

    return "pages/search";
  }
}
