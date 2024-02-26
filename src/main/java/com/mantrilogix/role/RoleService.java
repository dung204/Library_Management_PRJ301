package com.mantrilogix.role;

import org.springframework.stereotype.Service;

import com.mantrilogix.role.entity.Role;

@Service
public class RoleService {
  private final RoleRepository roleRepository;

  public RoleService(RoleRepository roleRepository) {
    this.roleRepository = roleRepository;
  }

  public Role createRole(Role role) {
    return roleRepository.save(role);
  }

  public Role getRole(Integer id) {
    return roleRepository.findById(id).orElse(null);
  }

  public Role updateRole(Role role) {
    return roleRepository.save(role);
  }

  public void deleteRole(Integer id) {
    roleRepository.deleteById(id);
  }
}