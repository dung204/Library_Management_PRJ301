package com.books_maison.security;

import com.books_maison.user.entity.User;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

public class SecurityUtils {

  public static User getCurrentSessionUser() {
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    if (authentication instanceof AnonymousAuthenticationToken) {
      return null;
    }

    User currentUser = (User) authentication.getPrincipal();
    return currentUser;
  }
}
