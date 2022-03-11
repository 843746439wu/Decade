package com.abc.dao;

import com.abc.domain.Chat;
import com.abc.domain.ShopCar;
import com.abc.utils.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ChatDaoJDBCImpl implements ChatDao{

    private static final String SQL_ADD_Chat="insert into tbl_chat values(?,?,?,?,?,?)";
    private static final String SQL_LOAD_Chat= "select * from tbl_chat where room_id=?";
    private static final String SQL_DEL_Chat="delete from tbl_chat where chat_id=?";

    @Override
    public List<Chat> loadChat(String room_id) {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        List<Chat> chatList = new ArrayList<>();

        try {
            pstmt = conn.prepareStatement(SQL_LOAD_Chat);
            pstmt.setString(1, room_id);
            rset = pstmt.executeQuery();

            while(rset.next()){
                Chat c = new Chat();
                c.setRoom_id(rset.getString("room_id"));
                c.setChat_id(rset.getString("chat_id"));
                c.setChatperson_no(rset.getString("chatperson_no"));
                c.setChatperson_name(rset.getString("chatperson_name"));
                c.setChat_content(rset.getString("chat_content"));
                c.setChat_time(rset.getString("chat_time"));
                chatList.add(c);
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, rset);
        }
        return chatList;
    }

    @Override
    public void addChat(Chat chat) {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;

        try {
            pstmt = conn.prepareStatement(SQL_ADD_Chat);
            pstmt.setString(1, chat.getRoom_id());
            pstmt.setString(2, chat.getChat_id());
            pstmt.setString(3, chat.getChatperson_no());
            pstmt.setString(4, chat.getChatperson_name());
            pstmt.setString(5, chat.getChat_content());
            pstmt.setString(6, chat.getChat_time());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, null);
        }
    }

    @Override
    public void delChat(String chat_id) {
        Connection conn = DBUtils.getConn();
        PreparedStatement pstmt = null;

        try {
            pstmt = conn.prepareStatement(SQL_DEL_Chat);
            pstmt.setString(1, chat_id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            DBUtils.releaseRes(conn, pstmt, null);
        }
    }

}
