package service.user;

import Dao.BaseDao;
import Dao.userdao.UserDao;
import Dao.userdao.UserDaoImpl;
import pojo.School;
import pojo.Score;
import pojo.User;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class UserServiceImpl implements UserService{
    private UserDao userDao=new UserDaoImpl();

    @Override
    public User login(String userCode, String password) {
        Connection connection = null;
        User user = null;
        try {
            connection = BaseDao.getConnection();
            //通过业务层调取对应的具体的数据库的数据
            user = userDao.getLoginUser(connection,userCode,password);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            BaseDao.closeResource(connection,null,null);
        }
        return user;
    }

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

    @Override
    public boolean updatePwd(int id, String pwd) {
        Connection connection=null;
        boolean flag=false;
        connection=BaseDao.getConnection();
        //修改密码
        try {
            if (userDao.updatePwd(connection,id,pwd)>0){
                flag=true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            BaseDao.closeResource(connection,null,null);
        }
        return flag;
    }

    @Override
    public boolean updateUsername(int id, String username) {
        Connection connection=null;
        boolean flag=false;
        connection=BaseDao.getConnection();
        //修改密码
        try {
            if (userDao.updateUsername(connection,id,username)>0){
                flag=true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            BaseDao.closeResource(connection,null,null);
        }
        return flag;
    }

    @Override
    public List<School> getSchool() throws Exception {
        Connection connection = null;
        List<School> schoolList = null;
        try {
            connection = BaseDao.getConnection();
            schoolList = userDao.getSchool(connection);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            BaseDao.closeResource(connection, null, null);
        }
        System.out.println(schoolList.toArray());
        return schoolList;
    }

    @Override
    public List<Score> getScoreList(String schoolName, int year) {
        Connection connection=null;
        List<Score> scoreList=null;
//        System.out.println("schoolName-->"+schoolName);
//        System.out.println("year-->"+year);
        try {
            connection=BaseDao.getConnection();
            scoreList=userDao.getScoreList(connection,schoolName,year);
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            BaseDao.closeResource(connection,null,null);
        }
        return scoreList;
    }
}
