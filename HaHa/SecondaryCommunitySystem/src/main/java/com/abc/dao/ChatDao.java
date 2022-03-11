package com.abc.dao;

import com.abc.domain.Chat;

import java.util.List;

public interface ChatDao {

    List<Chat> loadChat(String room_id);
    void addChat(Chat chat);
    void delChat(String chat_id);

}
