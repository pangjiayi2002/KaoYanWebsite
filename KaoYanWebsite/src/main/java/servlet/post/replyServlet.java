package servlet.post;

import pojo.Comment;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import pojo.User;
import service.comment.CommentService;
import service.comment.CommentServiceImpl;

import java.io.IOException;

@WebServlet(name = "replyServlet", value = "/replyServlet")
public class replyServlet extends HttpServlet {
    CommentService commentService=new CommentServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session= request.getSession();
        //被回复的人
        String receiver=request.getParameter("username");
        int receiverId= Integer.parseInt(request.getParameter("senderId"));
        //发送回复的人
        //String sender=session.getAttribute();
        //String sender="张三";
        User user= (User) session.getAttribute("user");
        String sender=user.getUsername();
        int senderId=user.getId();

        int commentId= Integer.parseInt(request.getParameter("commentId"));
        int postId= Integer.parseInt(request.getParameter("postId"));
        System.out.println("postID="+postId);
        String replyContent=request.getParameter("replyContent");
        System.out.println("replyContent="+replyContent);
        Comment comment=new Comment();
        comment.setSender(sender);
        comment.setReceiver(receiver);
        comment.setPostId(postId);
        comment.setContent(replyContent);
        comment.setSenderId(senderId);
        comment.setReceiverId(receiverId);
        comment.setIsRead(0);
        //comment.setAvater();
        int updateRows=0;
        try{
            updateRows=commentService.addComment(comment);
            response.sendRedirect("PostDetailServlet?id="+postId);
        } catch (IOException e) {
            System.out.println("跳转失败"+e.getMessage());
        }

    }
}