package com.lance.service;

import com.lance.bean.User;

import java.util.List;

/**
 * Created by lance on 2017/11/21.
 */
public interface UserService {
    public List<User> getAllUsers();
    public User getUserById(Integer id);
    public User getUserByUsername(String username);
    public int addUser(User user);
    public int deleteUserById(Integer id);
    public int updateUser(User user);
}
