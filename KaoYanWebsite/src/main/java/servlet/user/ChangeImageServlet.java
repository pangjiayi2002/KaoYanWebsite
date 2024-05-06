package servlet.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import service.user.UserService;
import service.user.UserServiceImpl;
import util.ImageUtil;

import java.io.*;
@MultipartConfig
@WebServlet(name = "ChangeImageServlet", value = "/ChangeImageServlet")
public class ChangeImageServlet extends HttpServlet {
    private UserService userService=new UserServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int id= Integer.parseInt(request.getParameter("id"));
        int id=1;
        // 获取上传的文件
        Part filePart = request.getPart("imageFile");
        InputStream inputStream = filePart.getInputStream();
        // 将图像内容转换为字节数组
        byte[] avatar = inputStream.readAllBytes();
        System.out.println("avatar="+avatar);;
        try {
            userService.change(avatar,id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
//        //获取更新后的图像
//        byte[] newAvatar = userService.getPersonalAvatar(1);
//        String base64Image = ImageUtil.byteToBase64(newAvatar);
//        request.setAttribute("base64Image", base64Image);
        request.getRequestDispatcher("PersonalCenter.jsp").forward(request,response);
    }
}
