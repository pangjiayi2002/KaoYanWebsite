package servlet.post;

import pojo.Post;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import pojo.School;
import pojo.User;
import service.post.PostService;
import service.post.PostServiceImpl;
import service.school.SchoolService;
import service.school.SchoolServiceImpl;
import service.user.UserService;
import service.user.UserServiceImpl;
import util.Constants;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "postHomeServlet", value = "/postHomeServlet")
public class postHomeServlet extends HttpServlet {
    PostService postService=new PostServiceImpl();
    UserService userService=new UserServiceImpl();
    SchoolService schoolService=new SchoolServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //int schoolId=1;
        //获取学校id和用户id
        int schoolId= Integer.parseInt(request.getParameter("school_id"));
        int userId= Integer.parseInt(request.getParameter("user_id"));
        User user=userService.getUserById(userId);
        //返回学校名
        School school =schoolService.findSchoolById(schoolId);
        String schoolName=school.getSchool_name();
        //找到这个学校的帖子
        ArrayList<Post> postList=new ArrayList<>();
        try {
            postList=postService.getPostListBySchoolId(schoolId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        HttpSession session= request.getSession();
        session.setAttribute("postList",postList);
        session.setAttribute("schoolName",schoolName);
        session.setAttribute("user_id",userId);
        session.setAttribute("user",user);
        session.setAttribute(Constants.USER_SESSION,user);
        session.setAttribute("school_id",schoolId);
        request.getRequestDispatcher("community.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}