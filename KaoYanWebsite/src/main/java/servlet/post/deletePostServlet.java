package servlet.post;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import pojo.Post;
import service.post.PostService;
import service.post.PostServiceImpl;

import java.io.IOException;

@WebServlet( "/deletePost")
public class deletePostServlet extends HttpServlet {
    PostService postService=new PostServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String postIdStr=request.getParameter("postId");
        int postId=Integer.parseInt(postIdStr);
        HttpSession session= request.getSession();
        int userId= (int) session.getAttribute("user_id");
        System.out.println("postId="+postId);
        System.out.println("user_id="+userId);
        //根据帖子id返回帖子
        Post post=postService.findPostById(postId);
        int senderId=-1;
        if(post!=null){
            senderId=post.getUserId();
            System.out.println("senderid="+senderId);
        }else{
            System.out.println("没有找到该帖子");
        }
        if(userId==senderId){
            //删除帖子
            int flag=postService.deletePost(postId);
            if(flag==1){
                System.out.println("删除帖子成功");
            }
        }
    }
}