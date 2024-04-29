package com.ruoyi.project.shareIncentive.contoller;
import org.springframework.beans.factory.annotation.Autowired;
import com.ruoyi.project.shareIncentive.domain.User;
import com.ruoyi.project.shareIncentive.service.UserService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

// UserController.java (Controller层)
@RestController
@RequestMapping("/users")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/{userId}")
    public ResponseEntity<User> getUserById(@PathVariable Long userId) {
        User user = userService.getUserById(userId);
        return ResponseEntity.ok(user);
    }

    @GetMapping("/all")
    public ResponseEntity<List<User>> getAllUsers() {
        List<User> users = userService.getAllUsers();
        if (!users.isEmpty()) {
            // 获取第一个用户的 UserID
            System.out.println(users);
        }
        return ResponseEntity.ok(users);
    }

//    @PostMapping("/add")
//    public ResponseEntity<Void> addUser(@RequestBody User user) {
//        userService.saveUser(user);
//        return ResponseEntity.status(HttpStatus.CREATED).build();
//    }
//
//    @PutMapping("/update")
//    public ResponseEntity<Void> updateUser(@RequestBody User user) {
//        userService.updateUser(user);
//        return ResponseEntity.ok().build();
//    }
//
//    @DeleteMapping("/delete/{userId}")
//    public ResponseEntity<Void> deleteUser(@PathVariable Long userId) {
//        userService.deleteUser(userId);
//        return ResponseEntity.ok().build();
//    }
}
