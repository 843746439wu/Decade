package com.abc.domain;

import java.util.Arrays;

public class Commodity extends ValueObject {

    private String commodity_id;
    private String commodity_name;
    private String commodity_type;
    private double commodity_price;
    private String commodity_describe;
    private byte[] commodity_pic;
    private int commodity_num;
    private String commodity_style;
    private String commodity_shipping;
    private int commodity_discount;
    private String commodity_address;

    public String getCommodity_id() {
        return commodity_id;
    }

    public void setCommodity_id(String commodity_id) {
        this.commodity_id = commodity_id;
    }

    public String getCommodity_name() {
        return commodity_name;
    }

    public void setCommodity_name(String commodity_name) {
        this.commodity_name = commodity_name;
    }

    public String getCommodity_type() {
        return commodity_type;
    }

    public void setCommodity_type(String commodity_type) {
        this.commodity_type = commodity_type;
    }

    public Double getCommodity_price() {
        return commodity_price;
    }

    public void setCommodity_price(Double commodity_price) {
        this.commodity_price = commodity_price;
    }

    public String getCommodity_describe() {
        return commodity_describe;
    }

    public void setCommodity_describe(String commodity_describe) {
        this.commodity_describe = commodity_describe;
    }

    public byte[] getCommodity_pic() {
        return commodity_pic;
    }

    public void setCommodity_pic(byte[] commodity_pic) {
        this.commodity_pic = commodity_pic;
    }

    public Integer getCommodity_num() {
        return commodity_num;
    }

    public void setCommodity_num(Integer commodity_num) {
        this.commodity_num = commodity_num;
    }

    public String getCommodity_style() {
        return commodity_style;
    }

    public void setCommodity_style(String commodity_style) {
        this.commodity_style = commodity_style;
    }

    public String getCommodity_shipping() {
        return commodity_shipping;
    }

    public void setCommodity_shipping(String commodity_shipping) {
        this.commodity_shipping = commodity_shipping;
    }

    public int getCommodity_discount() {
        return commodity_discount;
    }

    public void setCommodity_discount(int commodity_discount) {
        this.commodity_discount = commodity_discount;
    }

    public String getCommodity_address() {
        return commodity_address;
    }

    public void setCommodity_address(String commodity_address) {
        this.commodity_address = commodity_address;
    }

    @Override
    public String toString() {
        return "Commodity{" +
                "commodity_id='" + commodity_id + '\'' +
                ", commodity_name='" + commodity_name + '\'' +
                ", commodity_type='" + commodity_type + '\'' +
                ", commodity_price=" + commodity_price +
                ", commodity_describe='" + commodity_describe + '\'' +
                ", commodity_pic=" + Arrays.toString(commodity_pic) +
                ", commodity_num=" + commodity_num +
                ", commodity_style='" + commodity_style + '\'' +
                ", commodity_shipping='" + commodity_shipping + '\'' +
                ", commodity_discount=" + commodity_discount +
                ", commodity_address='" + commodity_address + '\'' +
                '}';
    }
}
