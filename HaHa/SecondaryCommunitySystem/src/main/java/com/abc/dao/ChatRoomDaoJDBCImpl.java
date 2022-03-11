package com.abc.dao;

import com.abc.domain.Activity;
import com.abc.domain.ChatRoom;
import com.abc.domain.Comic;
import com.abc.utils.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ChatRoomDaoJDBCImpl implements ChatRoomDao{

    private static final String SQL_ADD_ChatRoom="insert into tbl_chatroom values(?,?,?,?,?,?)";
    private static final String SQL_LOAD_ChatRoom= "select * from tbl_chatroom ";
    private static final String SQL_DEL_ChatRoom="delete from tbl_chatroom where chatroom_id=?";
    private static final String SQL_GET_ChatRoom_BYNO="select * from tbl_chatroom where chatroom_id=?";


    @Override
    public List<ChatRoom> loadChatRoom() {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        List<ChatRoom> chatroomList = new ArrayList<>();

        try {
            pstmt = conn.prepareStatement(SQL_LOAD_ChatRoom);
            rset = pstmt.executeQuery();

            while(rset.next()){
                ChatRoom c = new ChatRoom();
                c.setChatroom_id(rset.getString("chatroom_id"));
                c.setChatroom_name(rset.getString("chatroom_name"));
                c.setChatroom_pic(rset.getBytes("chatroom_pic"));
                c.setAdmin_number(rset.getString("admin_number"));
                c.setAdmin_name(rset.getString("admin_name"));
                c.setBulid_time(rset.getString("bulid_time"));
                chatroomList.add(c);
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, rset);
        }

        return chatroomList;
    }

    @Override
    public void addChatRoom(ChatRoom chatroom) {

        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;

        try {
            pstmt = conn.prepareStatement(SQL_ADD_ChatRoom);
            pstmt.setString(1, chatroom.getChatroom_id());
            pstmt.setString(2, chatroom.getChatroom_name());
            pstmt.setBytes(3, chatroom.getChatroom_pic());
            pstmt.setString(4,chatroom.getAdmin_number());
            pstmt.setString(5,chatroom.getAdmin_name());
            pstmt.setString(6, chatroom.getBulid_time());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, null);
        }

    }

    @Override
    public void delChatRoom(String chatroom_id) {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;

        try {
            pstmt = conn.prepareStatement(SQL_DEL_ChatRoom);
            pstmt.setString(1, chatroom_id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, null);
        }
    }

    @Override
    public byte[] getPicByNo(String chatroom_id) {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        byte[] picData = null;

        try {
            pstmt = conn.prepareStatement(SQL_GET_ChatRoom_BYNO);
            pstmt.setString(1, chatroom_id);
            rset = pstmt.executeQuery();

            if(rset.next()){
                picData=rset.getBytes("chatroom_pic");
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
    public ChatRoom getChatRoomByNo(String chatroom_id) {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        ChatRoom c = null;

        try {
            pstmt = conn.prepareStatement(SQL_GET_ChatRoom_BYNO);
            pstmt.setString(1, chatroom_id);
            rset = pstmt.executeQuery();

            if(rset.next()){
                c = new ChatRoom();
                c.setChatroom_id(rset.getString("chatroom_id"));
                c.setChatroom_name(rset.getString("chatroom_name"));
                c.setChatroom_pic(rset.getBytes("chatroom_pic"));
                c.setAdmin_number(rset.getString("admin_number"));
                c.setAdmin_name(rset.getString("admin_name"));
                c.setBulid_time(rset.getString("bulid_time"));
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
