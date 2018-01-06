package com.lance.service;

import com.lance.bean.UserRoles;

import java.util.List;

/**
 * Created by lance on 2018/1/5.
 */
public interface UserRoleService {
    public List<UserRoles> findUserRoles(String username);
}
