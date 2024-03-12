package com.books_maison.user;

import java.util.Optional;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.books_maison.role.RoleRepository;
import com.books_maison.user.dto.CreateUserDTO;
import com.books_maison.user.entity.User;

@Service
public class UserService {
  private final UserRepository userRepository;
  private final RoleRepository roleRepository;
  private final PasswordEncoder passwordEncoder;

  public UserService(UserRepository userRepository, RoleRepository roleRepository,
      PasswordEncoder passwordEncoder) {
    this.userRepository = userRepository;
    this.roleRepository = roleRepository;
    this.passwordEncoder = passwordEncoder;
  }

  public User createUser(CreateUserDTO createUserDTO) {
    User user = new User();
    user.setEmail(createUserDTO.getEmail());
    user.setPassword(passwordEncoder.encode(createUserDTO.getPassword()));
    user.setFirstName(createUserDTO.getFirstName());
    user.setLastName(createUserDTO.getLastName());
    user.setAddress(createUserDTO.getAddress());
    user.setRole(roleRepository.findByName("USER"));
    return userRepository.save(user);
  }

  public User getUser(String id) {
    return userRepository.findById(id).orElse(null);
  }

  public Optional<User> getUserByEmail(String email) {
    return userRepository.findByEmail(email);
  }

  public User updateUser(User user) {
    return userRepository.save(user);
  }

  public void deleteUser(String id) {
    userRepository.deleteById(id);
  }
}