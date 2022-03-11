package com.abc.dao;

import com.abc.domain.CommentComic;

import java.util.List;

public interface CommentComicDao {

    List<CommentComic> loadCommentComic(String comic_name);
    void addCommentComic(CommentComic commentcomic);
    List<CommentComic> loadComment();
    void delCommentComic(String comment_id);

}
