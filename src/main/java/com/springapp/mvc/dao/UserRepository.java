package com.springapp.mvc.dao;

import com.springapp.mvc.aop.MyLoggable;
import com.springapp.mvc.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class UserRepository implements IUserRepository {

    private JdbcTemplate jdbcTemplate;

    @Autowired
    public void setDataSource(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public User findByUsername(String username) {
        User user = jdbcTemplate.queryForObject(
                "select * from users,authorities where (users.username = authorities.username and users.username = ?)",
                new Object[]{username},
                new RowMapper<User>() {
                    @Override
                    public User mapRow(ResultSet rs, int rowNum) throws SQLException {
                        User user = new User();
                        user.setUsername(rs.getString("username"));
                        user.setPassword(rs.getString("password"));
                        user.setAuthority(rs.getString("authority"));
                        user.setEnabled(rs.getBoolean("enabled"));
                        return user;
                    }
                });
        return user;
    }

    @Override
    public void addUser(User user) {
        String sql = "INSERT INTO users (username, password, enabled) VALUES (?, ?, 'TRUE')";
        jdbcTemplate.update(sql, user.getUsername(), user.getPassword());
        sql = "INSERT INTO authorities (username, authority) VALUES (?,'ROLE_USER')";
        jdbcTemplate.update(sql, user.getUsername());
    }

    @Override
    public List<User> findAll() {
        String sql = "SELECT * FROM users, authorities WHERE users.username = authorities.username";
        List<User> listUsers = jdbcTemplate.query(sql, new RowMapper<User>() {

            @Override
            public User mapRow(ResultSet rs, int rowNum) throws SQLException {
                User newUser = new User();
                newUser.setUsername(rs.getString("username"));
                newUser.setPassword(rs.getString("password"));
                newUser.setAuthority(rs.getString("authority"));
                return newUser;
            }

        });
        return listUsers;
    }

    @Override
    public void delete(String username) {
        String sql = "DELETE FROM authorities WHERE username=?";
        jdbcTemplate.update(sql, username);
        sql = "DELETE FROM users WHERE username=?";
        jdbcTemplate.update(sql, username);
    }

    @Override
    public void editUser(String username, String role) {
        String sql = "UPDATE authorities SET authority = '" + role + "' where username = '" + username + "'";
        jdbcTemplate.update(sql);
    }


}
