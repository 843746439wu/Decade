package com.abc.dao;

import com.abc.domain.Join;

import java.util.List;

public interface JoinDao {

    List<Join> loadJoin();
    void addJoin(Join join);
    void delJoin(String join_id);
}
