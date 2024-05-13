package service.comment;

import pojo.Comment;

import java.sql.SQLException;
import java.util.ArrayList;

public interface CommentService {
    public ArrayList<Comment> getCommentListByPostId(int postId) throws SQLException;
    public int addComment(Comment comment);
}
