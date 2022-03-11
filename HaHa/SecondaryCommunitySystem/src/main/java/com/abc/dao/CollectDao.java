package com.abc.dao;

import com.abc.domain.Collect;

import java.util.List;

public interface CollectDao {

    List<Collect> loadCollect();
    void addCollect(Collect collect);
    void delCollect(String collect_id);

}
