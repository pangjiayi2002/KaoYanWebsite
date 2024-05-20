package service.user;

import pojo.School;
import pojo.Score;
import pojo.User;

import java.util.List;

public interface UserService {
    //用户登录
    public User login(String userCode,String password);
    //获取用户信息
    public User get(String username);

    //更换头像
    public boolean change(byte[] avatar,int id);
    //获取图像
    public byte[] getPersonalAvatar(int id);
    //根据用户id修改密码
    public boolean updatePwd(int id, String pwd);
    //根据用户id修改昵称
    public boolean updateUsername(int id,String username);
    //得到学校信息
    List<School> getSchool()throws Exception;
    //根据条件查询院校分数线
    public List<Score> getScoreList(String schoolName, int year);
    //根据用户id得到用户信息
    public User getUserById(int userId);
}
