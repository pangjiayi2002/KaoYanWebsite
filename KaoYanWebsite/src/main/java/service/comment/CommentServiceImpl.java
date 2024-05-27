package service.comment;

import Dao.BaseDao;
import Dao.CommentDao.CommentDao;
import Dao.CommentDao.CommentDaoImpl;
import pojo.Comment;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public class CommentServiceImpl implements CommentService{
    private CommentDao commentDao=new CommentDaoImpl();
    @Override
    public ArrayList<Comment> getCommentListByPostId(int postId){
        Connection connection=null;
        ArrayList<Comment> commentList=new ArrayList<>();
        try{
            connection= BaseDao.getConnection();
            commentList=commentDao.getCommentListByPostId(connection,postId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return commentList;
    }

    @Override
    public int addComment(Comment comment) {
        Connection connection=null;
        int updateRows=0;
        try{
            connection=BaseDao.getConnection();
            updateRows=commentDao.addComment(connection,comment);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return updateRows;
    }

    @Override
    public Comment getCommentByCommentId(int commentId) {
        Connection connection=null;
        Comment comment=null;
        try{
            connection= BaseDao.getConnection();
            comment=commentDao.getCommentByCommentId(connection,commentId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return comment;
    }

    @Override
    public int deleteComment(int commentId) {
        Connection connection=null;
        int flag=0;
        try{
            connection=BaseDao.getConnection();
            if(commentDao.deleteComment(connection,commentId)>0){
                flag=1;
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }finally {
            BaseDao.closeResource(connection,null,null);
        }
        return flag;
    }

}
