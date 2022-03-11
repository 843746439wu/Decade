package com.abc.dao;

import com.abc.domain.Collect;
import com.abc.domain.Join;
import com.abc.utils.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CollectDaoJDBCImpl implements CollectDao{

    private static final String SQL_ADD_Collect="insert into tbl_collect values(?,?,?)";
    private static final String SQL_LOAD_Collect= "select * from tbl_collect ";
    private static final String SQL_DEL_Collect="delete from tbl_collect where collect_id=?";

    @Override
    public List<Collect> loadCollect() {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        List<Collect> collectList = new ArrayList<>();

        try {
            pstmt = conn.prepareStatement(SQL_LOAD_Collect);
            rset = pstmt.executeQuery();

            while(rset.next()){
                Collect c = new Collect();
                c.setCollect_id(rset.getString("collect_id"));
                c.setComic_name(rset.getString("comic_name"));
                c.setComic_number(rset.getInt("comic_number"));
                collectList.add(c);
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, rset);
        }

        return collectList;
    }

    @Override
    public void addCollect(Collect collect) {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;

        try {
            pstmt = conn.prepareStatement(SQL_ADD_Collect);
            pstmt.setString(1, collect.getCollect_id());
            pstmt.setString(2, collect.getComic_name());
            pstmt.setInt(3, collect.getComic_number());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, null);
        }
    }

    @Override
    public void delCollect(String collect_id) {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;

        try {
            pstmt = conn.prepareStatement(SQL_DEL_Collect);
            pstmt.setString(1, collect_id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, null);
        }
    }
}
