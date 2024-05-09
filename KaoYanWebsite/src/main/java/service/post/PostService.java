package service.post;

import Pojo.Post;

import java.sql.SQLException;
import java.util.ArrayList;

public interface PostService {
    //添加帖子
    public int addPost(Post post);
    public Post findPostById(int id);
    public ArrayList<Post> getPostListBySchoolId(int schoolId) throws SQLException;
}