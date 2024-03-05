package com.books_maison.book;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.books_maison.book.entity.Book;

@Repository
public interface BookRepository extends JpaRepository<Book, String> {

}