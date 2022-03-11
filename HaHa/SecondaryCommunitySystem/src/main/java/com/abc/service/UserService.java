package com.abc.service;

import com.abc.domain.Admin;
import com.abc.domain.User;

public interface UserService {
    User checkUser(String userNo, String userPwd);
}
