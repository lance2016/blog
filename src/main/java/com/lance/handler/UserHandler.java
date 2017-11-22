package com.lance.handler;

import com.lance.bean.User;
import com.lance.common.GenericController;
import com.lance.service.UserService;
import com.sun.deploy.net.HttpResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by lance on 2017/11/21.
 */
@Controller
@RequestMapping("/user")
public class UserHandler extends GenericController {
    private static final Logger logger = LoggerFactory.getLogger(UserHandler.class);

    @Autowired
    UserService userService;

//获取当前时间
    public static String getNowDate() {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss:SSS");
        String formatStr =formatter.format(new Date());
        return formatStr;
    }

    @ModelAttribute
    public void getUser(@RequestParam(value="userId",required=false) Integer userId,Map<String,Object>map){
        System.out.println("-----------------------modelAttribute method++++++++++++++++++++++++++"+userId);
        if(userId!=null){
            User user=userService.getUserById(userId);
            if(user==null)
                System.out.println("没有该id");
            else
                System.out.println("从数据库中查出user"+user);
        }
    }

    private static final String INDEX="index";
    @RequestMapping("/admin")
    public String nothing(){
        return "background/index";
    }





    @RequestMapping("/checkLogin")
    @ResponseBody
    public String testcheck(String username,String password){
        System.out.println(username+password);
        return username+password;

    }

    @ResponseBody
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String checklogin(@RequestParam String username, String password, HttpServletRequest request) throws ServletException, IOException {
        //判断参数非空或者在前台检验，现在先不写

        System.out.println(username+"*****************"+password);

        User u=userService.getUserByUsername(username);
        if(u==null){
            return "0";//没有该用户
        }else{
            if(u.getPassword().equals(password)){
//                request.getRequestDispatcher("${pageContext.request.contextPath}/index.jsp").forward(request, response);//转发到登录界面
                HttpSession session = request.getSession();
                session.setAttribute("account",u);
                return "1";//成功登陆,前台跳转页面
            }

            else
                return "0";//密码不正确
        }

    }


    @RequestMapping("/logout")
    public void logout(HttpServletRequest request,HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);//防止创建Session
        if(session != null)
            session.removeAttribute("account");
        response.sendRedirect("../index.jsp");
    }


    //由于放在web-inf下面的文件不能直接访问，所以此处定义返回对应jsp的方法给ajax，然后ajax再加载到对应div上
    //此处建议文件名统一命名，方便一个方法返回所有的页面
    @RequestMapping("/getJsp")
    public String getAddUserJsp(@RequestParam(value="tpl") String tpl){
        System.out.println("给你返回一个jsp页面"+tpl);
        return "background/tpl/"+tpl;
    }



    //后台管理功能

    //1.增加用户
    @ResponseBody
    @RequestMapping(value="/addUser",method = RequestMethod.POST)
    public int addUser(@RequestParam String username,String nickname,String password){
        User user=new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setAuthority(1);//此处默认授予管理员权限
        user.setNickname(nickname);
        System.out.println(getNowDate()+"time                 time");
        user.setVisittime(String.valueOf(getNowDate()));
        int n=userService.addUser(user);
        System.out.println(n);
       return n;
    }


}


