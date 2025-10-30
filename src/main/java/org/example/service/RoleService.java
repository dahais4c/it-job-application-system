package org.example.service;

import org.example.entity.Role;

import java.util.List;
import java.util.Optional;

public interface RoleService {

    // 添加岗位
    Role addRole(Role role);

    // 获取所有岗位列表
    List<Role> getAllRoles();

    // 根据ID获取岗位
    Optional<Role> getRoleById(Integer id);

    // 更新岗位信息
    Role updateRole(Integer id, Role roleDetails);

    // 删除岗位
    void deleteRole(Integer id);

    // 根据企业名称搜索岗位
    List<Role> searchByCompanyName(String companyName);

    // 根据岗位名称搜索岗位
    List<Role> searchByJobTitle(String jobTitle);

    // 根据薪资范围搜索岗位
    List<Role> searchBySalary(String salary);
}