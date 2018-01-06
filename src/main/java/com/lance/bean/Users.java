package com.lance.bean;


import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;

public class Users implements UserDetails{


    private String username;

    private String password;

    private Boolean enabled;

    public Users(){};



    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }







    public Users( String username, String password, boolean enabled,Collection<SimpleGrantedAuthority> authority) {
        super();
        this.username = username;
        this.password = password;
        this.enabled = enabled;
        this.authorities=authority;
    }


    @Override
    public String toString() {
        return "Users{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", enabled=" + enabled +
                ", authorities=" + authorities +
                '}';
    }

    private Collection<SimpleGrantedAuthority> authorities=new ArrayList();

    public void setAuthorities(Collection<SimpleGrantedAuthority> authorities)
    {
        this.authorities = authorities;
    }
    @Override
    public Collection<SimpleGrantedAuthority> getAuthorities() {
        // TODO Auto-generated method stub
        return authorities;
    }


    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}