package Dao.PostDao;

import pojo.Post;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public interface PostDao {
    int addPost(Connection connection, Post post) throws  Exception;
    Post findPostById(Connection connection,int id) throws SQLException;
    ArrayList<Post> getPostListBySchoolId(Connection connection,int schoolId) throws SQLException;
    int getUserIdByPostId(Connection connection,int postId) throws SQLException;
}
