package com.mantrilogix.user.entity;

import java.time.LocalDateTime;
import java.util.List;

import org.hibernate.annotations.CurrentTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import com.mantrilogix.checkout.entity.Checkout;
import com.mantrilogix.role.entity.Role;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@Entity
@Table(name = "users")
public class User {
  @Id
  @GeneratedValue(strategy = GenerationType.UUID)
  private String id;

  @Column(nullable = false, unique = true)
  private String email;

  @Column(nullable = false)
  private String password;

  @Column(nullable = false)
  private String firstName;

  @Column(nullable = false)
  private String lastName;

  @Column()
  private String address;

  @Column(nullable = false)
  @CurrentTimestamp
  private LocalDateTime createdTimestamp;

  @Column(nullable = false)
  @UpdateTimestamp
  private LocalDateTime updatedTimestamp;

  @ManyToOne
  @JoinColumn(name = "role_id", referencedColumnName = "id", nullable = false)
  private Role role;

  @OneToMany(mappedBy = "id", targetEntity = Checkout.class)
  private List<Checkout> checkouts;
}