package com.klpod221.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SecurityServiceImpl implements SecurityService {
    @Autowired
    private HttpSession session;

    @Override
    public void login(String username) {
        session.setAttribute("username", username);
    }

    @Override
    public Boolean isLoggedIn() {
        return session.getAttribute("username") != null;
    }

    @Override
    public void logout() {
        session.removeAttribute("username");
    }

}
