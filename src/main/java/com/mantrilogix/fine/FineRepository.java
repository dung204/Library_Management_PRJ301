package com.mantrilogix.fine;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mantrilogix.fine.entity.Fine;

@Repository
public interface FineRepository extends JpaRepository<Fine, String> {

}