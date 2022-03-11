package com.abc.domain;

public class ShopCar {

    private String shop_id;
    private String commodity_id;
    private String user_name;
    private String commodity_name;
    private String commodity_describe;
    private String commodity_type;
    private double commodity_price;
    private String shop_number;
    private String commodity_shipping;
    private String commodity_address;

    public String getShop_id() {
        return shop_id;
    }

    public void setShop_id(String shop_id) {
        this.shop_id = shop_id;
    }

    public String getCommodity_id() {
        return commodity_id;
    }

    public void setCommodity_id(String commodity_id) {
        this.commodity_id = commodity_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getCommodity_name() {
        return commodity_name;
    }

    public void setCommodity_name(String commodity_name) {
        this.commodity_name = commodity_name;
    }

    public String getCommodity_describe() {
        return commodity_describe;
    }

    public void setCommodity_describe(String commodity_describe) {
        this.commodity_describe = commodity_describe;
    }

    public String getCommodity_type() {
        return commodity_type;
    }

    public void setCommodity_type(String commodity_type) {
        this.commodity_type = commodity_type;
    }

    public double getCommodity_price() {
        return commodity_price;
    }

    public void setCommodity_price(double commodity_price) {
        this.commodity_price = commodity_price;
    }

    public String getShop_number() {
        return shop_number;
    }

    public void setShop_number(String shop_number) {
        this.shop_number = shop_number;
    }

    public String getCommodity_shipping() {
        return commodity_shipping;
    }

    public void setCommodity_shipping(String commodity_shipping) {
        this.commodity_shipping = commodity_shipping;
    }

    public String getCommodity_address() {
        return commodity_address;
    }

    public void setCommodity_address(String commodity_address) {
        this.commodity_address = commodity_address;
    }

    @Override
    public String toString() {
        return "ShopCar{" +
                "shop_id='" + shop_id + '\'' +
                ", commodity_id='" + commodity_id + '\'' +
                ", user_name='" + user_name + '\'' +
                ", commodity_name='" + commodity_name + '\'' +
                ", commodity_describe='" + commodity_describe + '\'' +
                ", commodity_type='" + commodity_type + '\'' +
                ", commodity_price=" + commodity_price +
                ", shop_number='" + shop_number + '\'' +
                ", commodity_shipping='" + commodity_shipping + '\'' +
                ", commodity_address='" + commodity_address + '\'' +
                '}';
    }
}
