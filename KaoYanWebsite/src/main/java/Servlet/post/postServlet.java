package Servlet.post;

import Pojo.Post;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import service.post.PostService;
import service.post.PostServiceImpl;

import java.io.IOException;

@WebServlet(name = "postServlet", value = "/postServlet")
public class postServlet extends HttpServlet {
    PostService postService=new PostServiceImpl();
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
        String username="张三";
        //将user对象保存在session中

        //session.setAttribute("user",user);
        //
        String title=request.getParameter("title");
        String content=request.getParameter("content");
        //
        int schoolId=1;
        //
        Post newpost=new Post();
        newpost.setTitle(title);
        newpost.setContent(content);
        newpost.setUsername(username);
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