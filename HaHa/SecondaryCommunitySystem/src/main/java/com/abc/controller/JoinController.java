package com.abc.controller;

import com.abc.dao.CommodityDao;
import com.abc.dao.CommodityDaoJDBCImpl;
import com.abc.dao.JoinDao;
import com.abc.dao.JoinDaoJDBCImpl;
import com.abc.domain.Commodity;
import com.abc.domain.Join;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class JoinController {

    @PostMapping("/user_act/joins")
    public String createJoin(Join join) throws Exception{


        JoinDao joinDao = new JoinDaoJDBCImpl();
        joinDao.addJoin(join);

        return "redirect:/user_act";
    }

    @GetMapping("/join/list")
    public String loadJoin(Model model) throws Exception{

        JoinDao joinDao = new JoinDaoJDBCImpl();
        model.addAttribute("joinList", joinDao.loadJoin());

        return "activity/user_activity";
    }

    @DeleteMapping("/user_act/joins/{join_id}")
    public String removeJoin(@PathVariable String join_id) throws Exception{

        JoinDao joinDao = new JoinDaoJDBCImpl();
        joinDao.delJoin(join_id);

        return "redirect:/join/list";

    }

}
