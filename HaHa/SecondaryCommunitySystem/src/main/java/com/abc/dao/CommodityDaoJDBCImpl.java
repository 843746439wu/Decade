package com.abc.dao;


import com.abc.domain.Commodity;
import com.abc.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommodityDaoJDBCImpl implements CommodityDao{

    private static final String SQL_ADD_COMMODITY="insert into tbl_commodity values(?,?,?,?,?,?,?,?,?,?,?)";
    private static final String SQL_LOAD_COMMODITY= "select * from tbl_commodity ";
    private static final String SQL_GET_PIC_BYNAME="select commodity_pic from tbl_commodity where commodity_name=?";
    private static final String SQL_DEL_COMMODITY="delete from tbl_commodity where commodity_name=?";
    private static final String SQL_UPDAT_COMMODITY = "update tbl_commodity set where commodity_name=?";
    private static final String SQL_GET_COMMODITY_BYNO="select * from tbl_commodity where commodity_id=?";

    @Override
    public List<Commodity> loadCommoditys() {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        List<Commodity> commList = new ArrayList<>();

        try {
            pstmt = conn.prepareStatement(SQL_LOAD_COMMODITY);
            rset = pstmt.executeQuery();

            while(rset.next()){
                Commodity c = new Commodity();
                c.setCommodity_id(rset.getString("commodity_id"));
                c.setCommodity_name(rset.getString("commodity_name"));
                c.setCommodity_type(rset.getString("commodity_type"));
                c.setCommodity_price(rset.getDouble("commodity_price"));
                c.setCommodity_describe(rset.getString("commodity_describe"));
                c.setCommodity_pic(rset.getBytes("commodity_pic"));
                c.setCommodity_num(rset.getInt("commodity_num"));
                c.setCommodity_style(rset.getString("commodity_style"));
                c.setCommodity_shipping(rset.getString("commodity_shipping"));
                c.setCommodity_discount(rset.getInt("commodity_discount"));
                c.setCommodity_address(rset.getString("commodity_address"));
                commList.add(c);
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, rset);
        }

        return commList;
    }

    @Override
    public void addCommodity(Commodity commodity) {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;

        try {
            pstmt = conn.prepareStatement(SQL_ADD_COMMODITY);
            pstmt.setString(1, commodity.getCommodity_id());
            pstmt.setString(2, commodity.getCommodity_name());
            pstmt.setString(3, commodity.getCommodity_type());
            pstmt.setDouble(4,commodity.getCommodity_price());
            pstmt.setString(5,commodity.getCommodity_describe());
            pstmt.setBytes(6, commodity.getCommodity_pic());
            pstmt.setInt(7, commodity.getCommodity_num());
            pstmt.setString(8, commodity.getCommodity_style());
            pstmt.setString(9, commodity.getCommodity_shipping());
            pstmt.setInt(10, commodity.getCommodity_discount());
            pstmt.setString(11, commodity.getCommodity_address());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, null);
        }
    }

    @Override
    public Commodity getCommodityByName(String commodity_name) {

        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        Commodity c = null;

        try {
            pstmt = conn.prepareStatement(SQL_GET_COMMODITY_BYNO);
            pstmt.setString(1, commodity_name);
            rset = pstmt.executeQuery();

            if(rset.next()){
                c = new Commodity();
                c.setCommodity_id(rset.getString("commodity_id"));
                c.setCommodity_name(rset.getString("commodity_name"));
                c.setCommodity_type(rset.getString("commodity_type"));
                c.setCommodity_price(rset.getDouble("commodity_price"));
                c.setCommodity_describe(rset.getString("commodity_describe"));
                c.setCommodity_pic(rset.getBytes("commodity_pic"));
                c.setCommodity_num(rset.getInt("commodity_num"));
                c.setCommodity_style(rset.getString("commodity_style"));
                c.setCommodity_shipping(rset.getString("commodity_shipping"));
                c.setCommodity_discount(rset.getInt("commodity_discount"));
                c.setCommodity_address(rset.getString("commodity_address"));
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
    public byte[] getPicByName(String commodity_name) {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        byte[] picData = null;

        try {
            pstmt = conn.prepareStatement(SQL_GET_PIC_BYNAME);
            pstmt.setString(1, commodity_name);
            rset = pstmt.executeQuery();

            if(rset.next()){
                picData=rset.getBytes("commodity_pic");
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, rset);
        }

        return picData;
    }

    @Override
    public void delCommodity(String commodity_name) {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;

        try {
            pstmt = conn.prepareStatement(SQL_DEL_COMMODITY);
            pstmt.setString(1, commodity_name);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, null);
        }
    }

    @Override
    public void updateCommodity(Commodity commodity) {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;

        try {
            pstmt = conn.prepareStatement(SQL_UPDAT_COMMODITY);
            pstmt.setString(1, commodity.getCommodity_id());
            pstmt.setString(2, commodity.getCommodity_name());
            pstmt.setString(3, commodity.getCommodity_type());
            pstmt.setDouble(4,commodity.getCommodity_price());
            pstmt.setString(5,commodity.getCommodity_describe());
            pstmt.setBytes(6, commodity.getCommodity_pic());
            pstmt.setInt(7, commodity.getCommodity_num());
            pstmt.setString(8, commodity.getCommodity_style());
            pstmt.setString(9, commodity.getCommodity_shipping());
            pstmt.setInt(10, commodity.getCommodity_discount());
            pstmt.setString(11, commodity.getCommodity_address());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, null);
        }
    }
}
