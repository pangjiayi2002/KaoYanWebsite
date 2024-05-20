package service.post;

import pojo.Post;

import java.sql.SQLException;
import java.util.ArrayList;

public interface PostService {
    //添加帖子
    public int addPost(Post post);
    public Post findPostById(int id);
    public ArrayList<Post> getPostListBySchoolId(int schoolId) throws SQLException;
    public int getUserIdByPostId(int postId) throws SQLException;
}
