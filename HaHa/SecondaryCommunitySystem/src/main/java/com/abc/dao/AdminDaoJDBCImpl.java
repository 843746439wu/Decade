package com.abc.dao;

import com.abc.domain.Admin;
import com.abc.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdminDaoJDBCImpl implements AdminDao{

    private static final String SQL_ADD_ADMIN="insert into tbl_administrators values(?,?,?,?,?,?,?,?,?,?)";
    private static final String SQL_LOAD_ADMIN= "select * from tbl_administrators";
    private static final String SQL_DEL_ADMIN="delete from tbl_administrators where admin_name=?";
    private static final String SQL_GET_ADMIN_BYNO="select * from tbl_administrators where admin_number=?";
    private static final String SQL_UPDAT_ADMIN = "update tbl_administrators set admin_password=?,admin_name=?,admin_id=?,admin_phone=?,admin_address=?,admin_email=?,admin_birth=?,admin_qq=?,admin_pic=? where admin_number=?";
    private static final String SQL_GET_PIC_BYNO="select admin_pic from tbl_administrators where admin_number=?";

    @Override
    public Admin getAdminByNo(String admin_number) {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        Admin c = null;

        try {
            pstmt = conn.prepareStatement(SQL_GET_ADMIN_BYNO);
            pstmt.setString(1, admin_number);
            rset = pstmt.executeQuery();

            if(rset.next()){
                c = new Admin();
                c.setAdmin_number(rset.getString("admin_number"));
                c.setAdmin_password(rset.getString("admin_password"));
                c.setAdmin_name(rset.getString("admin_name"));
                c.setAdmin_id(rset.getString("admin_id"));
                c.setAdmin_phone(rset.getString("admin_phone"));
                c.setAdmin_address(rset.getString("admin_address"));
                c.setAdmin_email(rset.getString("admin_email"));
                c.setAdmin_birth(rset.getString("admin_birth"));
                c.setAdmin_qq(rset.getInt("admin_qq"));
                c.setAdmin_pic(rset.getBytes("admin_pic"));
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, rset);
        }

        return c;

    }

    @Override
    public List<Admin> loadAdmins() {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        List<Admin> adminList = new ArrayList<>();

        try {
            pstmt = conn.prepareStatement(SQL_LOAD_ADMIN);
            rset = pstmt.executeQuery();

            while(rset.next()){
                Admin c = new Admin();
                c.setAdmin_number(rset.getString("admin_number"));
                c.setAdmin_password(rset.getString("admin_password"));
                c.setAdmin_name(rset.getString("admin_name"));
                c.setAdmin_id(rset.getString("admin_id"));
                c.setAdmin_phone(rset.getString("admin_phone"));
                c.setAdmin_address(rset.getString("admin_address"));
                c.setAdmin_email(rset.getString("admin_email"));
                c.setAdmin_birth(rset.getString("admin_birth"));
                c.setAdmin_qq(rset.getInt("admin_qq"));
                c.setAdmin_pic(rset.getBytes("admin_pic"));
                adminList.add(c);
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, rset);
        }

        return adminList;
    }

    @Override
    public void addAdmin(Admin admin) {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;

        try {
            pstmt = conn.prepareStatement(SQL_ADD_ADMIN);
            pstmt.setString(1, admin.getAdmin_number());
            pstmt.setString(2, admin.getAdmin_password());
            pstmt.setString(3, admin.getAdmin_name());
            pstmt.setString(4, admin.getAdmin_id());
            pstmt.setString(5, admin.getAdmin_phone());
            pstmt.setString(6, admin.getAdmin_address());
            pstmt.setString(7, admin.getAdmin_email());
            pstmt.setString(8, admin.getAdmin_birth());
            pstmt.setInt(9, admin.getAdmin_qq());
            pstmt.setBytes(10, admin.getAdmin_pic());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, null);
        }
    }

    @Override
    public void delAdmin(String admin_name) {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;

        try {
            pstmt = conn.prepareStatement(SQL_DEL_ADMIN);
            pstmt.setString(1, admin_name);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, null);
        }
    }

    @Override
    public void updateAdmin(Admin admin) {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;

        try {
            pstmt = conn.prepareStatement(SQL_UPDAT_ADMIN);
            pstmt.setString(1, admin.getAdmin_number());
            pstmt.setString(2, admin.getAdmin_password());
            pstmt.setString(3, admin.getAdmin_name());
            pstmt.setString(4, admin.getAdmin_id());
            pstmt.setString(5, admin.getAdmin_phone());
            pstmt.setString(6, admin.getAdmin_address());
            pstmt.setString(7, admin.getAdmin_email());
            pstmt.setString(8, admin.getAdmin_birth());
            pstmt.setInt(9, admin.getAdmin_qq());
            pstmt.setBytes(10, admin.getAdmin_pic());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, null);
        }
    }

    @Override
    public byte[] getPicByNo(String admin_number) {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        byte[] picData = null;

        try {
            pstmt = conn.prepareStatement(SQL_GET_PIC_BYNO);
            pstmt.setString(1, admin_number);
            rset = pstmt.executeQuery();

            if(rset.next()){
                picData=rset.getBytes("admin_pic");
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, rset);
        }

        return picData;
    }

}
