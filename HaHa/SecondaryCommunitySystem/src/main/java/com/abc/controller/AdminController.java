package com.abc.controller;

import com.abc.dao.AdminDao;
import com.abc.dao.AdminDaoJDBCImpl;
import com.abc.domain.Admin;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.OutputStream;

@Controller
public class AdminController {

    @GetMapping("/admins")
    public String toMessage(Model model) throws Exception{
        AdminDao adminDao = new AdminDaoJDBCImpl();
        model.addAttribute("adminList", adminDao.loadAdmins());
        return "admin/msg_admin";
    }

    @GetMapping("/admins/input")
    public String toInput() throws Exception{

        return "admin/input_admin";
    }

    @PostMapping("/admins/list")
    public String createAdmin(Admin admin, MultipartFile adminpic) throws Exception{
        admin.setAdmin_pic(adminpic.getBytes());
        AdminDao adminDao = new AdminDaoJDBCImpl();
        adminDao.addAdmin(admin);
        return "redirect:/admins/list";
    }

    @GetMapping("/admins/list")
    public String loadAdmin(Admin admin,String adminNo,Model model) throws Exception{

        AdminDao adminDao = new AdminDaoJDBCImpl();
        model.addAttribute("adminList", adminDao.loadAdmins());
        return "admin/list_admin";
    }

    @GetMapping("/admins/list/{admin_number}")
    public String preUpdate(@PathVariable String admin_number, Model model) throws Exception{

        AdminDao adminDao = new AdminDaoJDBCImpl();
        Admin admin = adminDao.getAdminByNo(admin_number);

        model.addAttribute("admin", admin);

        return "admin/update_admin";

    }

    @PostMapping("/admins/list/{admin_number}")
    public String updateAdmin(@PathVariable String admin_number,Admin admin,MultipartFile adminpic) throws Exception{
        admin.setAdmin_number(admin_number);
        admin.setAdmin_pic(adminpic.getBytes());
        AdminDao adminDao = new AdminDaoJDBCImpl();
        adminDao.updateAdmin(admin);
        return "redirect:/admins/list";
    }

    @DeleteMapping("/admins/list/{admin_name}")
    public String removeAdmin(@PathVariable String admin_name) throws Exception{

        AdminDao adminDao = new AdminDaoJDBCImpl();
        adminDao.delAdmin(admin_name);

        return "redirect:/admins/list";

    }

    @GetMapping("/admins/list/{admin_number}/adminpic")
    public String getAdminPic(@PathVariable String admin_number, HttpServletResponse response, HttpServletRequest request) throws Exception{

        AdminDao adminDao = new AdminDaoJDBCImpl();
        byte[] picData = adminDao.getPicByNo(admin_number);

        if(picData==null || picData.length==0){
            String imgPath = request.getRealPath("/static/pic/default.jpg");
            System.out.println(imgPath);
            FileInputStream fis = new FileInputStream(imgPath);
            picData = new byte[fis.available()];
            fis.read(picData);
            fis.close();
        }

        OutputStream oos = response.getOutputStream();
        response.setContentType("image/jpeg");
        oos.write(picData);
        oos.flush();
        oos.close();

        return null;

    }


}
