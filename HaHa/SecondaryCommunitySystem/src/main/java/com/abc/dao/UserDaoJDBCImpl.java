package com.abc.dao;

import com.abc.domain.Admin;
import com.abc.domain.User;
import com.abc.utils.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDaoJDBCImpl implements UserDao{

    private static final String SQL_ADD_USER="insert into tbl_user values(?,?,?,?,?,?,?,?,?,?)";
    private static final String SQL_LOAD_USER= "select * from tbl_user";
    private static final String SQL_GET_USER_BYNO="select * from tbl_user where user_no=?";
    private static final String SQL_UPDAT_USER = "update tbl_user set  where user_no=?";
    private static final String SQL_GET_PIC_BYNO="select user_pic from tbl_user where user_no=?";


    @Override
    public User getUserByNo(String user_no) {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        User c = null;

        try {
            pstmt = conn.prepareStatement(SQL_GET_USER_BYNO);
            pstmt.setString(1, user_no);
            rset = pstmt.executeQuery();

            if(rset.next()){
                c = new User();
                c.setUser_no(rset.getString("user_no"));
                c.setUser_pwd(rset.getString("user_pwd"));
                c.setUser_name(rset.getString("user_name"));
                c.setUser_id(rset.getString("user_id"));
                c.setUser_email(rset.getString("user_email"));
                c.setUser_address(rset.getString("user_address"));
                c.setUser_phone(rset.getString("user_phone"));
                c.setUser_motto(rset.getString("user_motto"));
                c.setUser_pic(rset.getBytes("user_pic"));
                c.setUser_money(rset.getDouble("user_money"));

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
    public List<User> loadusers() {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        List<User> userList = new ArrayList<>();

        try {
            pstmt = conn.prepareStatement(SQL_LOAD_USER);
            rset = pstmt.executeQuery();

            while(rset.next()){
                User c = new User();
                c.setUser_no(rset.getString("user_no"));
                c.setUser_pwd(rset.getString("user_pwd"));
                c.setUser_name(rset.getString("user_name"));
                c.setUser_id(rset.getString("user_id"));
                c.setUser_email(rset.getString("user_email"));
                c.setUser_address(rset.getString("user_address"));
                c.setUser_phone(rset.getString("user_phone"));
                c.setUser_motto(rset.getString("user_motto"));
                c.setUser_pic(rset.getBytes("user_pic"));
                c.setUser_money(rset.getDouble("user_money"));
                userList.add(c);
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, rset);
        }

        return userList;
    }

    @Override
    public void addUser(User user) {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;

        try {
            pstmt = conn.prepareStatement(SQL_ADD_USER);
            pstmt.setString(1,user.getUser_no());
            pstmt.setString(2,user.getUser_pwd());
            pstmt.setString(3,user.getUser_name());
            pstmt.setString(4,user.getUser_id());
            pstmt.setString(5,user.getUser_email());
            pstmt.setString(6,user.getUser_address());
            pstmt.setString(7,user.getUser_phone());
            pstmt.setString(8,user.getUser_motto());
            pstmt.setBytes(9,user.getUser_pic());
            pstmt.setDouble(10,user.getUser_money());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, null);
        }
    }

    @Override
    public void updateUser(User user) {

        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;

        try {
            pstmt = conn.prepareStatement(SQL_UPDAT_USER);
            pstmt.setString(1,user.getUser_no());
            pstmt.setString(2,user.getUser_pwd());
            pstmt.setString(3,user.getUser_name());
            pstmt.setString(4,user.getUser_id());
            pstmt.setString(5,user.getUser_email());
            pstmt.setString(6,user.getUser_address());
            pstmt.setString(7,user.getUser_phone());
            pstmt.setString(8,user.getUser_motto());
            pstmt.setBytes(9,user.getUser_pic());
            pstmt.setDouble(10,user.getUser_money());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, null);
        }

    }

    @Override
    public byte[] getPicByNo(String user_no) {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        byte[] picData = null;

        try {
            pstmt = conn.prepareStatement(SQL_GET_PIC_BYNO);
            pstmt.setString(1, user_no);
            rset = pstmt.executeQuery();

            if(rset.next()){
                picData=rset.getBytes("user_pic");
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
