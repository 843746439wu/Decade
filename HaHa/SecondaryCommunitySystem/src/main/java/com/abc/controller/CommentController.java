package com.abc.controller;



import com.abc.dao.*;
import com.abc.domain.Comic;
import com.abc.domain.CommentComic;
import com.abc.domain.CommentCommodity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class CommentController {
    @GetMapping("/commentcomic")
    public String toInpt(){
        return "user/comment_comic";
    }

    @GetMapping("/commentcomic/{comic_name}")
    public String loadComic(@PathVariable String comic_name, Model model) throws Exception{

        ComicDao comicDao = new ComicDaoJDBCImpl();
        Comic comic = comicDao.getComicByName(comic_name);
        model.addAttribute("comic", comic);

        CommentComicDao commentComicDao = new CommentComicDaoJDBCImpl();
        model.addAttribute("commcomicList", commentComicDao.loadCommentComic(comic_name));

        return "user/comment_comic";
    }

    @GetMapping("/comment/comiccomment")
    public String addCommentComic(CommentComic commentcomic,Model model) throws Exception{

        CommentComicDao commentComicDao = new CommentComicDaoJDBCImpl();
        commentComicDao.addCommentComic(commentcomic);

        return "user/comment_comic";

    }

    @GetMapping("/comment")
    public String toInput() throws Exception{

        return "comment/comment_home";
    }

    @GetMapping("/comment/comic")
    public String loadComicComment(Model model) throws Exception{

        CommentComicDao commentComicDao = new CommentComicDaoJDBCImpl();
        model.addAttribute("commcomicList", commentComicDao.loadComment());

        return "comment/comic_comment";
    }

    @DeleteMapping("/comment/comic/{comment_id}")
    public String removeComic(@PathVariable String comment_id) throws Exception{

        CommentComicDao commentComicDao = new CommentComicDaoJDBCImpl();
        commentComicDao.delCommentComic(comment_id);

        return "redirect:/comment/comic";

    }

    @GetMapping("/comment/commodity")
    public String loadCommodityComment(Model model) throws Exception{

        CommentCommodityDao commentCommodityDao = new CommentCommodityDaoJDBCImpl();
        model.addAttribute("commcommodityList", commentCommodityDao.loadCommentCommdty());

        return "comment/commodity_comment";
    }

    @DeleteMapping("/comment/commodity/{comment_id}")
    public String removeCommodity(@PathVariable String comment_id) throws Exception{

        CommentCommodityDao commentCommodityDao = new CommentCommodityDaoJDBCImpl();
        commentCommodityDao.delCommentCommodity(comment_id);

        return "redirect:/comment/commodity";

    }
    @GetMapping("/comment/commoditycomment")
    public String addCommodityComment(CommentCommodity commentcommodity, Model model) throws Exception{

        CommentCommodityDao commentCommodityDao = new CommentCommodityDaoJDBCImpl();
        commentCommodityDao.addCommentCommodity(commentcommodity);

        return "user/details_user";

    }

}
