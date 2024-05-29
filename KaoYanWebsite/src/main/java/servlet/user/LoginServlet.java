package servlet.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import pojo.User;
import service.user.UserService;
import service.user.UserServiceImpl;
import util.Constants;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

@MultipartConfig
@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    UserService userService=new UserServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userCode = request.getParameter("username");
        String userPassword = request.getParameter("userPassword");
        UserServiceImpl userService = new UserServiceImpl();
        User user = userService.login(userCode, userPassword);
        if (user!=null){
            request.getSession().setAttribute(Constants.USER_SESSION,user);
            Object o = request.getSession().getAttribute(Constants.USER_SESSION);
            if(userService.getPersonalAvatar(((User)o).getId())==null) {
                //这里路径写死了
                String filePath = "D:\\git\\KaoYanWebsite\\KaoYanWebsite\\src\\main\\webapp\\pic\\OIP.jpg";
                File file = new File(filePath);
                if (file.exists()) {
                    try (InputStream inputStream = new FileInputStream(file)) {
                        byte[] avatar = inputStream.readAllBytes();
                        userService.change(avatar, ((User) o).getId());
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                } else {
                    System.out.println("文件不存在");
                }
            }
            response.sendRedirect("index.jsp");
        }else {
            request.setAttribute("error","用户名或者密码不正确");
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }
    }
}
