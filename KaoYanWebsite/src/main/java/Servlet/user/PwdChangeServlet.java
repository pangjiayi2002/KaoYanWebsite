package servlet.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pojo.User;
import service.user.UserService;
import service.user.UserServiceImpl;
import com.alibaba.fastjson.JSONArray;
import util.Constants;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@MultipartConfig
@WebServlet(name = "PwdChangeServlet", value = "/PwdChangeServlet")
public class PwdChangeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method = request.getParameter("method");
        if (method.equals("savepwd")&&method!=null){
            this.updatePwd(request,response);
        }else if (method.equals("pwdmodify")&&method!=null){
            this.pwdModify(request,response);
        }
    }

    public void updatePwd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Object o = request.getSession().getAttribute(Constants.USER_SESSION);
        String newpassword = request.getParameter("newpassword");
        System.out.println("UserServlet:"+newpassword);
        boolean flag=false;
        if (o!=null && newpassword!=null){
            UserService userService=new UserServiceImpl();
            flag = userService.updatePwd(((User) o).getId(), newpassword);
            if (flag){
                request.setAttribute("message","修改密码成功，请退出，使用新密码登录");
                request.getSession().removeAttribute(Constants.USER_SESSION);
            }else {
                request.setAttribute("message","密码修改失败");
            }
        }else {
            request.setAttribute("message","新密码有问题");
        }
        request.getRequestDispatcher("/pwdmodify.jsp").forward(request,response);
    }
    //验证旧密码
    public void pwdModify(HttpServletRequest request, HttpServletResponse response){
        Object o = request.getSession().getAttribute(Constants.USER_SESSION);
        String oldpassword = request.getParameter("oldpassword");
        //万能的map
        Map<String,String> resultMap=new HashMap<>();
        if (o==null){//session失效/过期
            resultMap.put("result","sessionerror");
        }else if (oldpassword==null){//输入密码为空
            resultMap.put("result","error");
        }else {
            String userPassword = ((User) o).getPassword();//session中用户的密码
            if (oldpassword.equals(userPassword)){
                resultMap.put("result","true");
            }else {
                resultMap.put("result","false");
            }
        }
        try {
            response.setContentType("application/json");
            PrintWriter writer = response.getWriter();
            writer.write(JSONArray.toJSONString(resultMap));
            writer.flush();
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
