package com.lance.service.impl;

import com.lance.bean.UserRoles;
import com.lance.dao.mapper.UserRolesMapper;
import com.lance.service.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by lance on 2018/1/5.
 */
@Service
public class UserRoleServiceImpl implements UserRoleService {
    @Autowired
    UserRolesMapper userRolesMapper;
    @Override
    public List<UserRoles> findUserRoles(String username) {
        System.out.println("正在查询");
       List<UserRoles> userRoles=userRolesMapper.selectByUsername(username);
        for (UserRoles userrole:userRoles) {
            System.out.println(userrole+"!!!!!!!!!!!!!!!!!");

        }
        return null;
    }
}
