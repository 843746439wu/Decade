package com.abc.domain;

public class Activity {

    private String act_no;
    private String act_name;
    private String act_uptime;
    private String act_downtime;
    private String act_title;
    private String act_content;
    private String act_number;

    public String getAct_no() {
        return act_no;
    }

    public void setAct_no(String act_no) {
        this.act_no = act_no;
    }

    public String getAct_name() {
        return act_name;
    }

    public void setAct_name(String act_name) {
        this.act_name = act_name;
    }

    public String getAct_uptime() {
        return act_uptime;
    }

    public void setAct_uptime(String act_uptime) {
        this.act_uptime = act_uptime;
    }

    public String getAct_downtime() {
        return act_downtime;
    }

    public void setAct_downtime(String act_downtime) {
        this.act_downtime = act_downtime;
    }

    public String getAct_title() {
        return act_title;
    }

    public void setAct_title(String act_title) {
        this.act_title = act_title;
    }

    public String getAct_content() {
        return act_content;
    }

    public void setAct_content(String act_content) {
        this.act_content = act_content;
    }

    public String getAct_number() {
        return act_number;
    }

    public void setAct_number(String act_number) {
        this.act_number = act_number;
    }

    @Override
    public String toString() {
        return "Activity{" +
                "act_no='" + act_no + '\'' +
                ", act_name='" + act_name + '\'' +
                ", act_uptime='" + act_uptime + '\'' +
                ", act_downtime='" + act_downtime + '\'' +
                ", act_title='" + act_title + '\'' +
                ", act_content='" + act_content + '\'' +
                ", act_number='" + act_number + '\'' +
                '}';
    }
}
