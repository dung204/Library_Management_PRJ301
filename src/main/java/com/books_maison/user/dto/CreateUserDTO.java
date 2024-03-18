package com.books_maison.user.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import lombok.Data;
import org.hibernate.validator.constraints.Length;

@Data
public class CreateUserDTO {

  @NotBlank(message = "Email không được để trống")
  @Email(message = "Email không hợp lệ")
  private String email;

  @NotEmpty(message = "Mật khẩu không được để trống")
  @Length(min = 8, message = "Mật khẩu phải có ít nhất 8 ký tự")
  private String password;

  @NotBlank(message = "Tên không được để trống")
  private String firstName;

  @NotBlank(message = "Họ không được để trống")
  private String lastName;

  private String address;
}
