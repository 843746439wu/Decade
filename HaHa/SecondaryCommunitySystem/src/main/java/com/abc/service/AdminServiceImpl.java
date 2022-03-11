package com.abc.service;

import com.abc.dao.AdminDao;
import com.abc.dao.AdminDaoJDBCImpl;
import com.abc.domain.Admin;
import com.abc.exception.ApplicationException;

public class AdminServiceImpl implements AdminService{

    @Override
    public Admin checkAdmin(String adminNo, String adminPwd) {

        AdminDao adminDao = new AdminDaoJDBCImpl();
        Admin admin = adminDao.getAdminByNo(adminNo);

        if(!admin.getAdmin_password().equals(adminPwd))
                throw new ApplicationException("用户信息找到，但密码不正确，请检查!");

        return admin;
    }

}
