package com.springapp.mvc.controllers;

import com.springapp.mvc.dao.IUserRepository;
import com.springapp.mvc.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

@Controller
public class AdminController {

    @Autowired
    private IUserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public ModelAndView adminPage() {

        ModelAndView model = new ModelAndView();
        model.addObject("mess", "Page is for ADMIN only! :3");

        List<User> listUser = userRepository.findAll();
        model.addObject("listUser", listUser);

        model.setViewName("admin");
        return model;
    }

    @PreAuthorize(value = "hasRole('ROLE_ADMIN')")
    @RequestMapping(value = "users/{username}/edit", method = RequestMethod.GET)
    public ModelAndView userEdit(HttpServletRequest request){
        String username = request.getParameter("username");
        String role = request.getParameter("role");
        userRepository.editUser(username, role);
        return new ModelAndView("redirect:/admin");
    }

    @PreAuthorize(value = "hasRole('ROLE_ADMIN')")
    @RequestMapping(value = "/deleteUser", method = RequestMethod.GET)
    public ModelAndView deleteUser(HttpServletRequest request) {
        String username = request.getParameter("username");
        userRepository.delete(username);
        return new ModelAndView("redirect:/admin");
    }

    @RequestMapping(value = "/sign_in", method = RequestMethod.GET)
    public ModelAndView sign_in(@RequestParam(value = "error", required = false) String error) {

        ModelAndView model = new ModelAndView();
        if (error != null) {
            model.addObject("error", "Invalid username and password!");
            model.setViewName("sign_in");
        }
        return model;
    }

    @RequestMapping(value = "/logout", method = RequestMethod.POST)
    public ModelAndView logout() {
        return new ModelAndView("redirect:/");
    }

    @RequestMapping(value = "/sign_up", method = RequestMethod.GET)
    public ModelAndView addNewUser() {
        ModelAndView modelAndView = new ModelAndView("sign_up");
        User user = new User();
        modelAndView.addObject("user", user);
        return modelAndView;
    }

    @RequestMapping(value = "/saveUser", method = RequestMethod.POST)
    public ModelAndView addingUser(
            @ModelAttribute("user")
            @Valid User user,
            BindingResult bindingResult) {

        if(bindingResult.hasErrors()){
            return new ModelAndView("sign_up");
        }

        else {
            user.setPassword(passwordEncoder.encode(user.getPassword()));
            userRepository.addUser(user);
            return new ModelAndView("redirect:/");
        }
    }

    @RequestMapping(value = "/redirect", method = RequestMethod.GET)
    public ModelAndView redirect() {
        return new ModelAndView("redirect:/");
    }

    @RequestMapping(value = "/ajax", method = RequestMethod.POST)
    public @ResponseBody
    String login(@RequestParam String username, @RequestParam String password) {
        UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(username, password);
        User user = userRepository.findByUsername(username);
        token.setDetails(user);
        boolean passwordCorrect = passwordEncoder.matches(password,user.getPassword());
        if(user != null && passwordCorrect){
            SecurityContextHolder.getContext().setAuthentication(token);
            return "ok";
        }
        else return "bad";
    }

}
