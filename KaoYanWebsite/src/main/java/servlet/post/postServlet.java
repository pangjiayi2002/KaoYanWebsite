package servlet.post;

import pojo.Post;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import pojo.User;
import service.post.PostService;
import service.post.PostServiceImpl;
import service.user.UserService;
import service.user.UserServiceImpl;

import java.io.IOException;

@WebServlet(name = "postServlet", value = "/postServlet")
public class postServlet extends HttpServlet {
    PostService postService=new PostServiceImpl();
    UserService userService=new UserServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //添加帖子
        int flag;
        HttpSession session=request.getSession();
        //用户登录后，数据库返回一个User，保存在session中，通过getAttribute获取
        //再获取user的id!
        //
        int userId= (int) session.getAttribute("user_id");
        System.out.println("userId="+userId);
        User user=userService.getUserById(userId);
        String username=user.getUsername();
        //String username="张三";
        //将user对象保存在session中

        session.setAttribute("user",user);
        //
        String title=request.getParameter("title");
        String content=request.getParameter("content");
        //
        //int schoolId=1;
        int schoolId=(int)session.getAttribute("school_id");
        //
        Post newpost=new Post();
        newpost.setTitle(title);
        newpost.setContent(content);
        newpost.setUsername(username);
        newpost.setUserId(userId);
        newpost.setSchoolId(schoolId);
        flag=postService.addPost(newpost);
        int postId=flag;
        if(flag!=-1){
            //跳转到AddPostSuccess.jsp页面
            //将帖子保存在session中
            newpost.setId(postId);
            session.setAttribute("newpost",newpost);
            request.getRequestDispatcher("AddPostSuccess.jsp").forward(request,response);
        }
        else{
            request.getRequestDispatcher("community.jsp");
        }
    }
}