package com.mantrilogix.author;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mantrilogix.author.entity.Author;

@Service
public class AuthorService {
  private final AuthorRepository authorRepository;

  public AuthorService(AuthorRepository authorRepository) {
    this.authorRepository = authorRepository;
  }

  public Author createAuthor(Author author) {
    return authorRepository.save(author);
  }

  public Author getAuthor(String id) {
    return authorRepository.findById(id).orElse(null);
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
