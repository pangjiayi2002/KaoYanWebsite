package service.post;

import Dao.BaseDao;
import Dao.PostDao.PostDao;
import Dao.PostDao.PostDaoImpl;
import pojo.Post;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public class PostServiceImpl implements PostService{
    //业务层调用Dao层
    private PostDao postDao=new PostDaoImpl();
    @Override
    public int addPost(Post post) {
        boolean flag = false;
        Connection connection = null;
        int postId=-1;
        try {
            connection = BaseDao.getConnection();
            connection.setAutoCommit(false);//开启JDBC事务管理
            postId = postDao.addPost(connection, post);
            connection.commit();
            if (postId!=-1) {
                flag = true;
                System.out.println("添加帖子成功!");
            } else {
                System.out.println("添加帖子失败!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            try {
                System.out.println("rollback==================");
                connection.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        } finally {
            //在service层进行connection连接的关闭
            BaseDao.closeResource(connection, null, null);
        }
        return postId;
    }

    @Override
    public Post findPostById(int id) {
        Connection connection=null;
        Post post=null;
        try{
            connection=BaseDao.getConnection();
            post=postDao.findPostById(connection,id);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            BaseDao.closeResource(connection,null,null);
        }
        return post;
    }

    @Override
    public ArrayList<Post> getPostListBySchoolId(int schoolId){
        Connection connection=null;
        ArrayList<Post> postList=new ArrayList<>();
        try{
            connection=BaseDao.getConnection();
            postList=postDao.getPostListBySchoolId(connection, schoolId);
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return postList;
    }

    @Override
    public int getUserIdByPostId(int postId) throws SQLException {
        Connection connection=null;
        int userId=-1;
        try {
            connection = BaseDao.getConnection();
            userId = postDao.getUserIdByPostId(connection, postId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            BaseDao.closeResource(connection,null,null);
        }
        return userId;
    }

    @Override
    public int deletePost(int postId) {
        Connection connection=null;
        int flag=0;
        try{
            connection=BaseDao.getConnection();
            if(postDao.deletePost(connection,postId)>0){
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
