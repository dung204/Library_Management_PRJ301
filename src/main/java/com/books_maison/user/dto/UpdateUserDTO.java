package com.books_maison.user.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class UpdateUserDTO extends CreateUserDTO {
  private String confirmPassword;
}
