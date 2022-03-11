package com.abc.dao;

import com.abc.domain.Join;
import com.abc.utils.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class JoinDaoJDBCImpl implements JoinDao{

    private static final String SQL_ADD_JOIN="insert into tbl_join values(?,?,?,?,?,?,?,?)";
    private static final String SQL_LOAD_JOIN= "select * from tbl_join ";
    private static final String SQL_DEL_JOIN="delete from tbl_join where join_id=?";

    @Override
    public List<Join> loadJoin() {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        List<Join> joinList = new ArrayList<>();

        try {
            pstmt = conn.prepareStatement(SQL_LOAD_JOIN);
            rset = pstmt.executeQuery();

            while(rset.next()){
                Join c = new Join();
                c.setJoin_id(rset.getString("join_id"));
                c.setJoin_userno(rset.getString("join_userno"));
                c.setJoin_actname(rset.getString("join_username"));
                c.setJoin_actno(rset.getString("join_actno"));
                c.setJoin_actname(rset.getString("join_actname"));
                c.setJoin_acttime(rset.getString("join_acttime"));
                c.setJoin_acttitle(rset.getString("join_acttitle"));
                c.setJoin_actnum(rset.getString("join_actnum"));
                joinList.add(c);
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, rset);
        }

        return joinList;
    }

    @Override
    public void addJoin(Join join) {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;

        try {
            pstmt = conn.prepareStatement(SQL_ADD_JOIN);
            pstmt.setString(1, join.getJoin_id());
            pstmt.setString(2, join.getJoin_userno());
            pstmt.setString(3, join.getJoin_username());
            pstmt.setString(4, join.getJoin_actno());
            pstmt.setString(5,join.getJoin_actname());
            pstmt.setString(6, join.getJoin_acttime());
            pstmt.setString(7, join.getJoin_acttitle());
            pstmt.setString(8, join.getJoin_actnum());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, null);
        }
    }

    @Override
    public void delJoin(String join_id) {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;

        try {
            pstmt = conn.prepareStatement(SQL_DEL_JOIN);
            pstmt.setString(1, join_id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, null);
        }
    }

}
