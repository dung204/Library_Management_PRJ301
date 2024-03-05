package com.books_maison.category;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.books_maison.category.entity.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, String> {

}