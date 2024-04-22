package service.user;

import Dao.BaseDao;
import Dao.userdao.UserDao;
import Dao.userdao.UserDaoImpl;
import pojo.User;

import java.sql.Connection;

public class UserServiceImpl implements UserService{
    private UserDao userDao=new UserDaoImpl();

    @Override
    public User get(String username) {
        Connection connection = null;
        User user = null;
        try {
            connection = BaseDao.getConnection();
            //通过业务层调用对应的具体数据库操作
            user = userDao.getUser(connection,username);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            BaseDao.closeResource(connection, null, null);
        }
        return user;
    }

    //更换头像
    @Override
    public boolean change(byte[] avatar,int id) {
        Connection connection = null;
        boolean flag = false;
        try {
            connection = BaseDao.getConnection();
            if (userDao.changeAvatar(connection,avatar, id) > 0)
                flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            BaseDao.closeResource(connection, null, null);
        }
        return flag;
    }

    @Override
    public byte[] getPersonalAvatar(int id) {
        Connection connection = null;
        byte[] avatar = null;
        try {
            connection = BaseDao.getConnection();
            //通过业务层调用对应的具体数据库操作
            avatar= userDao.getAvatar(connection,id);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            BaseDao.closeResource(connection, null, null);
        }
        return avatar;
    }
}
