package Dao.PostDao;

import Dao.BaseDao;
import Pojo.Post;
import jakarta.servlet.RequestDispatcher;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PostDaoImpl implements PostDao{
    @Override
    public int addPost(Connection connection, Post post) throws Exception {
        PreparedStatement pstm=null;
        int postId=-1;
        ResultSet generateKeys=null;
        if(null!=connection){
            String sql="insert into kaoyanwebsite.post (title,content,username,schoolId) values(?,?,?,?)";
            Object[] params={post.getTitle(),post.getContent(),post.getUsername(),post.getSchoolId()};
            ResultSet rs= BaseDao.add(connection,pstm,sql,params);
            generateKeys=rs;
            if(generateKeys.next()){
                postId=generateKeys.getInt(1);
            }
            BaseDao.closeResource(null,pstm,rs);
        }
        return postId;
    }

    @Override
    public Post findPostById(Connection connection, int id) throws SQLException {
        PreparedStatement pstm=null;
        ResultSet rs=null;
        Post post=new Post();
        if(null!=connection){
            String sql="select * from post where id=?";
            Object[] params={id};
            rs=BaseDao.execute(connection,pstm,rs,sql,params);
            if(rs.next()){
                post.setId(rs.getInt("id"));
                post.setTitle(rs.getString("title"));
                post.setContent(rs.getString("content"));
                post.setUsername(rs.getString("username"));
                post.setSchoolId(rs.getInt("schoolId"));
            }
            BaseDao.closeResource(null,pstm,rs);
        }
        return post;
    }

    @Override
    public ArrayList<Post> getPostListBySchoolId(Connection connection,int schoolId) throws SQLException {
        PreparedStatement pstm=null;
        ResultSet rs=null;
        ArrayList<Post> postList=new ArrayList<>();
        int commentAmount=0;
        if(null!=connection){
            List<Object> list=new ArrayList<>();
            String sql="select * from post where schoolId=?";
            Object[] params= {schoolId};
            rs=BaseDao.execute(connection,pstm,rs,sql,params);
            while(rs.next()){
                Post post=new Post();
                post.setId(rs.getInt("id"));
                commentAmount=getPostCommentAmount(connection,pstm,rs.getInt("id"));
                post.setCommentAmount(commentAmount);
                post.setTitle(rs.getString("title"));
                post.setContent(rs.getString("content"));
                post.setUsername(rs.getString("username"));
                post.setSchoolId(rs.getInt("schoolId"));
                postList.add(post);
            }
            BaseDao.closeResource(null,pstm,rs);
        }
        return postList;
    }
    public int getPostCommentAmount(Connection connection,PreparedStatement pstm,int postId) throws SQLException {
        int commentAmount=0;
        ResultSet rs=null;
        if(connection!=null){
            String sql="select * from comment where postId=?";
            Object[] params={postId};
            rs=BaseDao.execute(connection,pstm,rs,sql,params);
            while(rs.next()){
                commentAmount+=1;
            }
            BaseDao.closeResource(null,pstm,rs);
        }
        return commentAmount;
    }
}
