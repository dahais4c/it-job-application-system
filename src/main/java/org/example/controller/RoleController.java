package org.example.controller;

import org.example.entity.Role;
import org.example.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/roles")
public class RoleController {

    private final RoleService roleService;

    @Autowired
    public RoleController(RoleService roleService) {
        this.roleService = roleService;
    }

    // 添加岗位
    @PostMapping
    public ResponseEntity<Role> addRole(@RequestBody Role role) {
        Role savedRole = roleService.addRole(role);
        return new ResponseEntity<>(savedRole, HttpStatus.CREATED);
    }

    // 获取所有岗位列表
    @GetMapping
    public ResponseEntity<List<Role>> getAllRoles() {
        List<Role> roles = roleService.getAllRoles();
        return ResponseEntity.ok(roles);
    }

    // 根据ID获取岗位
    @GetMapping("/{id}")
    public ResponseEntity<Role> getRoleById(@PathVariable Integer id) {
        return roleService.getRoleById(id)
                .map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    // 更新岗位信息
    @PutMapping("/{id}")
    public ResponseEntity<Role> updateRole(@PathVariable Integer id, @RequestBody Role role) {
        try {
            Role updatedRole = roleService.updateRole(id, role);
            return ResponseEntity.ok(updatedRole);
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        }
    }

    // 删除岗位
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteRole(@PathVariable Integer id) {
        try {
            roleService.deleteRole(id);
            return ResponseEntity.noContent().build();
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        }
    }

    // 根据企业名称搜索岗位
    @GetMapping("/search/company")
    public ResponseEntity<List<Role>> searchByCompanyName(@RequestParam String name) {
        List<Role> roles = roleService.searchByCompanyName(name);
        return ResponseEntity.ok(roles);
    }

    // 根据岗位名称搜索岗位
    @GetMapping("/search/job")
    public ResponseEntity<List<Role>> searchByJobTitle(@RequestParam String title) {
        List<Role> roles = roleService.searchByJobTitle(title);
        return ResponseEntity.ok(roles);
    }

    // 根据薪资范围搜索岗位
    @GetMapping("/search/salary")
    public ResponseEntity<List<Role>> searchBySalary(@RequestParam String salary) {
        List<Role> roles = roleService.searchBySalary(salary);
        return ResponseEntity.ok(roles);
    }
}