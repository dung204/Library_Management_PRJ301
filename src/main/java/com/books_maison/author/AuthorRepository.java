package com.books_maison.author;

import org.springframework.data.jpa.repository.JpaRepository;

import com.books_maison.author.entity.Author;

public interface AuthorRepository extends JpaRepository<Author, String> {

}