package Dao.SchoolDao;

import pojo.School;

import java.sql.Connection;
import java.sql.SQLException;

public interface SchoolDao {
    public School findSchoolById(Connection connection,int schoolId) throws SQLException;
}
