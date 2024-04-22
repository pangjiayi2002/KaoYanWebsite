package Servlet.post;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "postServlet", value = "/postServlet")
public class postServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       //request.getRequestDispatcher("index.jsp").forward(request,response);
        //用户登录时的用户名(从这个登录名保存在哪中获取)
        String username;
        String title=request.getParameter("title");
        String content=request.getParameter("content");

    }
}