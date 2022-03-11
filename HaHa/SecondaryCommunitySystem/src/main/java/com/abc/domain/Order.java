package com.abc.domain;

public class Order {

    private String order_id;
    private String user_name;
    private String user_phone;
    private String user_address;
    private String order_time;
    private String commodity_name;
    private String commodity_describe;
    private String commodity_type;
    private double commodity_price;
    private String order_number;
    private String commodity_shipping;
    private String commodity_address;

    public String getOrder_id() {
        return order_id;
    }

    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_phone() {
        return user_phone;
    }

    public void setUser_phone(String user_phone) {
        this.user_phone = user_phone;
    }

    public String getUser_address() {
        return user_address;
    }

    public void setUser_address(String user_address) {
        this.user_address = user_address;
    }

    public String getOrder_time() {
        return order_time;
    }

    public void setOrder_time(String order_time) {
        this.order_time = order_time;
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

    public String getOrder_number() {
        return order_number;
    }

    public void setOrder_number(String order_number) {
        this.order_number = order_number;
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
        return "Order{" +
                "order_id='" + order_id + '\'' +
                ", user_name='" + user_name + '\'' +
                ", user_phone='" + user_phone + '\'' +
                ", user_address='" + user_address + '\'' +
                ", order_time='" + order_time + '\'' +
                ", commodity_name='" + commodity_name + '\'' +
                ", commodity_describe='" + commodity_describe + '\'' +
                ", commodity_type='" + commodity_type + '\'' +
                ", commodity_price=" + commodity_price +
                ", order_number=" + order_number +
                ", commodity_shipping='" + commodity_shipping + '\'' +
                ", commodity_address='" + commodity_address + '\'' +
                '}';
    }
}
