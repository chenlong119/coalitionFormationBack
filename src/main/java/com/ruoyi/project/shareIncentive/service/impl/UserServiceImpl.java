package com.ruoyi.project.shareIncentive.service.impl;


import com.ruoyi.project.shareIncentive.domain.User;
import com.ruoyi.project.shareIncentive.mapper.UserMapper;
import com.ruoyi.project.shareIncentive.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

// UserServiceImpl.java (Service层的实现)
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userRepository;

    @Override
    public User getUserById(Long id) {
        return userRepository.findById(id);
    }

    @Override
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    @Override
    public void saveUser(User user) {
        userRepository.save(user);
    }

    @Override
    public void updateUser(User user) {
        userRepository.update(user);
    }

    @Override
    public void deleteUser(Long id) {
        userRepository.delete(id);
    }
}

