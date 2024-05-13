package servlet.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pojo.School;
import pojo.Score;
import pojo.User;
import service.user.UserService;
import service.user.UserServiceImpl;
import com.alibaba.fastjson.JSONArray;
import util.Constants;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@MultipartConfig
@WebServlet(name = "UserServlet", value = "/UserServlet")
public class UserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method = request.getParameter("method");
        System.out.println("method="+method);
        if (method.equals("savepwd")&&method!=null){
            this.updatePwd(request,response);
        }else if (method.equals("pwdmodify")&&method!=null){
            this.pwdModify(request,response);
        }else if (method.equals("query")&&method!=null) {
            try {
                this.query(request,response);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
    }

    public void updatePwd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Object o = request.getSession().getAttribute(Constants.USER_SESSION);
        String newpassword = request.getParameter("newpassword");
        System.out.println("newpassword:"+newpassword);
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
        System.out.println("oldpassword"+oldpassword);
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

    public void query(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String schoolname = request.getParameter("schoolName");
        String year = request.getParameter("year");
        int queryYear=0;
        //获取用户列表
        UserServiceImpl userService = new UserServiceImpl();
        List<Score> scoreList=null;
        if (schoolname==null){
            schoolname="";
        }
        if (year!=null && !year.isEmpty()){
            queryYear=Integer.parseInt(year);
        }
        scoreList = userService.getScoreList(schoolname, queryYear);
        request.setAttribute("scoreList",scoreList);
        // 获取学校列表
        List<School> schoolList = userService.getSchool();
        request.setAttribute("schoolList",schoolList);
        request.setAttribute("schoolName",schoolname);
        //返回前端
        request.getRequestDispatcher("/schoolquery.jsp").forward(request,response);
    }
}
