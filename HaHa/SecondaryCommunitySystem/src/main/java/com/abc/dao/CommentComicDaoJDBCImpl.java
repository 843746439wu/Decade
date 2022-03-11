package com.abc.dao;

import com.abc.domain.CommentComic;
import com.abc.domain.Join;
import com.abc.utils.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommentComicDaoJDBCImpl implements CommentComicDao{

    private static final String SQL_ADD_COMMENTCOMIC="insert into tbl_comment_comic values(?,?,?,?,?,?)";
    private static final String SQL_LOAD_COMMENTCOMIC= "select * from tbl_comment_comic where comic_name=?";
    private static final String SQL_LOAD_COMMENT_COMIC= "select * from tbl_comment_comic";
    private static final String SQL_DEL_COMMENTCOMIC="delete from tbl_comment_comic where comment_id=?";

    @Override
    public List<CommentComic> loadCommentComic(String comic_name) {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        List<CommentComic> commcomicList = new ArrayList<>();

        try {
            pstmt = conn.prepareStatement(SQL_LOAD_COMMENTCOMIC);
            pstmt.setString(1, comic_name);
            rset = pstmt.executeQuery();

            while(rset.next()){
                CommentComic c = new CommentComic();
                c.setComment_id(rset.getString("comment_id"));
                c.setUser_no(rset.getString("user_no"));
                c.setUser_name(rset.getString("user_name"));
                c.setComic_name(rset.getString("comic_name"));
                c.setComment_time(rset.getString("comment_time"));
                c.setUser_comment(rset.getString("user_comment"));
                commcomicList.add(c);
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, rset);
        }

        return commcomicList;
    }

    @Override
    public void addCommentComic(CommentComic commentcomic) {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;

        try {
            pstmt = conn.prepareStatement(SQL_ADD_COMMENTCOMIC);
            pstmt.setString(1, commentcomic.getComment_id());
            pstmt.setString(2, commentcomic.getUser_no());
            pstmt.setString(3, commentcomic.getUser_name());
            pstmt.setString(4, commentcomic.getComic_name());
            pstmt.setString(5, commentcomic.getComment_time());
            pstmt.setString(6,commentcomic.getUser_comment());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, null);
        }
    }

    @Override
    public List<CommentComic> loadComment() {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        List<CommentComic> commcomicList = new ArrayList<>();

        try {
            pstmt = conn.prepareStatement(SQL_LOAD_COMMENT_COMIC);
            rset = pstmt.executeQuery();

            while(rset.next()){
                CommentComic c = new CommentComic();
                c.setComment_id(rset.getString("comment_id"));
                c.setUser_no(rset.getString("user_no"));
                c.setUser_name(rset.getString("user_name"));
                c.setComic_name(rset.getString("comic_name"));
                c.setComment_time(rset.getString("comment_time"));
                c.setUser_comment(rset.getString("user_comment"));
                commcomicList.add(c);
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, rset);
        }

        return commcomicList;
    }

    @Override
    public void delCommentComic(String comment_id) {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;

        try {
            pstmt = conn.prepareStatement(SQL_DEL_COMMENTCOMIC);
            pstmt.setString(1, comment_id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, null);
        }
    }
}
