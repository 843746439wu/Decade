package com.abc.controller;

import com.abc.dao.ChatDao;
import com.abc.dao.ChatDaoJDBCImpl;
import com.abc.dao.ChatRoomDao;
import com.abc.dao.ChatRoomDaoJDBCImpl;
import com.abc.domain.Chat;
import com.abc.domain.ChatRoom;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.FileInputStream;
import java.io.OutputStream;

@Controller
public class ChatController {

    @GetMapping("/chat")
    public String loadChatRoom(Model model) throws Exception{

        ChatRoomDao chatRoomDao = new ChatRoomDaoJDBCImpl();
        model.addAttribute("chatroomList", chatRoomDao.loadChatRoom());

        return "chat/chatroom";
    }
    @PostMapping("/chat")
    public String createChatRoom(ChatRoom chatRoom, MultipartFile chatroompic) throws Exception{

        chatRoom.setChatroom_pic(chatroompic.getBytes());
        ChatRoomDao chatRoomDao = new ChatRoomDaoJDBCImpl();
        chatRoomDao.addChatRoom(chatRoom);

        return "redirect:/chat";
    }

    @PostMapping("/chat/{chatroom_id}")
    public String removeChatRoom(@PathVariable String chatroom_id) throws Exception{

        ChatRoomDao chatRoomDao = new ChatRoomDaoJDBCImpl();
        chatRoomDao.delChatRoom(chatroom_id);

        return "redirect:/chat";

    }
    @GetMapping("/chat/{chatroom_id}/chatroompic")
    public String getChatRoomPic(@PathVariable String chatroom_id, HttpServletResponse response, HttpServletRequest request) throws Exception{

        ChatRoomDao chatRoomDao = new ChatRoomDaoJDBCImpl();
        byte[] picData = chatRoomDao.getPicByNo(chatroom_id);

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
    @GetMapping("/chatroom")
    public String toInput(HttpSession session) throws Exception{

        return "chat/chat_admin";
    }

    @GetMapping("/user_chat")
    public String toInput1(Model model,HttpSession session) throws Exception{

        ChatRoomDao chatRoomDao = new ChatRoomDaoJDBCImpl();
        model.addAttribute("chatroomList", chatRoomDao.loadChatRoom());

        return "user/user_chat";
    }


    @PostMapping ("/chatroom/{chatroom_id}")
    public String addChat(Chat chat,Model model,String chatroom_id) throws Exception{

        ChatRoomDao chatRoomDao = new ChatRoomDaoJDBCImpl();
        model.addAttribute("chatroomList", chatRoomDao.loadChatRoom());

        ChatDao chatDao1 = new ChatDaoJDBCImpl();
        model.addAttribute("chatList", chatDao1.loadChat(chatroom_id));

        ChatDao chatDao = new ChatDaoJDBCImpl();
        chatDao.addChat(chat);

        return "redirect:/chatroom/{chatroom_id}";
    }
    @GetMapping("/chatroom/{chatroom_id}")
    public String loadChat(ChatRoom chatRoom,@PathVariable String chatroom_id, Model model, HttpSession session) throws Exception{

        ChatRoomDao chatRoomDao = new ChatRoomDaoJDBCImpl();
        chatRoom = chatRoomDao.getChatRoomByNo(chatroom_id);
        session.setAttribute("ChatRoom", chatRoom);

        ChatDao chatDao = new ChatDaoJDBCImpl();
        model.addAttribute("chatList", chatDao.loadChat(chatroom_id));

        return "chat/chat_admin";
    }
    @PostMapping("/chatroom/{chatroom_id}/{chat_id}")
    public String removeChat(@PathVariable String chat_id,@PathVariable String chatroom_id, Model model) throws Exception{

        ChatDao chatDao = new ChatDaoJDBCImpl();
        chatDao.delChat(chat_id);
        model.addAttribute("chatList", chatDao.loadChat(chatroom_id));

        return "redirect:/chatroom/{chatroom_id}";

    }

    @GetMapping("/user_chat/{chatroom_id}")
    public String loadchat(ChatRoom chatRoom,@PathVariable String chatroom_id, Model model, HttpSession session) throws Exception{

        ChatRoomDao chatRoomDao = new ChatRoomDaoJDBCImpl();
        chatRoom = chatRoomDao.getChatRoomByNo(chatroom_id);
        session.setAttribute("ChatRoom", chatRoom);

        ChatDao chatDao = new ChatDaoJDBCImpl();
        model.addAttribute("chatList", chatDao.loadChat(chatroom_id));

        return "user/user_chatroom";
    }

    @PostMapping ("/user_chat/{chatroom_id}")
    public String createChat(Chat chat,Model model,String chatroom_id) throws Exception{

        ChatRoomDao chatRoomDao = new ChatRoomDaoJDBCImpl();
        model.addAttribute("chatroomList", chatRoomDao.loadChatRoom());

        ChatDao chatDao1 = new ChatDaoJDBCImpl();
        model.addAttribute("chatList", chatDao1.loadChat(chatroom_id));

        ChatDao chatDao = new ChatDaoJDBCImpl();
        chatDao.addChat(chat);

        return "redirect:/user_chat/{chatroom_id}";
    }


}
