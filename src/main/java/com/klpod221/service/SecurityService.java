package com.klpod221.service;

public interface SecurityService {
// Function: login, boolean, logout
    void login(String username);

    Boolean isLoggedIn();

    void logout();
}
