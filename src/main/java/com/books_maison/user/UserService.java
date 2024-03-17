package com.books_maison.user;

import com.books_maison.role.RoleRepository;
import com.books_maison.user.dto.CreateUserDTO;
import com.books_maison.user.dto.UpdateUserDTO;
import com.books_maison.user.entity.User;
import com.books_maison.user_favourite_book.UserFavouriteBookService;
import jakarta.transaction.Transactional;
import java.util.Optional;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class UserService {

  private final UserRepository userRepository;
  private final RoleRepository roleRepository;
  private final UserFavouriteBookService userFavouriteBookService;
  private final PasswordEncoder passwordEncoder;

  public UserService(
    UserRepository userRepository,
    RoleRepository roleRepository,
    UserFavouriteBookService userFavouriteBookService,
    PasswordEncoder passwordEncoder
  ) {
    this.userRepository = userRepository;
    this.roleRepository = roleRepository;
    this.passwordEncoder = passwordEncoder;
    this.userFavouriteBookService = userFavouriteBookService;
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

  public Optional<User> getUserByEmail(String email) {
    return userRepository.findByEmail(email);
  }

  public User updateUser(String id, UpdateUserDTO updateUserDTO) {
    if (id == null || id.trim().isEmpty()) throw new IllegalArgumentException("Invalid user id");

    User user = userRepository.findById(id).orElseThrow(() -> new UsernameNotFoundException("User not found"));
    return updateUser(user, updateUserDTO);
  }

  public User updateUser(User user, UpdateUserDTO updateUserDTO) {
    if (user == null) throw new IllegalArgumentException("Invalid user data");

    String newEmail = updateUserDTO.getEmail();
    String newPassword = updateUserDTO.getPassword();
    String newFirstName = updateUserDTO.getFirstName();
    String newLastName = updateUserDTO.getLastName();
    String newAddress = updateUserDTO.getAddress();

    if (newEmail != null && !newEmail.trim().equals(user.getEmail())) user.setEmail(newEmail);

    if (newPassword != null && !newPassword.trim().equals(user.getPassword())) user.setPassword(
      passwordEncoder.encode(newPassword)
    );

    if (newFirstName != null && !newFirstName.trim().equals(user.getFirstName())) user.setFirstName(newFirstName);

    if (newLastName != null && !newLastName.trim().equals(user.getLastName())) user.setLastName(newLastName);

    if (newAddress != null && !newAddress.trim().equals(user.getAddress())) user.setAddress(newAddress);

    return userRepository.save(user);
  }

  public void addFavouriteBook(User currentUser, String bookId) {
    if (currentUser == null) throw new IllegalArgumentException("Invalid user data");
    if (bookId == null || bookId.trim().isEmpty()) throw new IllegalArgumentException("Invalid book id");

    userFavouriteBookService.addOne(currentUser.getId(), bookId);
  }

  public void removeFavouriteBook(User currentUser, String bookId) {
    if (currentUser == null) throw new IllegalArgumentException("Invalid user data");
    if (bookId == null || bookId.trim().isEmpty()) throw new IllegalArgumentException("Invalid book id");

    userFavouriteBookService.removeOne(currentUser.getId(), bookId);
  }
}
