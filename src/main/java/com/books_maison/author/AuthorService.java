package com.books_maison.author;

import com.books_maison.author.entity.Author;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class AuthorService {

  private final AuthorRepository authorRepository;

  public AuthorService(AuthorRepository authorRepository) {
    this.authorRepository = authorRepository;
  }

  public List<Author> getAllAuthors() {
    return authorRepository.findAll();
  }

  public Long getTotalAuthorCount() {
    return authorRepository.count();
  }

  public Author getAuthorById(String id) {
    if (id == null) throw new IllegalArgumentException("Author id cannot be null");

    return authorRepository.findById(id).orElseThrow(() -> new RuntimeException("Author not found"));
  }
}
