package servlet.post;

import pojo.Comment;
import pojo.Post;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import pojo.User;
import service.comment.CommentService;
import service.comment.CommentServiceImpl;
import service.post.PostService;
import service.post.PostServiceImpl;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "addCommentServlet", value = "/addCommentServlet")
public class addCommentServlet extends HttpServlet {
        CommentService commentService=new CommentServiceImpl();
        PostService postService=new PostServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session= request.getSession();
        //String sender=(String) session.getAttribute("");
        //String sender="李四";
        //获得发送者的id 登录者的id
        int userId= (int) session.getAttribute("user_id");
        User user= (User) session.getAttribute("user");
        String sender=user.getUsername();
        //int userId=2;

        //帖子信息
        Post post= (Post) session.getAttribute("postDetail");
        String receiver=post.getUsername();
        int postId=post.getId();
        //通过postId找到贴主名
        int receiverId=-1;
        try {
          receiverId=postService.getUserIdByPostId(postId);
        } catch (SQLException e) {
            System.out.println("找不到贴主id");
        }
        String content=request.getParameter("commentContent");

        Comment comment=new Comment();
        comment.setSender(sender);
        comment.setSenderId(userId);
        comment.setReceiver(receiver);
        comment.setReceiverId(receiverId);
        comment.setPostId(postId);
        comment.setContent(content);
        comment.setIsRead(0);
        int updateRows=0;
        try{
            updateRows= commentService.addComment(comment);
            //添加完毕后跳回帖子详情页
            response.sendRedirect("PostDetailServlet?id="+postId);
        } catch (Exception e) {
            System.out.println("添加评论失败"+e.getMessage());
        }
    }
}