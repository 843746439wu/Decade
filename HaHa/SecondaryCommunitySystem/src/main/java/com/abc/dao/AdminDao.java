package com.abc.dao;

import com.abc.domain.Admin;

import java.util.List;

public interface AdminDao {

    Admin getAdminByNo(String admin_number);
    List<Admin> loadAdmins();
    void addAdmin(Admin admin);
    void delAdmin(String admin_number);
    void updateAdmin(Admin admin);
    byte[] getPicByNo(String admin_number);


}
