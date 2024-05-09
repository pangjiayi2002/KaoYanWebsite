package Dao.CommentDao;

import Pojo.Comment;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public interface CommentDao {
    ArrayList<Comment> getCommentListByPostId(Connection connection,int postId) throws SQLException;
    int addComment(Connection connection,Comment comment);
}
