package com.mantrilogix.user;

import org.springframework.stereotype.Service;

import com.mantrilogix.user.entity.User;

@Service
public class UserService {
  private final UserRepository userRepository;

  public UserService(UserRepository userRepository) {
    this.userRepository = userRepository;
  }

  public User createUser(User user) {
    return userRepository.save(user);
  }

  public User getUser(String id) {
    return userRepository.findById(id).orElse(null);
  }

  public User updateUser(User user) {
    return userRepository.save(user);
  }

  public void deleteUser(String id) {
    userRepository.deleteById(id);
  }
}