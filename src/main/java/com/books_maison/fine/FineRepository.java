package com.books_maison.fine;

import com.books_maison.fine.entity.Fine;
import java.util.Optional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface FineRepository extends JpaRepository<Fine, String> {
  @Query(
    value = "SELECT f FROM Fine f WHERE f.checkout.user.id = :userId",
    countQuery = "SELECT COUNT(f) FROM Fine f WHERE f.checkout.user.id = :userId"
  )
  Page<Fine> findAllByUserId(Pageable pageable, @Param("userId") String userId);
}
