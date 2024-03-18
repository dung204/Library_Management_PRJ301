package com.books_maison.fine;

import com.books_maison.fine.entity.Fine;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface FineRepository extends JpaRepository<Fine, String> {
  @Query(value = "SELECT f FROM Fine f WHERE f.checkout_id = :id", nativeQuery = true)
  Optional<Fine> findByCheckoutId(@Param("id") String checkoutId);

  @Query(value = "DELETE FROM Fine WHERE checkout_id = :id", nativeQuery = true)
  void deleteByCheckoutId(@Param("id") String checkoutId);
}
