package servlet.post;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import pojo.Comment;
import service.comment.CommentService;
import service.comment.CommentServiceImpl;

import java.io.IOException;

@WebServlet("/deleteComment")
public class DeleteCommentServlet extends HttpServlet {
    CommentService commentService=new CommentServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String commentIdStr=request.getParameter("commentId");
        int commentId=Integer.parseInt(commentIdStr);
        HttpSession session= request.getSession();
        int userId= (int) session.getAttribute("user_id");
        System.out.println("commentId="+commentId);
        System.out.println("user_id="+userId);
        Comment comment=commentService.getCommentByCommentId(commentId);

        int senderId=-1;
        if(comment!=null){
            senderId=comment.getSenderId();
            System.out.println("senderid="+senderId);
        }else{
            System.out.println("没找到该评论");
        }
        if(userId==senderId){
            int flag=commentService.deleteComment(commentId);
            if(flag==1){
                System.out.println("删评论成功");
            }
        }
    }
}