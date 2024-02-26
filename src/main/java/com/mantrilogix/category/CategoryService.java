package com.mantrilogix.category;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mantrilogix.category.entity.Category;

@Service
public class CategoryService {
  private CategoryRepository categoryRepository;

  public CategoryService(CategoryRepository categoryRepository) {
    this.categoryRepository = categoryRepository;
  }

  public Category createCategory(Category category) {
    return categoryRepository.save(category);
  }

  public Category getCategory(String id) {
    return categoryRepository.findById(id).orElse(null);
  }

  public Category updateCategory(Category category) {
    return categoryRepository.save(category);
  }

  public void deleteCategory(String id) {
    categoryRepository.deleteById(id);
  }

  public List<Category> getAllCategories() {
    return categoryRepository.findAll();
  }
}