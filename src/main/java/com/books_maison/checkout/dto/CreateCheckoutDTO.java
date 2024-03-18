package com.books_maison.checkout.dto;

import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.UUID;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CreateCheckoutDTO {

  @NotNull
  @UUID
  private String bookId;

  @NotNull
  @UUID
  private String userId;
}
