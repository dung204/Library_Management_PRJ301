package com.books_maison.book.entity;

import com.books_maison.author.entity.Author;
import com.books_maison.category.entity.Category;
import com.books_maison.user.entity.User;
import com.books_maison.user_favourite_book.entity.UserFavouriteBook;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.Nationalized;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "books")
public class Book {

  @Id
  @GeneratedValue(strategy = GenerationType.UUID)
  private String id;

  @Column
  private String isbn;

  @Column(nullable = false)
  @Nationalized
  private String title;

  @Column
  private Integer publishedYear;

  @Column
  @Nationalized
  private String publisher;

  @Column
  @Nationalized
  private String language;

  @Column
  private String numberOfPages;

  @Column
  private String imageUrl;

  @Column(columnDefinition = "NTEXT")
  private String description;

  @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
  @JoinTable(
    name = "books_authors",
    joinColumns = @JoinColumn(name = "book_id"),
    inverseJoinColumns = @JoinColumn(name = "author_id")
  )
  private List<Author> authors;

  @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
  @JoinTable(
    name = "books_categories",
    joinColumns = @JoinColumn(name = "book_id"),
    inverseJoinColumns = @JoinColumn(name = "category_id")
  )
  private List<Category> categories;

  @Column
  private Integer quantity;

  @OneToMany(mappedBy = "bookId", targetEntity = UserFavouriteBook.class)
  private List<UserFavouriteBook> userFavouriteBooks;
}
