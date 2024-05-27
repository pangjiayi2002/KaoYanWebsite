package Dao.CommentDao;

import pojo.Comment;
import pojo.Comment;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public interface CommentDao {
    ArrayList<Comment> getCommentListByPostId(Connection connection, int postId) throws SQLException;
    int addComment(Connection connection,Comment comment);
    Comment getCommentByCommentId(Connection connection,int commentId) throws SQLException;
    int deleteComment(Connection connection,int commentId);
}
