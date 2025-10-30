package org.example.service.impl;

import org.example.entity.Role;
import org.example.repository.RoleRepository;
import org.example.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class RoleServiceImpl implements RoleService {

    private final RoleRepository roleRepository;

    @Autowired
    public RoleServiceImpl(RoleRepository roleRepository) {
        this.roleRepository = roleRepository;
    }

    @Override
    public Role addRole(Role role) {
        return roleRepository.save(role);
    }

    @Override
    public List<Role> getAllRoles() {
        return roleRepository.findAll();
    }

    @Override
    public Optional<Role> getRoleById(Integer id) {
        return roleRepository.findById(id);
    }

    @Override
    public Role updateRole(Integer id, Role roleDetails) {
        Role role = roleRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Role not found with id: " + id));

        // 更新岗位信息
        role.setCompanyName(roleDetails.getCompanyName());
        role.setJobTitle(roleDetails.getJobTitle());
        role.setSalary(roleDetails.getSalary());
        role.setRequirements(roleDetails.getRequirements());

        return roleRepository.save(role);
    }

    @Override
    public void deleteRole(Integer id) {
        Role role = roleRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Role not found with id: " + id));
        roleRepository.delete(role);
    }

    @Override
    public List<Role> searchByCompanyName(String companyName) {
        return roleRepository.findByCompanyNameContaining(companyName);
    }

    @Override
    public List<Role> searchByJobTitle(String jobTitle) {
        return roleRepository.findByJobTitleContaining(jobTitle);
    }

    @Override
    public List<Role> searchBySalary(String salary) {
        return roleRepository.findBySalaryContaining(salary);
    }
}