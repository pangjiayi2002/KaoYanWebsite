package servlet.post;

import pojo.Post;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import service.post.PostService;
import service.post.PostServiceImpl;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "postHomeServlet", value = "/postHomeServlet")
public class postHomeServlet extends HttpServlet {
    PostService postService=new PostServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String schoolId="1";
        //找到这个学校的帖子
        ArrayList<Post> postList=new ArrayList<>();
        try {
            postList=postService.getPostListBySchoolId(Integer.parseInt(schoolId));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        HttpSession session= request.getSession();
        session.setAttribute("postList",postList);
        request.getRequestDispatcher("community.jsp").forward(request,response);
    }
}