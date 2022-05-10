package com.klpod221.service;

import com.klpod221.model.AdminModel;

public interface AdminService {
    void save(AdminModel admin);

    AdminModel findByUsername(String username);
}
