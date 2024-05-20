package Dao.CommentDao;

import Dao.BaseDao;
import Dao.userdao.UserDao;
import Dao.userdao.UserDaoImpl;
import pojo.Comment;
import pojo.Comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CommentDaoImpl implements CommentDao{
    UserDao userDao=new UserDaoImpl();
    @Override
    public ArrayList<Comment> getCommentListByPostId(Connection connection, int postId) throws SQLException {
        PreparedStatement pstm=null;
        ResultSet rs=null;
        ArrayList<Comment> commentList=new ArrayList<>();
        if(null!=connection){
            String sql="select * from comment where postId=?";
            Object[] params={postId};
            rs= BaseDao.execute(connection,pstm,rs,sql,params);
            while(rs.next()){
                byte[] avatar=null;
                Comment comment=new Comment();
                comment.setCommentId(rs.getInt("commentId"));
                comment.setSender(rs.getString("sender"));
                comment.setPostId(rs.getInt("postId"));
                comment.setReceiver(rs.getString("receiver"));
                comment.setContent(rs.getString("content"));
                comment.setIsRead(rs.getInt("isRead"));
                comment.setTime(rs.getTimestamp("time"));
                comment.setSenderId(rs.getInt("senderId"));
                comment.setReceiverId(rs.getInt("receiverId"));
                //通过userId找到用户的头像
                avatar=userDao.getAvatar(connection,rs.getInt("senderId"));
                comment.setAvatar(avatar);
                //comment.setAvater(rs.getBytes("avatar"));
                commentList.add(comment);
            }
            BaseDao.closeResource(null,pstm,rs);
        }
        return commentList;
    }

    @Override
    public int addComment(Connection connection, Comment comment) {
        PreparedStatement pstm=null;
        int updateRows=0;
        if(null!=connection){
            String sql="insert into kaoyanwebsite.comment (sender,postId,receiver,content,isRead,senderId,receiverId) values(?,?,?,?,?,?,?)";
            Object[] params={comment.getSender(),comment.getPostId(),comment.getReceiver(),comment.getContent(),comment.getIsRead(),comment.getSenderId(),comment.getReceiverId()};
            updateRows=BaseDao.execute(connection,pstm,sql,params);
            BaseDao.closeResource(null,pstm,null);
        }
        return updateRows;
    }
}
