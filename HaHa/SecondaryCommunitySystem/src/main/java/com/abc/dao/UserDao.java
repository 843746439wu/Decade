package com.abc.dao;



import com.abc.domain.User;

import java.util.List;

public interface UserDao {

    User getUserByNo(String user_no);
    List<User> loadusers();
    void addUser(User user);
    void updateUser(User user);
    byte[] getPicByNo(String user_no);

}
