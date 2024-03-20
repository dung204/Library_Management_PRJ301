package com.books_maison.user.entity;

import com.books_maison.checkout.entity.Checkout;
import com.books_maison.role.entity.Role;
import com.books_maison.user_favourite_book.entity.UserFavouriteBook;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import java.time.LocalDateTime;
import java.util.Collection;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.Nationalized;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "users")
public class User implements UserDetails {

  @Id
  @GeneratedValue(strategy = GenerationType.UUID)
  private String id;

  @Column(nullable = false, unique = true)
  private String email;

  @Column(nullable = false)
  private String password;

  @Column(nullable = false)
  @Nationalized
  private String firstName;

  @Column(nullable = false)
  @Nationalized
  private String lastName;

  @Column
  @Nationalized
  private String address;

  @Column
  private String imageUrl;

  @Column(nullable = false)
  @CreationTimestamp
  private LocalDateTime createdTimestamp;

  @Column(nullable = false)
  @UpdateTimestamp
  private LocalDateTime updatedTimestamp;

  @ManyToOne
  @JoinColumn(name = "role_id", referencedColumnName = "id", nullable = false)
  private Role role;

  @OneToMany(mappedBy = "id", targetEntity = Checkout.class)
  private List<Checkout> checkouts;

  @OneToMany(mappedBy = "userId", targetEntity = UserFavouriteBook.class)
  private List<UserFavouriteBook> userFavouriteBooks;

  public String getFullName() {
    return firstName + " " + lastName;
  }

  @Override
  public Collection<? extends GrantedAuthority> getAuthorities() {
    return List.of(new SimpleGrantedAuthority(role.getName()));
  }

  @Override
  public String getUsername() {
    return email;
  }

  @Override
  public boolean isAccountNonExpired() {
    return true;
  }

  @Override
  public boolean isAccountNonLocked() {
    return true;
  }

  @Override
  public boolean isCredentialsNonExpired() {
    return true;
  }

  @Override
  public boolean isEnabled() {
    return true;
  }
}
