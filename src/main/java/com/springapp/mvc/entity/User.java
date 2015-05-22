package com.springapp.mvc.entity;

import com.springapp.mvc.validator.ValidRegistration;
import com.springapp.mvc.validator.ValidUser;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name="users")
@SecondaryTable(name = "authorities", pkJoinColumns=@PrimaryKeyJoinColumn(name="username", referencedColumnName="username"))
public class User implements Serializable {

    @Id
    @ValidUser
    @Column(name = "username")
    private String username;

    @ValidRegistration
    @Column(name = "password")
    private String password;

    private boolean enabled;

    @Column(table="authorities", name="authority")
    private String authority;

    public String getAuthority() {
        return authority;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    @Override
    public String toString() {
        return "User{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", enabled=" + enabled +
                ", authority='" + authority + '\'' +
                '}';
    }

}


