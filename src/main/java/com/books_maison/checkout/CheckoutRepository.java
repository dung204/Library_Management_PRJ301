package com.books_maison.checkout;

import com.books_maison.checkout.entity.Checkout;
import com.books_maison.checkout_status.entity.CheckoutStatus;
import java.util.List;
import java.util.Optional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CheckoutRepository extends JpaRepository<Checkout, String> {
  @Query(
    "SELECT c FROM Checkout c " +
    "WHERE c.user.id = :userId " +
    "AND c.book.id = :bookId " +
    "AND c.status.id IN (1, 2)"
  )
  Optional<Checkout> findNotYetReturnedCheckoutByUserIdAndBookId(
    @Param("userId") String userId,
    @Param("bookId") String bookId
  );

  @Query(
    value = "SELECT c FROM Checkout c JOIN Book b ON c.book.id = b.id WHERE c.user.id = :userId",
    countQuery = "SELECT COUNT(c) FROM Checkout c JOIN Book b ON c.book.id = b.id WHERE c.user.id = :userId"
  )
  Page<Checkout> findAllByUserId(Pageable pageable, @Param("userId") String userId);

  @Query(
    "SELECT c FROM Checkout c " + "WHERE c.status.id = 1 " + "AND c.dueTimestamp < DATEADD(hour, 7, CURRENT_TIMESTAMP)"
  )
  List<Checkout> findAllNotYetMarkedOverdueCheckouts();
}
