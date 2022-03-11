package com.abc.domain;

public class CommentCommodity {

    private String comment_id;
    private String user_no;
    private String user_name;
    private String commdity_id;
    private String comment_time;
    private String commodity_comment;

    public String getComment_id() {
        return comment_id;
    }

    public void setComment_id(String comment_id) {
        this.comment_id = comment_id;
    }

    public String getUser_no() {
        return user_no;
    }

    public void setUser_no(String user_no) {
        this.user_no = user_no;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getCommdity_id() {
        return commdity_id;
    }

    public void setCommdity_id(String commdity_id) {
        this.commdity_id = commdity_id;
    }

    public String getComment_time() {
        return comment_time;
    }

    public void setComment_time(String comment_time) {
        this.comment_time = comment_time;
    }

    public String getCommodity_comment() {
        return commodity_comment;
    }

    public void setCommodity_comment(String commodity_comment) {
        this.commodity_comment = commodity_comment;
    }

    @Override
    public String toString() {
        return "CommentCommodity{" +
                "comment_id='" + comment_id + '\'' +
                ", user_no='" + user_no + '\'' +
                ", user_name='" + user_name + '\'' +
                ", commdity_id='" + commdity_id + '\'' +
                ", comment_time='" + comment_time + '\'' +
                ", commodity_comment='" + commodity_comment + '\'' +
                '}';
    }
}
