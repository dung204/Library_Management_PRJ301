package com.mantrilogix.category;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mantrilogix.category.entity.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, String> {

}