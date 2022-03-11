package com.abc.dao;

import com.abc.domain.CommentCommodity;
import com.abc.utils.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommentCommodityDaoJDBCImpl implements CommentCommodityDao {

    private static final String SQL_ADD_COMMENTCOMMODITY="insert into tbl_comment_commodity values(?,?,?,?,?,?)";
    private static final String SQL_LOAD_COMMENTCOMMODITY= "select * from tbl_comment_commodity where commodity_id=?";
    private static final String SQL_LOAD_COMMENT_COMMODITY= "select * from tbl_comment_commodity";
    private static final String SQL_DEL_COMMENTCOMMODITY="delete from tbl_comment_commodity where comment_id=?";

    @Override
    public List<CommentCommodity> loadCommentCommdty(String commodity_id) {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        List<CommentCommodity> commcommodityList = new ArrayList<>();

        try {
            pstmt = conn.prepareStatement(SQL_LOAD_COMMENTCOMMODITY);
            pstmt.setString(1, commodity_id);
            rset = pstmt.executeQuery();

            while(rset.next()){
                CommentCommodity c = new CommentCommodity();
                c.setComment_id(rset.getString("comment_id"));
                c.setUser_no(rset.getString("user_no"));
                c.setUser_name(rset.getString("user_name"));
                c.setCommdity_id(rset.getString("commodity_id"));
                c.setComment_time(rset.getString("comment_time"));
                c.setCommodity_comment(rset.getString("commodity_comment"));
                commcommodityList.add(c);
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, rset);
        }

        return commcommodityList;
    }

    @Override
    public void addCommentCommodity(CommentCommodity commentcommodity) {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;

        try {
            pstmt = conn.prepareStatement(SQL_ADD_COMMENTCOMMODITY);
            pstmt.setString(1, commentcommodity.getComment_id());
            pstmt.setString(2, commentcommodity.getUser_no());
            pstmt.setString(3, commentcommodity.getUser_name());
            pstmt.setString(4, commentcommodity.getCommdity_id());
            pstmt.setString(5, commentcommodity.getComment_time());
            pstmt.setString(6,commentcommodity.getCommodity_comment());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, null);
        }
    }

    @Override
    public void delCommentCommodity(String comment_id) {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;

        try {
            pstmt = conn.prepareStatement(SQL_DEL_COMMENTCOMMODITY);
            pstmt.setString(1, comment_id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, null);
        }
    }

    @Override
    public List<CommentCommodity> loadCommentCommdty() {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        List<CommentCommodity> commcommodityList = new ArrayList<>();

        try {
            pstmt = conn.prepareStatement(SQL_LOAD_COMMENT_COMMODITY);
            rset = pstmt.executeQuery();

            while(rset.next()){
                CommentCommodity c = new CommentCommodity();
                c.setComment_id(rset.getString("comment_id"));
                c.setUser_no(rset.getString("user_no"));
                c.setUser_name(rset.getString("user_name"));
                c.setCommdity_id(rset.getString("commodity_id"));
                c.setComment_time(rset.getString("comment_time"));
                c.setCommodity_comment(rset.getString("commodity_comment"));
                commcommodityList.add(c);
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, rset);
        }

        return commcommodityList;
    }
}
