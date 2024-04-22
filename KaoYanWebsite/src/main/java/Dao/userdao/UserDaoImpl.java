package Dao.userdao;

import Dao.BaseDao;
import pojo.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDaoImpl implements UserDao{
    @Override
    public User getUser(Connection connection, String username) throws Exception {
        PreparedStatement pstm = null;
        ResultSet rs = null;
        User user= null;
        try {
            if (null != connection) {
                String sql = "select * from kaoyanwebsite.user where username=?";
                Object[] params = {username};
                rs = BaseDao.execute(connection, pstm, rs, sql, params);
                if (rs.next()) {
                    user = new User();
                    user.setId(rs.getInt("id"));
                    user.setUsername(rs.getString("username"));
                    user.setPassword(rs.getString("password"));
//                    user.setAvatar(rs.getByte("avatar"));
                }
            }
            BaseDao.closeResource(null, pstm, rs);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return user;
    }

    @Override
    public int changeAvatar(Connection connection,byte[] avatar, int id) {
        int flag = 0;
        PreparedStatement pstm = null;
        if (null != connection) {
            String sql = "update kaoyanwebsite.user set avatar=? where id = ? ";
            Object[] params = {avatar,id};
            flag = BaseDao.execute(connection, pstm, sql, params);
            BaseDao.closeResource(null, pstm, null);
        }
        return flag;
    }

    @Override
    public byte[] getAvatar(Connection connection, int id) {
        PreparedStatement pstm = null;
        ResultSet rs = null;
        byte[] avatar = null; // 使用 byte[] 而不是 Byte[]，因为通常数据库中的二进制数据是以字节数组形式存储的
        if (null != connection) {
            String sql = "SELECT avatar FROM kaoyanwebsite.user WHERE id=?";
            Object[] params = {id};
            rs = BaseDao.execute(connection, pstm, rs, sql, params);
            try {
                if (rs.next()) {
                    avatar = rs.getBytes("avatar"); // 获取 avatar 字段的字节数组
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        BaseDao.closeResource(null, pstm, rs);
        return avatar;
    }

}
