package com.klpod221.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.klpod221.model.AdminModel;
import com.klpod221.service.AdminService;
import com.klpod221.service.SecurityService;

@Controller
public class AuthController {
    @Autowired
    private AdminService adminService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @RequestMapping(value = "/admin/login", method = RequestMethod.GET)
    public String login(Model model) {
        if (securityService.isLoggedIn()) {
            return "redirect:/admin/home";
        }
        return "admin/login";
    }

    @RequestMapping(value = "/admin/login", method = RequestMethod.POST)
    public String login(String username, String password, Model model) {
        AdminModel admin = adminService.findByUsername(username);
        if (admin != null && bCryptPasswordEncoder.matches(password, admin.getPassword())) {
            securityService.login(username);
            return "redirect:/admin/home";
        } else {
            model.addAttribute("error", "Invalid username or password!");
            return "admin/login";
        }
    }

    @RequestMapping(value = "/admin/logout", method = RequestMethod.GET)
    public String logout() {
        securityService.logout();
        return "redirect:/admin/login";
    }
}
