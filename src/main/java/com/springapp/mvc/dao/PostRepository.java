package com.springapp.mvc.dao;

import com.springapp.mvc.entity.Post;
import com.springapp.mvc.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class PostRepository implements IPostRepository {
    private JdbcTemplate jdbcTemplate;

    @Autowired
    public void setDataSource(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public Post find(long id) {
        Post post = jdbcTemplate.queryForObject(
                "select * from posts where id = ?",
                new Object[]{id},
                new RowMapper<Post>() {
                    @Override
                    public Post mapRow(ResultSet rs, int rowNum) throws SQLException {
                        Post post = new Post();
                        post.setId(rs.getInt("id"));
                        post.setTitle(rs.getString("title"));
                        post.setContent(rs.getString("content"));
                        post.setData(rs.getDate("data"));
                        User user = jdbcTemplate.queryForObject(
                                "select * from users,authorities where (users.username = authorities.username and users.username = ?)",
                                new Object[]{rs.getString("username")},
                                new RowMapper<User>() {
                                    @Override
                                    public User mapRow(ResultSet resultSet, int i) throws SQLException {
                                        User user = new User();
                                        user.setUsername(resultSet.getString("username"));
                                        user.setAuthority(resultSet.getString("authority"));
                                        user.setEnabled(resultSet.getBoolean("enabled"));
                                        user.setPassword(resultSet.getString("password"));
                                        return user;
                                    }
                                });
                        post.setUser(user);
                        return post;
                    }
                });
        return post;
    }

    @Override
    public List<Post> findAll() {
        List<Post> post = this.jdbcTemplate.query(
                "select * from posts",
                new RowMapper<Post>() {
                    public Post mapRow(ResultSet rs, int rowNum) throws SQLException {
                        Post post = new Post();
                        post.setId(rs.getInt("id"));
                        post.setTitle(rs.getString("title"));
                        post.setContent(rs.getString("content"));
                        post.setData(rs.getDate("data"));
                        User user = jdbcTemplate.queryForObject(
                                "select * from users,authorities where (users.username = authorities.username and users.username = ?)",
                                new Object[]{rs.getString("username")},
                                new RowMapper<User>() {
                                    @Override
                                    public User mapRow(ResultSet resultSet, int i) throws SQLException {
                                        User user = new User();
                                        user.setUsername(resultSet.getString("username"));
                                        user.setAuthority(resultSet.getString("authority"));
                                        user.setEnabled(resultSet.getBoolean("enabled"));
                                        user.setPassword(resultSet.getString("password"));
                                        return user;
                                    }
                                });
                        post.setUser(user);
                        return post;
                    }
                });

        return post;
    }

    @Override
    public List<Post> findAllWithUsername(String username) {
        List<Post> post = this.jdbcTemplate.query(
                "select * from posts where username = ?",
                new Object[]{username},
                new RowMapper<Post>() {
                    public Post mapRow(ResultSet rs, int rowNum) throws SQLException {
                        Post post = new Post();
                        post.setId(rs.getInt("id"));
                        post.setTitle(rs.getString("title"));
                        post.setContent(rs.getString("content"));
                        post.setData(rs.getDate("data"));
                        User user = jdbcTemplate.queryForObject(
                                "select * from users,authorities where (users.username = authorities.username and users.username = ?)",
                                new Object[]{rs.getString("username")},
                                new RowMapper<User>() {
                                    @Override
                                    public User mapRow(ResultSet resultSet, int i) throws SQLException {
                                        User user = new User();
                                        user.setUsername(resultSet.getString("username"));
                                        user.setAuthority(resultSet.getString("authority"));
                                        user.setEnabled(resultSet.getBoolean("enabled"));
                                        user.setPassword(resultSet.getString("password"));
                                        return user;
                                    }
                                });
                        post.setUser(user);
                        return post;
                    }
                });

        return post;
    }

    @Override
    public void addPost(Post post, String username, java.sql.Date sqlDate) {
        String sql = "INSERT INTO posts (id, title, content, username, data) VALUES (default, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, post.getTitle(), post.getContent(), username, sqlDate);
    }

    @Override
    public void deletePost(long id) {
        String sql = "DELETE FROM posts WHERE id = ?";
        jdbcTemplate.update(sql,id);
    }

    @Override
    public void updatePost(Post post, String username, Date sqlDate) {
//        String s = "update posts set title = " + title + ", content = " + content + " where id = " + post_id + " ";
        String sql = "UPDATE posts SET title = ?, content = ?, username = ?, data = ? WHERE id = ?";
        jdbcTemplate.update(sql,post.getTitle(),post.getContent(),username,sqlDate,post.getId());
    }

}
