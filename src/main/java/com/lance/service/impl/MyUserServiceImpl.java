package com.lance.service.impl;

import com.lance.bean.UserRoles;
import com.lance.bean.Users;
import com.lance.dao.mapper.UserRolesMapper;
import com.lance.dao.mapper.UsersMapper;
import com.lance.service.UserService;
import com.lance.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.net.ssl.SSLSessionBindingEvent;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * Created by lance on 2018/1/4.
 */
@Service
public class MyUserServiceImpl implements UserDetailsService,UsersService {

    @Autowired
    UsersMapper usersMapper;

    @Autowired
    UserRolesMapper userRolesMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        Collection<SimpleGrantedAuthority> auths = new ArrayList<SimpleGrantedAuthority>();
        Users user = new Users();
        user = usersMapper.selectByUsername(username);
        if(user!=null){
            System.out.println("在user表中查询到了用户信息"+user);
            try {
                List<UserRoles> authStr = userRolesMapper.selectByUsername(username);
                for (UserRoles authName : authStr) {
                    System.out.println("权限信息"+authName.getRole());
                    SimpleGrantedAuthority authority = new SimpleGrantedAuthority(authName.getRole());
                    auths.add(authority);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            return new Users(user.getUsername(), user.getPassword(), user.getEnabled(), auths);
        }
        else{
            System.out.println("查询不到用户");
            return null;
        }

    }






    @Override
    public Users findUser(Integer id) {
        return null;
    }


    @Override
    public Users findUserByUserName(String username) {
        Users user=new Users();
        user=findUserByUserName(username);
        return null;
    }
}