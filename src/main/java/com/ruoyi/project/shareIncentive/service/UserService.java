package com.ruoyi.project.shareIncentive.service;


import com.ruoyi.project.shareIncentive.domain.User;

import java.util.List;

// UserService.java (Service层)
public interface UserService {
    User getUserById(Long id);
    List<User> getAllUsers();
    void saveUser(User user);
    void updateUser(User user);
    void deleteUser(Long id);

}