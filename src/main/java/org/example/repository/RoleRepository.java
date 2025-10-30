package org.example.repository;

import org.example.entity.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoleRepository extends JpaRepository<Role, Integer>, JpaSpecificationExecutor<Role> {

    // 根据企业名称模糊查询
    List<Role> findByCompanyNameContaining(String companyName);

    // 根据岗位名称模糊查询
    List<Role> findByJobTitleContaining(String jobTitle);

    // 根据薪资范围模糊查询
    List<Role> findBySalaryContaining(String salary);
}