package service.school;

import Dao.BaseDao;
import Dao.SchoolDao.SchoolDao;
import Dao.SchoolDao.SchoolDaoImpl;
import pojo.School;

import java.sql.Connection;

public class SchoolServiceImpl implements SchoolService{
    SchoolDao schoolDao=new SchoolDaoImpl();
    @Override
    public School findSchoolById(int schoolId) {
        Connection connection=null;
        School school=null;
        try{
            connection= BaseDao.getConnection();
            school=schoolDao.findSchoolById(connection,schoolId);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            BaseDao.closeResource(connection,null,null);
        }
        return school;
    }
}
