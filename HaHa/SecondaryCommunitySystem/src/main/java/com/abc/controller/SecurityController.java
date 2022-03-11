package com.abc.controller;

import com.abc.domain.Admin;
import com.abc.domain.User;
import com.abc.service.AdminService;
import com.abc.service.AdminServiceImpl;
import com.abc.service.UserService;
import com.abc.service.UserServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;

@Controller
public class SecurityController{

    @GetMapping("/adminLogin")
    public String toLogin1() throws Exception{
        return "login/admin_login";
    }

    @PostMapping("/login_admin")
    public String login1(Admin admin, Model model, HttpSession session,String adminNo,String adminPwd) throws Exception{

        AdminService adminService = new AdminServiceImpl();

        try{
            admin = adminService.checkAdmin(adminNo,adminPwd);
            session.setAttribute("LoginedAdmin",admin);
        }catch (Exception e){
            model.addAttribute("errMsg",e.getMessage());
            return "login/admin_login";
        }

        return "redirect:/main_admin";
    }

    @GetMapping("/main_admin")
    public String gotoMain1() throws Exception{
        return "home/admin_home";
    }


    @GetMapping("/logout_admin")
    public String logout1(HttpSession session) throws Exception{
        session.removeAttribute("LoginedAdmin");
        session.invalidate();
        return "redirect:/adminLogin";
    }

//------------------------------------------------------------------------------------------------

    @GetMapping("/userLogin")
    public String toLogin2() throws Exception{
        return "login/user_login";
    }

    @GetMapping("/userRegister")
    public String toRegister() throws Exception{

        return "login/user_register";
    }

    @PostMapping("/login_user")
    public String login2(User user, Model model, HttpSession session, String userNo, String userPwd) throws Exception{

        UserService userService = new UserServiceImpl();

        try{
            user = userService.checkUser(userNo,userPwd);
            session.setAttribute("LoginedUser",user);
        }catch (Exception e){
            model.addAttribute("errMsg",e.getMessage());
            return "login/user_login";
        }

        return "redirect:/main_user";
    }

    @GetMapping("/main_user")
    public String gotoMain2() throws Exception{
        return "home/user_home";
    }


    @GetMapping("/logout_user")
    public String logout2(HttpSession session) throws Exception{
        session.removeAttribute("LoginedUser");
        session.invalidate();
        return "redirect:/userLogin";
    }

}
