package com.books_maison.role.entity;

public enum RoleEnum {
  USER("USER"),
  ADMIN("ADMIN");

  public final String name;

  RoleEnum(String name) {
    this.name = name;
  }
}
