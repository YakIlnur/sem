package com.springapp.mvc.dao;

import com.springapp.mvc.entity.Post;

import java.util.List;

public interface IPostRepository {
    public Post find(long id);
    public List<Post> findAll();
    public List<Post> findAllWithUsername(String username);
    public void addPost(Post post, String username, java.sql.Date sqlDate);
    public void deletePost(long id);

}
