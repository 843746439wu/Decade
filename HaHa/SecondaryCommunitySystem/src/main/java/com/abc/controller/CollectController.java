package com.abc.controller;


import com.abc.dao.CollectDao;
import com.abc.dao.CollectDaoJDBCImpl;
import com.abc.domain.Collect;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class CollectController {

    @PostMapping("/collect")
    public String createCollect(Collect collect) throws Exception{

        CollectDao collectDao = new CollectDaoJDBCImpl();
        collectDao.addCollect(collect);

        return "redirect:/user_comic";
    }

    @GetMapping("/collect/list")
    public String loadCollect(Model model) throws Exception{

        CollectDao collectDao = new CollectDaoJDBCImpl();
        model.addAttribute("collectList", collectDao.loadCollect());

        return "user/collect_comic";
    }

    @DeleteMapping("/collect/list/{collect_id}")
    public String removeCollect(@PathVariable String collect_id) throws Exception{

        CollectDao collectDao = new CollectDaoJDBCImpl();;
        collectDao.delCollect(collect_id);

        return "redirect:/collect/list";

    }

}
