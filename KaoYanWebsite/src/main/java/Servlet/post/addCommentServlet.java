package Servlet.post;

import pojo.Comment;
import pojo.Post;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import service.comment.CommentService;
import service.comment.CommentServiceImpl;

import java.io.IOException;

@WebServlet(name = "addCommentServlet", value = "/addCommentServlet")
public class addCommentServlet extends HttpServlet {
        CommentService commentService=new CommentServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session= request.getSession();
        //String sender=(String) session.getAttribute("");
        String sender="李四";
        Post post= (Post) session.getAttribute("postDetail");
        String receiver=post.getUsername();
        int postId=post.getId();
        String content=request.getParameter("commentContent");
        Comment comment=new Comment();
        comment.setSender(sender);
        comment.setReceiver(receiver);
        comment.setPostId(postId);
        comment.setContent(content);
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