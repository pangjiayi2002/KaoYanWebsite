package service.user;

import pojo.User;

public interface UserService {
    //获取用户信息
    public User get(String username);

    //更换头像
    public boolean change(byte[] avatar,int id);
    //获取图像
    public byte[] getPersonalAvatar(int id);
}
