package com.abc.dao;

import com.abc.domain.Activity;
import com.abc.utils.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ActivityDaoJDBCImpl implements ActivityDao{

    private static final String SQL_ADD_ACTIVITY="insert into tbl_activity values(?,?,?,?,?,?,?)";
    private static final String SQL_LOAD_ACTIVITY= "select * from tbl_activity ";
    private static final String SQL_DEL_ACTIVITY="delete from tbl_activity where act_no=?";
    private static final String SQL_GET_ACTIVITY_BYNO="select * from tbl_activity where act_no=?";

    @Override
    public List<Activity> loadActivitys() {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        List<Activity> actList = new ArrayList<>();

        try {
            pstmt = conn.prepareStatement(SQL_LOAD_ACTIVITY);
            rset = pstmt.executeQuery();

            while(rset.next()){
                Activity c = new Activity();
                c.setAct_no(rset.getString("act_no"));
                c.setAct_name(rset.getString("act_name"));
                c.setAct_uptime(rset.getString("act_uptime"));
                c.setAct_downtime(rset.getString("act_downtime"));
                c.setAct_number(rset.getString("act_number"));
                c.setAct_title(rset.getString("act_title"));
                c.setAct_content(rset.getString("act_content"));
                actList.add(c);
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, rset);
        }

        return actList;
    }

    @Override
    public void addActivity(Activity activity) {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;

        try {
            pstmt = conn.prepareStatement(SQL_ADD_ACTIVITY);
            pstmt.setString(1, activity.getAct_no());
            pstmt.setString(2, activity.getAct_name());
            pstmt.setString(3, activity.getAct_uptime());
            pstmt.setString(4,activity.getAct_downtime());
            pstmt.setString(5,activity.getAct_number());
            pstmt.setString(6, activity.getAct_title());
            pstmt.setString(7, activity.getAct_content());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, null);
        }
    }

    @Override
    public void delActivity(String act_no) {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;

        try {
            pstmt = conn.prepareStatement(SQL_DEL_ACTIVITY);
            pstmt.setString(1, act_no);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, null);
        }
    }

    @Override
    public Activity getActivityByNo(String act_no) {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        Activity c = null;

        try {
            pstmt = conn.prepareStatement(SQL_GET_ACTIVITY_BYNO);
            pstmt.setString(1, act_no);
            rset = pstmt.executeQuery();

            if(rset.next()){
                c = new Activity();
                c.setAct_no(rset.getString("act_no"));
                c.setAct_name(rset.getString("act_name"));
                c.setAct_uptime(rset.getString("act_uptime"));
                c.setAct_downtime(rset.getString("act_downtime"));
                c.setAct_number(rset.getString("act_number"));
                c.setAct_title(rset.getString("act_title"));
                c.setAct_content(rset.getString("act_content"));
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, rset);
        }

        return c;
    }

}
