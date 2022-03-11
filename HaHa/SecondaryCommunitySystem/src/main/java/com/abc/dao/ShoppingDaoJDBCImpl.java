package com.abc.dao;

import com.abc.domain.Order;
import com.abc.domain.ShopCar;
import com.abc.utils.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ShoppingDaoJDBCImpl implements ShoppingDao{

    private static final String SQL_ADD_SHOPCAR="insert into tbl_shopcar values(?,?,?,?,?,?,?,?,?,?)";
    private static final String SQL_LOAD_SHOPCAR= "select * from tbl_shopcar where user_name=?";
    private static final String SQL_DEL_SHOPCAR="delete from tbl_shopcar where shop_id=?";

    @Override
    public void addShopCar(ShopCar shoppingCar) {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;

        try {
            pstmt = conn.prepareStatement(SQL_ADD_SHOPCAR);
            pstmt.setString(1, shoppingCar.getShop_id());
            pstmt.setString(2, shoppingCar.getCommodity_id());
            pstmt.setString(3, shoppingCar.getUser_name());
            pstmt.setString(4, shoppingCar.getCommodity_name());
            pstmt.setString(5, shoppingCar.getCommodity_describe());
            pstmt.setString(6, shoppingCar.getCommodity_type());
            pstmt.setDouble(7, shoppingCar.getCommodity_price());
            pstmt.setString(8, shoppingCar.getShop_number());
            pstmt.setString(9, shoppingCar.getCommodity_shipping());
            pstmt.setString(10, shoppingCar.getCommodity_address());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, null);
        }
    }

    @Override
    public List<ShopCar> loadShopCar(String user_name) {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        List<ShopCar> cartList = new ArrayList<>();

        try {
            pstmt = conn.prepareStatement(SQL_LOAD_SHOPCAR);
            pstmt.setString(1, user_name);
            rset = pstmt.executeQuery();

            while(rset.next()){
                ShopCar c = new ShopCar();
                c.setShop_id(rset.getString("shop_id"));
                c.setCommodity_id(rset.getString("commodity_id"));
                c.setUser_name(rset.getString("user_name"));
                c.setCommodity_name(rset.getString("commodity_name"));
                c.setCommodity_describe(rset.getString("commodity_describe"));
                c.setCommodity_type(rset.getString("commodity_type"));
                c.setCommodity_price(rset.getDouble("commodity_price"));
                c.setShop_number(rset.getString("shop_number"));
                c.setCommodity_shipping(rset.getString("commodity_shipping"));
                c.setCommodity_address(rset.getString("commodity_address"));
                cartList.add(c);
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, rset);
        }
        return cartList;
    }

    @Override
    public void delShopCar(String shop_id) {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;

        try {
            pstmt = conn.prepareStatement(SQL_DEL_SHOPCAR);
            pstmt.setString(1, shop_id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, null);
        }
    }
}
