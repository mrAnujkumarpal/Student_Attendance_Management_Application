package com.bit.sams.repository;

import com.bit.sams.entity.user.ApplicationUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AppUserRepository extends JpaRepository<ApplicationUser,Integer> {

    ApplicationUser findByEmail(String email);

    List<ApplicationUser> findByEnabled(boolean enabled);

    ApplicationUser findByEmailAndPasswordAndEnabled(String email, String password, boolean enabled);

}