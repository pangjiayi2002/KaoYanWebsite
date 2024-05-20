package Dao.SchoolDao;

import Dao.BaseDao;
import pojo.School;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SchoolDaoImpl implements SchoolDao{
    @Override
    public School findSchoolById(Connection connection,int schoolId) throws SQLException {
        PreparedStatement pstm=null;
        ResultSet rs=null;
        School school=new School();
        if(null!=connection){
            String sql="select * from school where school_id=?";
            Object[] params={schoolId};
            rs= BaseDao.execute(connection,pstm,rs,sql,params);
            if(rs.next()){
                school.setSchool_id(rs.getInt("school_id"));
                school.setSchool_name(rs.getString("school_name"));
            }
            BaseDao.closeResource(null,pstm,rs);
        }
        return school;
    }
}
