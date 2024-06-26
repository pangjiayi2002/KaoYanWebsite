package Dao.userdao;

import pojo.Comment;
import pojo.School;
import pojo.Score;
import pojo.User;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public interface UserDao {
    //得到要登录的用户
    public User getLoginUser(Connection connection, String userCode, String password) throws SQLException;
    //获取用户信息
    User getUser(Connection connection, String username)throws Exception;
    //更换图像
    int changeAvatar(Connection connection,byte[] avatar, int id);
    //得到新图像
    byte[] getAvatar(Connection connection,int id) throws SQLException;
    //修改当前用户密码
    public int updatePwd(Connection connection,int id,String password) throws SQLException;
    //修改当前用户的昵称
    public int updateUsername(Connection connection,int id,String username) throws SQLException;
    //获取学校信息
    List<School> getSchool(Connection connection)throws Exception;
    //得到学校分数
    List<Score> getScoreList(Connection connection, String schoolName, int year) throws SQLException;

//    //获取评论信息
//    Evaluate getEvaluateById(Connection connection, String id) throws Exception;
//    //获取该用户收到的所有评论
//    List<Evaluate> getAllEvaluate(Connection connection,String username)throws Exception;
//    //获取未读评论
//    int notRead(Connection connection,String username)throws Exception;
    User getUserById(Connection connection,int userId);
    //获取该用户收到的未读评论
    List<Comment> getNotReadComment(Connection connection, String receiver)throws Exception;
    //获取未读评论
    int notRead(Connection connection,String receiver)throws Exception;
    //已读评论将isread从1修改为0
    int modifyIsRead(Connection connection, int commentId) throws Exception;

    List<User> list(Connection connection,int page, int pageSize, String name) throws SQLException;

    int deleteById(Connection connection, String id);

    int count(Connection connection,String name) throws SQLException;
}
