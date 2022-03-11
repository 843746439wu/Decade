package com.abc.dao;

import com.abc.domain.ChatRoom;

import java.util.List;

public interface ChatRoomDao {
    List<ChatRoom> loadChatRoom();
    void addChatRoom(ChatRoom chatroom);
    void delChatRoom(String chatroom_id);
    byte[] getPicByNo(String chatroom_id);
    ChatRoom getChatRoomByNo(String chatroom_id);
}
