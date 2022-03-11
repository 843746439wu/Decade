package com.abc.controller;

import com.abc.dao.NoticeDao;
import com.abc.dao.NoticeDaoJDBCImpl;
import com.abc.domain.Notice;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class NoticeController {

    @GetMapping("/notice/input")
    public String toInput() throws Exception{

        return "notice/input_notice";
    }

    @PostMapping("/notice")
    public String createNotice(Notice notice) throws Exception{

        NoticeDao noticeDao = new NoticeDaoJDBCImpl();
        noticeDao.addNotice(notice);
        return "redirect:/notice";
    }

    @GetMapping("/notice")
    public String loadNotice(Model model) throws Exception{

        NoticeDao noticeDao = new NoticeDaoJDBCImpl();
        model.addAttribute("noticeList", noticeDao.loadNotices());

        return "notice/list_notice";
    }

    @DeleteMapping("/notice/{notice_no}")
    public String removeNotice(@PathVariable String notice_no) throws Exception{

        NoticeDao noticeDao = new NoticeDaoJDBCImpl();
        noticeDao.delNotice(notice_no);

        return "redirect:/notice";

    }

    @GetMapping("/user_notice")
    public String loadUserNotice(Model model) throws Exception{

        NoticeDao noticeDao = new NoticeDaoJDBCImpl();
        model.addAttribute("noticeList", noticeDao.loadNotices());

        return "user/notice_user";
    }

}
