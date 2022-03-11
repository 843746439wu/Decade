package com.abc.domain;

public class Join {

    private String join_id;
    private String join_userno;
    private String join_username;
    private String join_actno;
    private String join_actname;
    private String join_acttime;
    private String join_acttitle;
    private String join_actnum;

    public String getJoin_id() {
        return join_id;
    }

    public void setJoin_id(String join_id) {
        this.join_id = join_id;
    }

    public String getJoin_userno() {
        return join_userno;
    }

    public void setJoin_userno(String join_userno) {
        this.join_userno = join_userno;
    }

    public String getJoin_username() {
        return join_username;
    }

    public void setJoin_username(String join_username) {
        this.join_username = join_username;
    }

    public String getJoin_actno() {
        return join_actno;
    }

    public void setJoin_actno(String join_actno) {
        this.join_actno = join_actno;
    }

    public String getJoin_actname() {
        return join_actname;
    }

    public void setJoin_actname(String join_actname) {
        this.join_actname = join_actname;
    }

    public String getJoin_acttime() {
        return join_acttime;
    }

    public void setJoin_acttime(String join_acttime) {
        this.join_acttime = join_acttime;
    }

    public String getJoin_acttitle() {
        return join_acttitle;
    }

    public void setJoin_acttitle(String join_acttitle) {
        this.join_acttitle = join_acttitle;
    }

    public String getJoin_actnum() {
        return join_actnum;
    }

    public void setJoin_actnum(String join_actnum) {
        this.join_actnum = join_actnum;
    }

    @Override
    public String toString() {
        return "Join{" +
                "join_id='" + join_id + '\'' +
                ", join_userno='" + join_userno + '\'' +
                ", join_username='" + join_username + '\'' +
                ", join_actno='" + join_actno + '\'' +
                ", join_actname='" + join_actname + '\'' +
                ", join_acttime='" + join_acttime + '\'' +
                ", join_acttitle='" + join_acttitle + '\'' +
                ", join_actnum='" + join_actnum + '\'' +
                '}';
    }

}
