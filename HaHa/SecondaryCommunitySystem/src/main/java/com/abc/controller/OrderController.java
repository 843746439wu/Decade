package com.abc.controller;


import com.abc.dao.OrderDao;
import com.abc.dao.OrderDaoJDBCImpl;
import com.abc.domain.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class OrderController {

    @PostMapping("/user_commodity/order")
    public String createOrder(Order order) throws Exception{


        OrderDao orderDao = new OrderDaoJDBCImpl();
        orderDao.addOrder(order);

        return "redirect:/user_commodity";
    }

    @GetMapping("/order")
    public String loadOrder(Model model) throws Exception{

        OrderDao orderDao = new OrderDaoJDBCImpl();
        model.addAttribute("orderList", orderDao.loadOrder());

        return "commodity/buy_list";
    }

    @GetMapping("/user_order/{ordername}")
    public String loadUserOrder(@PathVariable String ordername, Model model) throws Exception{

        OrderDao orderDao = new OrderDaoJDBCImpl();
        model.addAttribute("orderList", orderDao.loadUserOrder(ordername));

        return "user/buy_list";
    }


    @DeleteMapping("/user_order/{ordername}/{order_id}")
    public String removeOrder(@PathVariable String order_id) throws Exception{

        OrderDao orderDao = new OrderDaoJDBCImpl();
        orderDao.delOrder(order_id);

        return "redirect:/user_order/{ordername}";

    }


}
