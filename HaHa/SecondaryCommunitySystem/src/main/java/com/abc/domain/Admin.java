package com.abc.domain;

import java.util.Arrays;

public class Admin extends ValueObject{

    private String admin_number;
    private String admin_password;
    private String admin_name;
    private String admin_id;
    private String admin_phone;
    private String admin_address;
    private String admin_email;
    private String admin_birth;
    private int admin_qq;
    private byte[] admin_pic;

    public String getAdmin_number() {
        return admin_number;
    }

    public void setAdmin_number(String admin_number) {
        this.admin_number = admin_number;
    }

    public String getAdmin_password() {
        return admin_password;
    }

    public void setAdmin_password(String admin_password) {
        this.admin_password = admin_password;
    }

    public String getAdmin_name() {
        return admin_name;
    }

    public void setAdmin_name(String admin_name) {
        this.admin_name = admin_name;
    }

    public String getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(String admin_id) {
        this.admin_id = admin_id;
    }

    public String getAdmin_phone() {
        return admin_phone;
    }

    public void setAdmin_phone(String admin_phone) {
        this.admin_phone = admin_phone;
    }

    public String getAdmin_address() {
        return admin_address;
    }

    public void setAdmin_address(String admin_address) {
        this.admin_address = admin_address;
    }

    public String getAdmin_email() {
        return admin_email;
    }

    public void setAdmin_email(String admin_email) {
        this.admin_email = admin_email;
    }

    public String getAdmin_birth() {
        return admin_birth;
    }

    public void setAdmin_birth(String admin_birth) {
        this.admin_birth = admin_birth;
    }

    public int getAdmin_qq() {
        return admin_qq;
    }

    public void setAdmin_qq(int admin_qq) {
        this.admin_qq = admin_qq;
    }

    public byte[] getAdmin_pic() {
        return admin_pic;
    }

    public void setAdmin_pic(byte[] admin_pic) {
        this.admin_pic = admin_pic;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "admin_number='" + admin_number + '\'' +
                ", admin_password='" + admin_password + '\'' +
                ", admin_name='" + admin_name + '\'' +
                ", admin_id='" + admin_id + '\'' +
                ", admin_phone='" + admin_phone + '\'' +
                ", admin_address='" + admin_address + '\'' +
                ", admin_email='" + admin_email + '\'' +
                ", admin_birth='" + admin_birth + '\'' +
                ", admin_qq=" + admin_qq +
                ", admin_pic=" + Arrays.toString(admin_pic) +
                '}';
    }
}
