package com.springapp.mvc.controllers;

import com.springapp.mvc.dao.IUserRepository;
import com.springapp.mvc.entity.User;
import com.springapp.mvc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Map;

@Controller
@RequestMapping("/users")
public class UsersController {

    @Autowired
    private IUserRepository userRepository;

    @Autowired
    private UserService userService;

   @RequestMapping(value = "/{username}", method = RequestMethod.GET)
    public String show(ModelMap map, @PathVariable String username){
        User user = userRepository.findByUsername(username);
        map.put("username", user.getUsername());
        return "users/show";
    }

    @PreAuthorize("isAuthenticated()")
    @RequestMapping(method = RequestMethod.GET)
    public String listContacts(Map<String, Object> map) {

        map.put("user", new User());
        map.put("users", userService.listUser());

        return "users/index";
    }
}
