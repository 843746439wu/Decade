package com.abc.dao;

import com.abc.domain.Order;

import java.util.List;

public interface OrderDao {

    List<Order> loadOrder();
    List<Order> loadUserOrder(String user_name);
    void addOrder(Order order);
    void delOrder(String order_id);


}
