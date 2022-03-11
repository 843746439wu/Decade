package com.abc.domain;

import java.util.Arrays;

public class Collect {

    private String collect_id;
    private String comic_name;
    private int comic_number;

    public String getCollect_id() {
        return collect_id;
    }

    public void setCollect_id(String collect_id) {
        this.collect_id = collect_id;
    }

    public String getComic_name() {
        return comic_name;
    }

    public void setComic_name(String comic_name) {
        this.comic_name = comic_name;
    }

    public int getComic_number() {
        return comic_number;
    }

    public void setComic_number(int comic_number) {
        this.comic_number = comic_number;
    }


    @Override
    public String toString() {
        return "Collect{" +
                "collect_id='" + collect_id + '\'' +
                ", comic_name='" + comic_name + '\'' +
                ", comic_number=" + comic_number +
                '}';
    }
}
