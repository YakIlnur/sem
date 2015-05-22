package com.springapp.mvc.controllers;

import com.springapp.mvc.dao.PostRepository;
import com.springapp.mvc.entity.Post;
import com.springapp.mvc.exceptions.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Calendar;
import java.util.List;

@Controller
public class PostsController {

    @Autowired
    private PostRepository postRepository;

    @ExceptionHandler(ResourceNotFoundException.class)
    public String handleResourceNotFoundException() {
        return "notfound";
    }

    @RequestMapping(value = "/posts/{id:[1-9]+[0-9]*}", method = RequestMethod.GET)
    public String show(ModelMap map, @PathVariable long id) {
        //if (id == 0) throw new ResourceNotFoundException();
        Post post = postRepository.find(id);
        if (post == null) throw new ResourceNotFoundException();
        List<Post> posts = postRepository.findAll();
        map.put("post", post);
        map.put("posts", posts);
        return "posts/show";
    }

    @RequestMapping(value = "/posts/{id:[1-9]+[0-9]*}/delete", method = RequestMethod.GET)
    public ModelAndView delete(@PathVariable long id){
        postRepository.deletePost(id);
        return new ModelAndView("redirect:/");
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(ModelMap map) {
        List<Post> posts = postRepository.findAll();
        map.put("posts", posts);
        return "posts/index";
    }

    @RequestMapping(value = "/posts/new", method = RequestMethod.GET)
    public ModelAndView addNewPost() {
        ModelAndView modelAndView = new ModelAndView("posts/new");
        Post post = new Post();
        modelAndView.addObject("post1", post);
        return modelAndView;
    }

    @RequestMapping(value = "/post/new", method = RequestMethod.POST)
    public ModelAndView savePost(@ModelAttribute("post1")Post post){
        User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = user.getUsername();

        //получение даты и преобразование ее в sql.date
        Calendar c1 = Calendar.getInstance();
        java.util.Date date1 = c1.getTime();
        java.sql.Date sqlDate = new java.sql.Date(date1.getTime());

        postRepository.addPost(post,username,sqlDate);

        return new ModelAndView("redirect:/");
    }

    @PreAuthorize("isAuthenticated()")
    @RequestMapping(value = "/myBlog", method = RequestMethod.GET)
    public String myBlog(ModelMap map) {
        User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = user.getUsername();
        List<Post> posts = postRepository.findAllWithUsername(username);
        map.put("posts", posts);
        return "posts/index";
    }
}
