package com.abc.domain;

public class Notice {

    private String notice_no;
    private String notice_name;
    private String notice_uptime;
    private String notice_downtime;
    private String notice_title;
    private String notice_content;

    public String getNotice_no() {
        return notice_no;
    }

    public void setNotice_no(String notice_no) {
        this.notice_no = notice_no;
    }

    public String getNotice_name() {
        return notice_name;
    }

    public void setNotice_name(String notice_name) {
        this.notice_name = notice_name;
    }

    public String getNotice_uptime() {
        return notice_uptime;
    }

    public void setNotice_uptime(String notice_uptime) {
        this.notice_uptime = notice_uptime;
    }

    public String getNotice_downtime() {
        return notice_downtime;
    }

    public void setNotice_downtime(String notice_downtime) {
        this.notice_downtime = notice_downtime;
    }

    public String getNotice_title() {
        return notice_title;
    }

    public void setNotice_title(String notice_title) {
        this.notice_title = notice_title;
    }

    public String getNotice_content() {
        return notice_content;
    }

    public void setNotice_content(String notice_content) {
        this.notice_content = notice_content;
    }

    @Override
    public String toString() {
        return "Notice{" +
                "notice_no='" + notice_no + '\'' +
                ", notice_name='" + notice_name + '\'' +
                ", notice_uptime='" + notice_uptime + '\'' +
                ", notice_downtime='" + notice_downtime + '\'' +
                ", notice_title='" + notice_title + '\'' +
                ", notice_content='" + notice_content + '\'' +
                '}';
    }
}
