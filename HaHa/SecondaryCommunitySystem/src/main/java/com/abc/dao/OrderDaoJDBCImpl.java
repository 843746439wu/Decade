package com.abc.dao;

import com.abc.domain.Order;
import com.abc.utils.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDaoJDBCImpl implements OrderDao{

    private static final String SQL_ADD_ORDER="insert into tbl_order values(?,?,?,?,?,?,?,?,?,?,?,?)";
    private static final String SQL_LOAD_ORDER= "select * from tbl_order";
    private static final String SQL_LOAD_USERORDER= "select * from tbl_order where user_name=?";
    private static final String SQL_DEL_ORDER="delete from tbl_order where order_id=?";

    @Override
    public List<Order> loadOrder() {

        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        List<Order> orderList = new ArrayList<>();

        try {
            pstmt = conn.prepareStatement(SQL_LOAD_ORDER);
            rset = pstmt.executeQuery();

            while(rset.next()){
                Order c = new Order();
                c.setOrder_id(rset.getString("order_id"));
                c.setUser_name(rset.getString("user_name"));
                c.setUser_phone(rset.getString("user_phone"));
                c.setUser_address(rset.getString("user_address"));
                c.setOrder_time(rset.getString("order_time"));
                c.setCommodity_name(rset.getString("commodity_name"));
                c.setCommodity_describe(rset.getString("commodity_describe"));
                c.setCommodity_type(rset.getString("commodity_type"));
                c.setCommodity_price(rset.getDouble("commodity_price"));
                c.setOrder_number(rset.getString("order_number"));
                c.setCommodity_shipping(rset.getString("commodity_shipping"));
                c.setCommodity_address(rset.getString("commodity_address"));
                orderList.add(c);
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, rset);
        }

        return orderList;

    }

    @Override
    public List<Order> loadUserOrder(String user_name) {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        List<Order> orderList = new ArrayList<>();

        try {
            pstmt = conn.prepareStatement(SQL_LOAD_USERORDER);
            pstmt.setString(1, user_name);
            rset = pstmt.executeQuery();

            while(rset.next()){
                Order c = new Order();
                c.setOrder_id(rset.getString("order_id"));
                c.setUser_name(rset.getString("user_name"));
                c.setUser_phone(rset.getString("user_phone"));
                c.setUser_address(rset.getString("user_address"));
                c.setOrder_time(rset.getString("order_time"));
                c.setCommodity_name(rset.getString("commodity_name"));
                c.setCommodity_describe(rset.getString("commodity_describe"));
                c.setCommodity_type(rset.getString("commodity_type"));
                c.setCommodity_price(rset.getDouble("commodity_price"));
                c.setOrder_number(rset.getString("order_number"));
                c.setCommodity_shipping(rset.getString("commodity_shipping"));
                c.setCommodity_address(rset.getString("commodity_address"));
                orderList.add(c);
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, rset);
        }
        return orderList;
    }

    @Override
    public void addOrder(Order order) {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;

        try {
            pstmt = conn.prepareStatement(SQL_ADD_ORDER);
            pstmt.setString(1, order.getOrder_id());
            pstmt.setString(2, order.getUser_name());
            pstmt.setString(3, order.getUser_phone());
            pstmt.setString(4, order.getUser_address());
            pstmt.setString(5, order.getOrder_time());
            pstmt.setString(6, order.getCommodity_name());
            pstmt.setString(7, order.getCommodity_describe());
            pstmt.setString(8, order.getCommodity_type());
            pstmt.setDouble(9, order.getCommodity_price());
            pstmt.setString(10, order.getOrder_number());
            pstmt.setString(11, order.getCommodity_shipping());
            pstmt.setString(12, order.getCommodity_address());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, null);
        }
    }

    @Override
    public void delOrder(String order_id) {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;

        try {
            pstmt = conn.prepareStatement(SQL_DEL_ORDER);
            pstmt.setString(1, order_id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, null);
        }
    }
}
