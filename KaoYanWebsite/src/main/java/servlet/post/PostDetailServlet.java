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
import service.user.UserService;
import service.user.UserServiceImpl;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "PostDetailServlet", value = "/PostDetailServlet")
public class PostDetailServlet extends HttpServlet {
    PostService postService=new PostServiceImpl();
    CommentService commentService=new CommentServiceImpl();
    UserService userService=new UserServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        //获得帖子的id,title,content
        int id=Integer.parseInt(request.getParameter("id"));
        System.out.println("id="+id);
        //通过id找到帖子
        Post post=postService.findPostById(id);
        //通过发帖人的id找到发帖人
        //通过帖子id返回所有评论
        ArrayList<Comment> commentList=null;
        try {
            commentList=commentService.getCommentListByPostId(id);
            if(!commentList.isEmpty()){
                session.setAttribute("commentList",commentList);
                session.setAttribute("NoCommentMsg","");
            }else{
                session.setAttribute("commentList",commentList);
                session.setAttribute("NoCommentMsg","-该帖子暂无评论-");
            }
        } catch (SQLException e) {
            System.out.println("error in 帖子评论");
        }
        session.setAttribute("postDetail",post);
        request.getRequestDispatcher("PostDetail.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String id=request.getParameter("id");
//        doGet(request,response);
        HttpSession session=request.getSession();
        int id=Integer.parseInt(request.getParameter("id"));
        int commentId=Integer.parseInt(request.getParameter("commentId"));
        System.out.println("id="+id);
        System.out.println("commentId="+commentId);
        try {
            boolean flag=userService.modifyIsRead(commentId);
            System.out.println("flag"+flag);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        Post post=postService.findPostById(id);
        ArrayList<Comment> commentList=null;
        try {
            commentList=commentService.getCommentListByPostId(id);
            if(!commentList.isEmpty()){
                session.setAttribute("commentList",commentList);
                session.setAttribute("NoCommentMsg","");
            }else{
                session.setAttribute("NoCommentMsg","-该帖子暂无评论-");
            }
        } catch (SQLException e) {
            System.out.println("error in 帖子评论");
        }

        session.setAttribute("postDetail",post);
        request.getRequestDispatcher("PostDetail.jsp").forward(request,response);
    }
}