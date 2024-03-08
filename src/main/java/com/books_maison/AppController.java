package com.books_maison;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class AppController {
  @GetMapping
  private String showHomePage() {
    return "pages/index";
  }

  @GetMapping("/search")
  private String showSearchPage() {
    return "pages/search";
  }
}
