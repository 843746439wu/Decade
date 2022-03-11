package com.abc.dao;

import com.abc.domain.Activity;
import com.abc.domain.Notice;
import com.abc.utils.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NoticeDaoJDBCImpl implements NoticeDao{

    private static final String SQL_ADD_NOTICE="insert into tbl_notice values(?,?,?,?,?,?)";
    private static final String SQL_LOAD_NOTICE= "select * from tbl_notice ";
    private static final String SQL_DEL_NOTICE="delete from tbl_notice where notice_no=?";

    @Override
    public List<Notice> loadNotices() {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        List<Notice> noticeList = new ArrayList<>();

        try {
            pstmt = conn.prepareStatement(SQL_LOAD_NOTICE);
            rset = pstmt.executeQuery();

            while(rset.next()){
                Notice c = new Notice();
                c.setNotice_no(rset.getString("notice_no"));
                c.setNotice_name(rset.getString("notice_name"));
                c.setNotice_uptime(rset.getString("notice_uptime"));
                c.setNotice_downtime(rset.getString("notice_downtime"));
                c.setNotice_title(rset.getString("notice_title"));
                c.setNotice_content(rset.getString("notice_content"));
                noticeList.add(c);
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, rset);
        }

        return noticeList;
    }

    @Override
    public void addNotice(Notice notice) {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;

        try {
            pstmt = conn.prepareStatement(SQL_ADD_NOTICE);
            pstmt.setString(1, notice.getNotice_no());
            pstmt.setString(2, notice.getNotice_name());
            pstmt.setString(3, notice.getNotice_uptime());
            pstmt.setString(4, notice.getNotice_downtime());
            pstmt.setString(5, notice.getNotice_title());
            pstmt.setString(6, notice.getNotice_content());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, null);
        }
    }

    @Override
    public void delNotice(String notice_no) {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;

        try {
            pstmt = conn.prepareStatement(SQL_DEL_NOTICE);
            pstmt.setString(1, notice_no);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, null);
        }
    }
}
