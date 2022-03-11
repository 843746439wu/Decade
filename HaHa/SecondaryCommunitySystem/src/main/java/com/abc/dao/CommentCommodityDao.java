package com.abc.dao;

import com.abc.domain.CommentCommodity;

import java.util.List;

public interface CommentCommodityDao {

    List<CommentCommodity> loadCommentCommdty(String commodity_id);
    void addCommentCommodity(CommentCommodity commentcommdity);
    void delCommentCommodity(String comment_id);
    List<CommentCommodity> loadCommentCommdty();

}
