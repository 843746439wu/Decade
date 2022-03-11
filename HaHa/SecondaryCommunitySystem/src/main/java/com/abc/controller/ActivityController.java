package com.abc.controller;

import com.abc.dao.ActivityDao;
import com.abc.dao.ActivityDaoJDBCImpl;
import com.abc.domain.Activity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ActivityController {

    @GetMapping("/activity/input")
    public String toInput() throws Exception{

        return "activity/input_activity";
    }

    @PostMapping("/activity")
    public String createActivity(Activity activity) throws Exception{

        ActivityDao activityDao = new ActivityDaoJDBCImpl();
        activityDao.addActivity(activity);
        return "redirect:/activity";
    }

    @GetMapping("/activity")
    public String loadActivity(Model model) throws Exception{

        ActivityDao activityDao = new ActivityDaoJDBCImpl();
        model.addAttribute("activityList", activityDao.loadActivitys());

        return "activity/list_activity";
    }

    @DeleteMapping("/activity/{act_no}")
    public String removeActivity(@PathVariable String act_no) throws Exception{

        ActivityDao activityDao = new ActivityDaoJDBCImpl();
        activityDao.delActivity(act_no);

        return "redirect:/activity";

    }
    @GetMapping("/user_act")
    public String loadUserActivity(Model model) throws Exception{

        ActivityDao activityDao = new ActivityDaoJDBCImpl();
        model.addAttribute("activityList", activityDao.loadActivitys());

        return "user/activity_user";
    }

    @GetMapping("/user_act/{act_no}")
    public String joinActivity(@PathVariable String act_no, Model model) throws Exception{

        ActivityDao activityDao = new ActivityDaoJDBCImpl();
        Activity activity = activityDao.getActivityByNo(act_no);
        model.addAttribute("activity", activity);

        return "user/join_user";
    }

}
