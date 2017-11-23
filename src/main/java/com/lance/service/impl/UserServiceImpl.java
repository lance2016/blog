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
        UserExample example = new UserExample();
        return userMapper.selectByExample(example);
    }

    //通过用户id查询
    @Override
    public User getUserById(Integer id) {
        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();
        if (!"".equals(id == null ? "" : id)) {

            criteria.andIdEqualTo(id);
        }
        return userMapper.selectByPrimaryKey(id);
    }

    //通过用户名查询
    @Override
    public User getUserByUsername(String username) {
        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();
        if (!"".equals(username == null ? "" : username)) {

            criteria.andUsernameEqualTo(username);
        }
        return userMapper.selectByUsername(username);
    }

    //添加用户
    @Override
    public int addUser(User user) {
        return userMapper.insert(user);
    }

    @Override
    public int deleteUserById(Integer id) {

        return userMapper.deleteByPrimaryKey(id);
    }


    @Override
    public int updateUser(User user) {

        return userMapper.updateByPrimaryKey(user);
    }








}
