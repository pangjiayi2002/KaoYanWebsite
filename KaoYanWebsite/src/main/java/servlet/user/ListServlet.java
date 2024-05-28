package servlet.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pojo.User;
import service.user.UserService;
import service.user.UserServiceImpl;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ListServlet", value = "/ListServlet")
public class ListServlet extends HttpServlet {

    private UserService userService =
            new UserServiceImpl();
    int pageSize = 10;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String name = req.getParameter("name");

        if (name==null){
            name = "";
        }
        int count = userService.count(name);

        int pages = count % pageSize == 0 ? count / pageSize :
                count / pageSize + 1;

        int page = req.getParameter("page") == null ? 1 :
                Integer.parseInt(req.getParameter("page"));

        List<User> users =
                userService.list(page,pageSize,name);
        req.setAttribute("users",users);
        req.setAttribute("pages",pages);
        req.setAttribute("pageNow",page);
        req.setAttribute("name",name);
        req.getRequestDispatcher("/userList.jsp")
                .forward(req,resp);

    }
}
