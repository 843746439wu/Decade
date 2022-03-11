package com.abc.dao;

import com.abc.domain.Activity;
import com.abc.domain.Comic;

import java.util.List;

public interface ActivityDao {

    List<Activity> loadActivitys();
    void addActivity(Activity activity);
    void delActivity(String act_no);
    Activity getActivityByNo(String act_no);

}
