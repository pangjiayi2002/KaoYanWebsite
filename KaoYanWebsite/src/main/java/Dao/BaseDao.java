package Dao;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.Properties;

//操作数据库的公共类
public class BaseDao {
    private static String driver;
    private static String url;
    private static String username;
    private static String password;


    //静态代码块,在类加载的时候执行
    static {
        Properties params = new Properties();
        String configFile = "db.properties";
        InputStream is = BaseDao.class.getClassLoader().getResourceAsStream(configFile);
        try {
            params.load(is);
        } catch (IOException e) {
            e.printStackTrace();
        }
        driver = params.getProperty("driver");
        url = params.getProperty("url");
        username = params.getProperty("username");
        password = params.getProperty("password");
    }
    /**
     * 获取数据库连接
     *
     * @return
     */
    public static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }

    /**
     * 查询数据库的公共操作
     *
     * @param connection
     * @param pstm
     * @param rs
     * @param sql
     * @param params
     * @return
     */
    public static ResultSet execute(Connection connection, PreparedStatement pstm, ResultSet rs, String sql, Object[] params) {
        try {
            pstm = connection.prepareStatement(sql);
            for (int i = 0; i < params.length; i++) {
                pstm.setObject(i + 1, params[i]);
            }
            rs = pstm.executeQuery();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rs;
    }
    /**
     * 更新数据库的公共操作
     *
     * @param connection
     * @param pstm
     * @param sql
     * @param params
     * @return
     * @throws Exception
     */
    public static int execute(Connection connection, PreparedStatement pstm, String sql, Object[] params) {
        int updateRows = 0;
        try {
            pstm = connection.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
            for (int i = 0; i < params.length; i++) {
                pstm.setObject(i + 1, params[i]);
            }
            updateRows = pstm.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return updateRows;
    }
    public static ResultSet add(Connection connection,PreparedStatement pstm,String sql,Object[] params){
        int updateRows=0;
        ResultSet generateKeys=null;
        try{
            pstm=connection.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
            for(int i=0;i< params.length;i++){
                pstm.setObject(i+1,params[i]);
            }
            updateRows=pstm.executeUpdate();
            if(updateRows>0){
                generateKeys= pstm.getGeneratedKeys();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return generateKeys;
    }


    /**
     * 释放资源
     *
     * @param connection
     * @param pstm
     * @param rs
     * @return
     */
    public static boolean closeResource(Connection connection, PreparedStatement pstm, ResultSet rs) {
        boolean flag = true;
        if (rs != null) {
            try {
                rs.close();
                rs = null;//GC回收
            } catch (SQLException e) {
                e.printStackTrace();
                flag = false;
            }
        }
        if (pstm != null) {
            try {
                pstm.close();
                pstm = null;//GC回收
            } catch (SQLException e) {
                e.printStackTrace();
                flag = false;
            }
        }
        if (connection != null) {
            try {
                connection.close();
                connection = null;//GC回收
            } catch (SQLException e) {
                e.printStackTrace();
                flag = false;
            }
        }
        return flag;
    }

}