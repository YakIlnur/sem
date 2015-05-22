package com.springapp.mvc.dao.hibernate;

import com.springapp.mvc.entity.User;

import java.util.List;

public interface UserDAO {
    public List<User> listUser();
}