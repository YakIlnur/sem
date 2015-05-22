package com.springapp.mvc.service;

import com.springapp.mvc.dao.hibernate.UserDAO;
import com.springapp.mvc.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAO userDAO;

    @Transactional
    public List<User> listUser() {
        return userDAO.listUser();
    }
}