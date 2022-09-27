package com.bit.sams.config;

import com.bit.sams.entity.user.ApplicationUser;
import com.bit.sams.repository.AppUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Arrays;

@Service
public class AppUserDetailsService implements UserDetailsService {

    @Autowired
    AppUserRepository appUserRepository;

    @Override
    public UserDetails loadUserByUsername(String loginedEmail) throws UsernameNotFoundException {
        ApplicationUser user = appUserRepository.findByEmail(loginedEmail);

        if (null == user) {
            throw new UsernameNotFoundException("User not authorized");
        }
        GrantedAuthority grantedAuthority = new SimpleGrantedAuthority("USER");

        return new User(user.getEmail(), user.getPassword(), Arrays.asList(grantedAuthority));
    }
}
