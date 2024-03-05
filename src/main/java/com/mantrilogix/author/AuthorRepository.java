package com.mantrilogix.author;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mantrilogix.author.entity.Author;

public interface AuthorRepository extends JpaRepository<Author, String> {

}