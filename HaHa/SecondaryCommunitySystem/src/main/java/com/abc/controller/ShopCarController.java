package com.abc.controller;


import com.abc.dao.OrderDao;
import com.abc.dao.OrderDaoJDBCImpl;
import com.abc.dao.ShoppingDao;
import com.abc.dao.ShoppingDaoJDBCImpl;
import com.abc.domain.ShopCar;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ShopCarController {

    @PostMapping("/user_commodity/shopcar")
    public String createShopCar(ShopCar shopcar) throws Exception{


        ShoppingDao shoppingDao = new ShoppingDaoJDBCImpl();
        shoppingDao.addShopCar(shopcar);

        return "redirect:/user_commodity";
    }

    @GetMapping("/user_cart/{cartname}")
    public String loadUserOrder(@PathVariable String cartname, Model model) throws Exception{

        ShoppingDao shoppingDao = new ShoppingDaoJDBCImpl();
        model.addAttribute("cartList", shoppingDao.loadShopCar(cartname));

        return "user/cart_list";
    }

    @DeleteMapping("/user_cart/{cartname}/{shop_id}")
    public String removeOrder(@PathVariable String shop_id) throws Exception{

        ShoppingDao shoppingDao = new ShoppingDaoJDBCImpl();
        shoppingDao.delShopCar(shop_id);

        return "redirect:/user_cart/{cartname}";

    }

}
