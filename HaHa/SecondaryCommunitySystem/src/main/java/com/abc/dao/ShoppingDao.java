package com.abc.dao;

import com.abc.domain.Order;
import com.abc.domain.ShopCar;

import java.util.List;

public interface ShoppingDao {

    void addShopCar(ShopCar shoppingCar);
    List<ShopCar> loadShopCar(String user_name);
    void delShopCar(String shop_id);

}
