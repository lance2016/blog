package com.lance.service.impl;

import com.lance.bean.User;
import com.lance.bean.UserExample;
import com.lance.dao.mapper.UserMapper;
import com.lance.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by lance on 2017/11/21.
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;
    @Override
    public List<User> getAllUsers() {
        return null;
    }

    @Override
    public User getUserById(Integer id) {
        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();
        if (!"".equals(id == null ? "" : id)) {

            criteria.andIdEqualTo(id);
        }
        return userMapper.selectByPrimaryKey(id);
    }

    @Override
    public User getUserByUsername(String username) {
        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();
        if (!"".equals(username == null ? "" : username)) {

            criteria.andUsernameEqualTo(username);
        }
        return userMapper.selectByUsername(username);
    }

    @Override
    public int addUser(User user) {
        return 0;
    }

    @Override
    public int deleteUser(User user) {
        return 0;
    }

    @Override
    public int updateUser(User user) {
        return 0;
    }








}
