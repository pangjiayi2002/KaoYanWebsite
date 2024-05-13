package servlet.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pojo.User;
import service.user.UserServiceImpl;
import util.Constants;

import java.io.IOException;

@MultipartConfig
@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("LoginServlet--start....");
        String userCode = request.getParameter("username");
        String userPassword = request.getParameter("userPassword");
        UserServiceImpl userService = new UserServiceImpl();
        User user = userService.login(userCode, userPassword);
        if (user!=null){
            request.getSession().setAttribute(Constants.USER_SESSION,user);
//            response.sendRedirect("jsp/frame.jsp");
        }else {
            request.setAttribute("error","用户名或者密码不正确");
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }
    }
}
