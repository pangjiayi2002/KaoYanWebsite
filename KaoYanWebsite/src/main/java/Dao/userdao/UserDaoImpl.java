package Dao.userdao;

import Dao.BaseDao;
import pojo.Comment;
import pojo.School;
import pojo.Score;
import pojo.User;
import util.Constants;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class UserDaoImpl implements UserDao{
    @Override
    public User getLoginUser(Connection connection, String username, String password) throws SQLException {
        PreparedStatement pstm = null;
        ResultSet rs = null;
        User user = null;
        if (connection!=null){
            String sql = "select * from kaoyanwebsite.user where username = ? and password = ?";
            Object[] params = {username,password};
            rs = BaseDao.execute(connection, pstm, rs, sql, params);
            if (rs.next()){
                user=new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setAvatar(rs.getBytes("avatar"));
            }
            BaseDao.closeResource(null,pstm,rs);
        }
        return user;
    }

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

    @Override
    public int updatePwd(Connection connection, int id, String password) throws SQLException {
        PreparedStatement pstm=null;
        int execute=0;
        if (connection!=null){
            String sql="update kaoyanwebsite.user set password=? where id=?";
            Object params[]={password,id};
            execute = BaseDao.execute(connection,pstm, sql, params);
            BaseDao.closeResource(null,pstm,null);
        }
        return execute;
    }

    @Override
    public int updateUsername(Connection connection, int id, String username) throws SQLException {
        PreparedStatement pstm=null;
        int execute=0;
        if (connection!=null){
            String sql="update kaoyanwebsite.user set username=? where id=?";
            Object params[]={username,id};
            execute = BaseDao.execute(connection,pstm, sql, params);
            BaseDao.closeResource(null,pstm,null);
        }
        return execute;
    }

    @Override
    public List<School> getSchool(Connection connection) throws Exception {
        PreparedStatement pstm=null;
        ResultSet rs=null;
        ArrayList<School> List=new ArrayList<>();
        if(null!=connection){
            String sql="select * from kaoyanwebsite.school";
            Object[] params = {};
            rs = BaseDao.execute(connection, pstm, rs, sql, params);
            while(rs.next()){
                int school_id=rs.getInt("school_id");
                String school_name=rs.getString("school_name");
                String school_img=rs.getString("school_img");
                String school_title=rs.getString("school_title");
                String school_pro=rs.getString("school_pro");
                School Info=new School(school_id,school_name,school_img,school_title,school_pro);
                List.add(Info);
            }
            BaseDao.closeResource(null,pstm,rs);
        }
        return List;
    }

    @Override
    public List<Score> getScoreList(Connection connection, String schoolName, int year) throws SQLException {
        PreparedStatement pstm = null;
        ResultSet rs = null;
        List<Score> scoreList = new ArrayList<>();
        if (connection != null) {
            StringBuffer sql = new StringBuffer();
            sql.append("SELECT f.* FROM school s,score f WHERE s.school_id = f.school_id");
            ArrayList<Object> list = new ArrayList<>();
            if (schoolName != null) {
                sql.append(" and s.school_name = ?");
                list.add(schoolName);
            }
            if (year > 0) {
                sql.append(" and f.score_year= ?");
                list.add(year);
            }
            Object[] params = list.toArray();
            System.out.println("sql-->" + sql.toString());
            pstm = connection.prepareStatement(sql.toString());
            for (int i = 0; i < params.length; i++) {
                pstm.setObject(i + 1, params[i]);
            }
            rs = pstm.executeQuery();
            while (rs.next()) {
                Score score=new Score();
                score.setSchool_id(rs.getInt("school_id"));
                score.setScore_year(rs.getInt("score_year"));
                score.setMaster_Type(rs.getString("Master_Type"));
                score.setMajor_Code(rs.getString("Major_Code"));
                score.setMajor_Name(rs.getString("Major_Name"));
                score.setTotal_Score(rs.getInt("Total_Score"));
                score.setPolitics(rs.getString("Politics"));
                score.setEnglish(rs.getString("English"));
                score.setMajor_Course_One(rs.getString("Major_Course_One"));
                score.setMajor_Course_Two(rs.getString("Major_Course_Two"));
                scoreList.add(score);
            }
        }
        BaseDao.closeResource(null, pstm, rs);
        return scoreList;
    }

    @Override
    public List<Comment> getNotReadComment(Connection connection, String receiver) throws Exception {
        PreparedStatement pstm=null;
        ResultSet rs=null;
        ArrayList<Comment> List=new ArrayList<>();
        if(null!=connection){
            String sql="select * from comment where receiver=? and isRead=0";
            Object[] params = {receiver};
            rs= BaseDao.execute(connection,pstm,rs,sql,params);
            while(rs.next()){
                int commentId=rs.getInt("commentId");
                String sender=rs.getString("sender");
                int postId=rs.getInt("postId");
                String realReceiver=rs.getString("receiver");
                String content=rs.getString("content");
                int isRead=rs.getInt("isRead");
                Date time=rs.getTime("time");
                Blob avatar= rs.getBlob("avatar");
                Comment comment=new Comment(commentId,sender,postId,realReceiver,content,isRead,time,avatar);
                List.add(comment);
            }
            BaseDao.closeResource(null,pstm,rs);
        }
        return List;
    }

    @Override
    public int notRead(Connection connection, String receiver) throws Exception {
        PreparedStatement pstm=null;
        ResultSet rs=null;
        int count=0;
        if(null!=connection){
//            String sql="select isread from comment where id=? and sendertype='user'";
            String sql="select isRead from comment where receiver=? and isRead=0";
            Object[] params={receiver};
            rs= BaseDao.execute(connection, pstm, rs, sql, params);
            while(rs.next()){
                count++;
//                int isRead=rs.getInt("isRead");
//                if (isRead==0){
//                    count++;
//                }
            }
            BaseDao.closeResource(null,pstm,rs);
        }
        return count;
    }

}


