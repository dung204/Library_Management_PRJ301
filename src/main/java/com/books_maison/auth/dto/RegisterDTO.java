package com.books_maison.auth.dto;

import com.books_maison.user.dto.CreateUserDTO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class RegisterDTO extends CreateUserDTO {
  private String confirmPassword;
}
