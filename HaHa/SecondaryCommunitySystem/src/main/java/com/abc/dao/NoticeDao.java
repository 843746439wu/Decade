package com.abc.dao;

import com.abc.domain.Notice;

import java.util.List;

public interface NoticeDao {

    List<Notice> loadNotices();
    void addNotice(Notice notice);
    void delNotice(String notice_no);

}
