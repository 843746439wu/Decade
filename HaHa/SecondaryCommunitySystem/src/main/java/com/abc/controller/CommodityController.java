package com.abc.controller;



import com.abc.dao.*;
import com.abc.domain.Commodity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.OutputStream;

@Controller
public class CommodityController {

    @GetMapping("/commodity/input")
    private String toInput() throws Exception{

        return "commodity/input_commodity";
    }

    @PostMapping("/commodity")
    public String createCommodity(Commodity commodity, MultipartFile commpic) throws Exception{

        commodity.setCommodity_pic(commpic.getBytes());
        CommodityDao comicDao = new CommodityDaoJDBCImpl();
        comicDao.addCommodity(commodity);
        return "redirect:/commodity";
    }

    @GetMapping("/commodity")
    public String loadcommodity(Model model) throws Exception{

        CommodityDao commodityDao = new CommodityDaoJDBCImpl();
        model.addAttribute("commList", commodityDao.loadCommoditys());

        return "commodity/list_commodity";

    }

    @GetMapping("/commodity/{commodity_name}")
    public String preUpdate(@PathVariable String commodity_name, Model model) throws Exception{

        CommodityDao commodityDao = new CommodityDaoJDBCImpl();
        Commodity commodity = commodityDao.getCommodityByName(commodity_name);

        model.addAttribute("commodity", commodity);

        return "commodity/update_commodity";

    }

    @PostMapping("/commodity/{commodity_name}")
    public String updateCommodity(Commodity commodity,MultipartFile commpic,@PathVariable String commodity_name) throws Exception{

        commodity.setCommodity_name(commodity_name);
        commodity.setCommodity_pic(commpic.getBytes());
        CommodityDao commodityDao = new CommodityDaoJDBCImpl();
        commodityDao.updateCommodity(commodity);
        return "redirect:/commodity";
    }

    @DeleteMapping("/commodity/{commodity_name}")
    public String removeCommodity(@PathVariable String commodity_name) throws Exception{

        CommodityDao commodityDao = new CommodityDaoJDBCImpl();
        commodityDao.delCommodity(commodity_name);

        return "redirect:/commodity";

    }

    @GetMapping("/commodity/{commodity_name}/commpic")
    public String getCommodityPic(@PathVariable String commodity_name, HttpServletResponse response, HttpServletRequest request) throws Exception{

        CommodityDao commodityDao = new CommodityDaoJDBCImpl();
        byte[] picData = commodityDao.getPicByName(commodity_name);

        if(picData==null || picData.length==0){
            String imgPath = request.getRealPath("/static/pic/default.jpg");
            System.out.println(imgPath);
            FileInputStream fis = new FileInputStream(imgPath);
            picData = new byte[fis.available()];
            fis.read(picData);
            fis.close();
        }

        OutputStream oos = response.getOutputStream();
        response.setContentType("image/jpeg");
        oos.write(picData);
        oos.flush();
        oos.close();

        return null;

    }

    @GetMapping("/user_commodity")
    public String loadcommoditys(Model model) throws Exception{

        CommodityDao commodityDao = new CommodityDaoJDBCImpl();
        model.addAttribute("commList", commodityDao.loadCommoditys());

        return "user/commodity_user";

    }

    @GetMapping("/user_commodity/{commodity_id}")
    public String checkcommodity(@PathVariable String commodity_id, Model model) throws Exception{

        CommodityDao commodityDao = new CommodityDaoJDBCImpl();
        Commodity commodity = commodityDao.getCommodityByName(commodity_id);

        model.addAttribute("commodity", commodity);

        CommentCommodityDao commentCommdityDao = new CommentCommodityDaoJDBCImpl();
        model.addAttribute("commcommodityList", commentCommdityDao.loadCommentCommdty(commodity_id));


        return "user/details_user";
    }

    @GetMapping("/user_commodity/order/{commodity_id}")
    public String buycommodity(@PathVariable String commodity_id, Model model) throws Exception{

        CommodityDao commodityDao = new CommodityDaoJDBCImpl();
        Commodity commodity = commodityDao.getCommodityByName(commodity_id);

        model.addAttribute("commodity", commodity);


        return "user/buy_commodity";
    }

    @GetMapping("/user_commodity/shopcar/{commodity_id}")
    public String shopcar(@PathVariable String commodity_id, Model model) throws Exception{

        CommodityDao commodityDao = new CommodityDaoJDBCImpl();
        Commodity commodity = commodityDao.getCommodityByName(commodity_id);

        model.addAttribute("commodity", commodity);


        return "user/car_commodity";
    }

}
