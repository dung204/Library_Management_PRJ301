package com.mantrilogix.book;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mantrilogix.book.entity.Book;

@Repository
public interface BookRepository extends JpaRepository<Book, String> {

}