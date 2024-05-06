package servlet.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pojo.User;
import service.user.UserService;
import service.user.UserServiceImpl;
import util.Constants;

import java.io.IOException;

@MultipartConfig
@WebServlet(name = "NameChangeServlet", value = "/NameChangeServlet")
public class NameChangeServlet extends HttpServlet {
    private UserService userService=new UserServiceImpl();;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username=request.getParameter("newname");
        Object o = request.getSession().getAttribute(Constants.USER_SESSION);
        boolean flag=false;
        if (o!=null && username!=null){
            flag = userService.updateUsername(((User) o).getId(), username);
            if (flag){
                request.setAttribute("message","昵称修改成功");
                request.getSession().removeAttribute(Constants.USER_SESSION);
            }else {
                request.setAttribute("message","昵称修改失败");
            }
        }
        request.getRequestDispatcher("/namemodify.jsp").forward(request,response);
    }
}
