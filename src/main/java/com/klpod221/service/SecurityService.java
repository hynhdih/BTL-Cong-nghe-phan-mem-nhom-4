package com.klpod221.service;

public interface SecurityService {

    void login(String username);

    Boolean isLoggedIn();

    void logout();
}
