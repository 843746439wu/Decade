package com.abc.dao;

import com.abc.domain.Activity;
import com.abc.domain.Comic;
import com.abc.domain.Commodity;

import java.util.List;

public interface CommodityDao {

    List<Commodity> loadCommoditys();
    void addCommodity(Commodity commodity);
    Commodity getCommodityByName(String commodity_id);
    byte[] getPicByName(String commodity_name);
    void delCommodity(String commodity_name);
    void updateCommodity(Commodity commodity);

}
