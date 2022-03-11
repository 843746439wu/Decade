package com.abc.service;

import com.abc.dao.UserDao;
import com.abc.dao.UserDaoJDBCImpl;
import com.abc.domain.User;
import com.abc.exception.ApplicationException;

public class UserServiceImpl implements UserService{

    @Override
    public User checkUser(String userNo, String userPwd) {
        UserDao userDao = new UserDaoJDBCImpl();
        User user = userDao.getUserByNo(userNo);

        if(!user.getUser_pwd().equals(userPwd))
            throw new ApplicationException("用户信息找到，但密码不正确，请检查!");

        return user;
    }
}
