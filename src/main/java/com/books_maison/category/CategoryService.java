package com.books_maison.category;

import com.books_maison.category.entity.Category;
import java.util.List;
import java.util.Optional;
import org.springframework.stereotype.Service;

@Service
public class CategoryService {

  private CategoryRepository categoryRepository;

  public CategoryService(CategoryRepository categoryRepository) {
    this.categoryRepository = categoryRepository;
  }

  public Optional<Category> getCategoryById(String id) {
    if (id == null || id.isEmpty()) throw new IllegalArgumentException("Id cannot be null or empty");

    return categoryRepository.findById(id);
  }

  public List<Category> getAllCategories() {
    return categoryRepository.findAll();
  }
}
