package Dao.CommentDao;

import Dao.BaseDao;
import pojo.Comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CommentDaoImpl implements CommentDao{
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
                Comment comment=new Comment();
                comment.setCommentId(rs.getInt("commentId"));
                comment.setSender(rs.getString("sender"));
                comment.setPostId(rs.getInt("postId"));
                comment.setReceiver(rs.getString("receiver"));
                comment.setContent(rs.getString("content"));
                comment.setIsRead(rs.getInt("isRead"));
                comment.setTime(rs.getTimestamp("time"));
                comment.setAvater(rs.getBlob("avatar"));
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
            String sql="insert into kaoyanwebsite.comment (sender,postId,receiver,content,avatar) values(?,?,?,?,?)";
            Object[] params={comment.getSender(),comment.getPostId(),comment.getReceiver(),comment.getContent(),comment.getAvater()};
            updateRows=BaseDao.execute(connection,pstm,sql,params);
            BaseDao.closeResource(null,pstm,null);
        }
        return updateRows;
    }
}
