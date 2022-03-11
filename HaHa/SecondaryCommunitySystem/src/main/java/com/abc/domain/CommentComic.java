package com.abc.domain;

public class CommentComic {

    private String comment_id;
    private String user_no;
    private String user_name;
    private String comic_name;
    private String comment_time;
    private String user_comment;

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

    public String getComment_time() {
        return comment_time;
    }

    public String getComic_name() {
        return comic_name;
    }

    public void setComic_name(String comic_name) {
        this.comic_name = comic_name;
    }

    public void setComment_time(String comment_time) {
        this.comment_time = comment_time;
    }

    public String getUser_comment() {
        return user_comment;
    }

    public void setUser_comment(String user_comment) {
        this.user_comment = user_comment;
    }

    @Override
    public String toString() {
        return "CommentComic{" +
                "comment_id='" + comment_id + '\'' +
                ", user_no='" + user_no + '\'' +
                ", user_name='" + user_name + '\'' +
                ", comic_name='" + comic_name + '\'' +
                ", comment_time='" + comment_time + '\'' +
                ", user_comment='" + user_comment + '\'' +
                '}';
    }
}
