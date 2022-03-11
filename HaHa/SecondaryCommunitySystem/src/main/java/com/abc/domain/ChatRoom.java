package com.abc.domain;

import java.util.Arrays;

public class ChatRoom {

    private String chatroom_id;
    private String chatroom_name;
    private byte[] chatroom_pic;
    private String admin_number;
    private String admin_name;
    private String bulid_time;

    public String getChatroom_id() {
        return chatroom_id;
    }

    public void setChatroom_id(String chatroom_id) {
        this.chatroom_id = chatroom_id;
    }

    public String getChatroom_name() {
        return chatroom_name;
    }

    public void setChatroom_name(String chatroom_name) {
        this.chatroom_name = chatroom_name;
    }

    public byte[] getChatroom_pic() {
        return chatroom_pic;
    }

    public void setChatroom_pic(byte[] chatroom_pic) {
        this.chatroom_pic = chatroom_pic;
    }

    public String getAdmin_number() {
        return admin_number;
    }

    public void setAdmin_number(String admin_number) {
        this.admin_number = admin_number;
    }

    public String getAdmin_name() {
        return admin_name;
    }

    public void setAdmin_name(String admin_name) {
        this.admin_name = admin_name;
    }

    public String getBulid_time() {
        return bulid_time;
    }

    public void setBulid_time(String bulid_time) {
        this.bulid_time = bulid_time;
    }

    @Override
    public String toString() {
        return "ChatRoom{" +
                "chatroom_id='" + chatroom_id + '\'' +
                ", chatroom_name='" + chatroom_name + '\'' +
                ", chatroom_pic=" + Arrays.toString(chatroom_pic) +
                ", admin_number='" + admin_number + '\'' +
                ", admin_name='" + admin_name + '\'' +
                ", bulid_time='" + bulid_time + '\'' +
                '}';
    }
}
