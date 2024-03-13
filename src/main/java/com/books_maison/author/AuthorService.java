package com.books_maison.author;

import java.util.List;

import org.springframework.stereotype.Service;

import com.books_maison.author.entity.Author;

@Service
public class AuthorService {
  private final AuthorRepository authorRepository;

  public AuthorService(AuthorRepository authorRepository) {
    this.authorRepository = authorRepository;
  }

  public Author createAuthor(Author author) {
    return authorRepository.save(author);
  }

  public Author getAuthorById(String id) {
    if (id == null)
      throw new IllegalArgumentException("Author id cannot be null");

    return authorRepository.findById(id).orElseThrow(() -> new RuntimeException("Author not found"));
  }

  public Author updateAuthor(Author author) {
    return authorRepository.save(author);
  }

  public void deleteAuthor(String id) {
    authorRepository.deleteById(id);
  }

  public List<Author> getAllAuthors() {
    return authorRepository.findAll();
  }
}
