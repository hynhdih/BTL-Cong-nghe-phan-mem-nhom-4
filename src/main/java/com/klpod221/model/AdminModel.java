package com.klpod221.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "admin")
public class AdminModel {

    private Long id;

    private String username;
    private String password;

    public AdminModel() {
    }


    public AdminModel(Long id, String username, String password) {
        this.id = id;
        this.username = username;
        this.password = password;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public AdminModel id(Long id) {
        setId(id);
        return this;
    }

    public AdminModel username(String username) {
        setUsername(username);
        return this;
    }

    public AdminModel password(String password) {
        setPassword(password);
        return this;
    }
}
