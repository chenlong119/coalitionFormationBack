package com.ruoyi.project.shareIncentive.mapper;

import com.ruoyi.project.shareIncentive.domain.User;
import org.apache.ibatis.annotations.Select;

import java.util.List;

// UserRepository.java (Mapper层)
public interface UserMapper {

    @Select("select * from `ry-vue`.auction_user where UserID = #{id};")
    User findById(Long id);
    @Select("select * from `ry-vue`.auction_user;")
    List<User> findAll();
    void save(User user);
    void update(User user);
    void delete(Long id);
}