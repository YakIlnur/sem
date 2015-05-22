package com.springapp.mvc.dao;

import com.springapp.mvc.aop.MyLoggable;
import com.springapp.mvc.entity.User;

import java.util.List;

public interface IUserRepository {

    @MyLoggable
    public User findByUsername(String username);

    public void addUser(User user);

    public List<User> findAll();

    public void delete(String username);

    public void editUser(String username, String role );
}
