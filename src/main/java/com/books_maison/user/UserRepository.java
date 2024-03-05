package com.books_maison.user;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.books_maison.user.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, String> {

}