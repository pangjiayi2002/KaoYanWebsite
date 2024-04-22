package Dao.userdao;

import pojo.User;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public interface UserDao {
    //获取用户信息
    User getUser(Connection connection, String username)throws Exception;
    //更换图像
    int changeAvatar(Connection connection,byte[] avatar, int id);
    //得到新图像
    byte[] getAvatar(Connection connection,int id) throws SQLException;
}
