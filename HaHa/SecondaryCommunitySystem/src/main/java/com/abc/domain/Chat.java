package com.abc.domain;

import java.util.Arrays;

public class Chat {

    private String room_id;
    private String chat_id;
    private String chatperson_no;
    private String chatperson_name;
    private String chat_content;
    private String chat_time;

    public String getRoom_id() {
        return room_id;
    }

    public void setRoom_id(String room_id) {
        this.room_id = room_id;
    }

    public String getChat_id() {
        return chat_id;
    }

    public void setChat_id(String chat_id) {
        this.chat_id = chat_id;
    }

    public String getChatperson_no() {
        return chatperson_no;
    }

    public void setChatperson_no(String chatperson_no) {
        this.chatperson_no = chatperson_no;
    }

    public String getChatperson_name() {
        return chatperson_name;
    }

    public void setChatperson_name(String chatperson_name) {
        this.chatperson_name = chatperson_name;
    }

    public String getChat_content() {
        return chat_content;
    }

    public void setChat_content(String chat_content) {
        this.chat_content = chat_content;
    }

    public String getChat_time() {
        return chat_time;
    }

    public void setChat_time(String chat_time) {
        this.chat_time = chat_time;
    }

    @Override
    public String toString() {
        return "Chat{" +
                "room_id='" + room_id + '\'' +
                ", chat_id='" + chat_id + '\'' +
                ", chatperson_no='" + chatperson_no + '\'' +
                ", chatperson_name='" + chatperson_name + '\'' +
                ", chat_content='" + chat_content + '\'' +
                ", chat_time='" + chat_time + '\'' +
                '}';
    }
}
