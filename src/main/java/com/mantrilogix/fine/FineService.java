package com.mantrilogix.fine;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mantrilogix.fine.entity.Fine;

@Service
public class FineService {
  private FineRepository fineRepository;

  public FineService(FineRepository fineRepository) {
    this.fineRepository = fineRepository;
  }

  public Fine getFine(String checkoutId) {
    return fineRepository.findByCheckoutId(checkoutId).orElse(null);
  }

  public void deleteFine(String checkoutId) {
    fineRepository.deleteByCheckoutId(checkoutId);
  }

  public Fine updateFine(Fine fine) {
    return fineRepository.save(fine);
  }

  public Fine createFine(Fine fine) {
    return fineRepository.save(fine);
  }

  public List<Fine> getAllFines() {
    return fineRepository.findAll();
  }

}