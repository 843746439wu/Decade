package com.abc.controller;

import com.abc.dao.AdminDao;
import com.abc.dao.AdminDaoJDBCImpl;
import com.abc.dao.UserDao;
import com.abc.dao.UserDaoJDBCImpl;
import com.abc.domain.Admin;
import com.abc.domain.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.OutputStream;

@Controller
public class UserController {

    @GetMapping("/user_home")
    public String toInput() throws Exception{

        return "home/user_home";
    }

    @PostMapping("/user_wait")
    public String createUser(User user, MultipartFile userpic) throws Exception{
        user.setUser_pic(userpic.getBytes());
        UserDao userDao = new UserDaoJDBCImpl();
        userDao.addUser(user);
        return "redirect:/user_home";
    }

    @GetMapping("/users/list")
    public String loadUser(User user, String userNo, Model model) throws Exception{

        UserDao userDao = new UserDaoJDBCImpl();
        model.addAttribute("userList", userDao.loadusers());

        return "admin/list_user";
    }

    @GetMapping("/user")
    public String loadUsers(Model model) throws Exception{

        UserDao userDao = new UserDaoJDBCImpl();
        model.addAttribute("userList", userDao.loadusers());

        return "user/msg_user";
    }

    @GetMapping("/user/{user_no}")
    public String preUpdate(@PathVariable String user_no, Model model) throws Exception{

        UserDao userDao = new UserDaoJDBCImpl();
        User user = userDao.getUserByNo(user_no);

        model.addAttribute("user", user);

        return "user/update_user";

    }

    @PostMapping("/user/{user_no}")
    public String updateUser(@PathVariable String user_no,User user,MultipartFile userpic) throws Exception{
        user.setUser_no(user_no);
        user.setUser_pic(userpic.getBytes());
        UserDao userDao = new UserDaoJDBCImpl();
        userDao.updateUser(user);
        return "redirect:/user";
    }


    @GetMapping("/user/{user_no}/userpic")
    public String getUserPic(@PathVariable String user_no, HttpServletResponse response, HttpServletRequest request) throws Exception{

        UserDao userDao = new UserDaoJDBCImpl();
        byte[] picData = userDao.getPicByNo(user_no);

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
