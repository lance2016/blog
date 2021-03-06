package com.lance.handler;

import com.lance.bean.User;
import com.lance.common.CodeController;
import com.lance.common.GenericController;
import com.lance.service.UserService;
import com.lance.service.UsersService;
import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by lance on 2017/11/21.
 */
@Controller
@RequestMapping("/user")
public class UserHandler extends GenericController {
    private static final Logger logger = LoggerFactory.getLogger(UserHandler.class);

    @Autowired
    UserService userService;
    @Autowired
    private AuthenticationManager authenticationManager;

    @Qualifier("myUserServiceImpl")
    @Autowired
    private UsersService usersService;

    @RequestMapping(value = "code",method = RequestMethod.GET)
    public void getCode(HttpServletRequest request,HttpServletResponse response) throws IOException {
        CodeController codeController=new CodeController();
        codeController.getCode(request,response);
    }


//获取当前时间，用来记录登陆时间或者用户最近一次访问时间
    public static String getNowDate() {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss:SSS");
        String formatStr =formatter.format(new Date());
        return formatStr;
    }


    @RequestMapping(value = "/loginPage", method = RequestMethod.GET)
    public String loginPage(@RequestParam(value = "error", required = false) String error) {
        if (error != null) {
            return "login";
        }
        return "login";
    }
    //权限不够跳转页面
    @RequestMapping(value = "/403",method = RequestMethod.GET)
    public ModelAndView accessDenied(@RequestParam(value = "error", required = false) String error){
        if(error!=null){
            System.out.println(error);
        }
        ModelAndView model = new ModelAndView();
        Authentication auth= SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)) {
            UserDetails userDetail = (UserDetails) auth.getPrincipal();
            model.addObject("username", userDetail.getUsername());
        }
        model.setViewName("403");
        return model;
    }
    @RequestMapping(value = "/tests", method = RequestMethod.GET)
    public String logintest() {

        return "background/test";
    }

    //注册
    @ResponseBody
    @RequestMapping(value = "register",method = RequestMethod.POST)
    public int register(@RequestParam String username,String password,String password2,String code2,HttpServletRequest request){
        HttpSession session=request.getSession();
        System.out.println(username+"  "+password+"  "+password2+"  "+code2);
        String code= (String) session.getAttribute("code");
        if(username.trim().equals("")||password.trim().equals("")||password2.trim().equals("")||code2.trim().equals(""))
            return -2;//信息不完整
        else if(!password.equals(password2)){
            return -1;//两次密码不一致
        }else if(!code2.equalsIgnoreCase(code)){
            return 0;//验证码错误
        }else{
            User u=userService.getUserByUsername(username);
            if(u!=null)
                return 2;//用户已存在
            else{
                User user=new User(username,password,0,"佚名",getNowDate());
                userService.addUser(user);
                return 1;
            }
        }

    }

//登录，返回指定参数给ajax，若登陆成功，由ajax执行登录操作
    @ResponseBody
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String checklogin(@RequestParam String username, String password,String code, HttpServletRequest request) throws ServletException, IOException {
        System.out.println("==========================login");
        if(username.trim().equals("")||password.trim().equals("")||code.trim().equals(""))
            return "-2";//输入信息不全
        //判断参数非空或者在前台检验，现在先不写
        HttpSession session=request.getSession();
        String code2= (String) session.getAttribute("code");
        //验证码不区分大小写
        if(!code.equalsIgnoreCase(code2))
            return "-1";//验证码错误
        else{
               UsernamePasswordAuthenticationToken authRequest = new UsernamePasswordAuthenticationToken(username, password);
            try {
                Authentication authentication = authenticationManager.authenticate(authRequest);
                SecurityContextHolder.getContext().setAuthentication(authentication);
                session.setAttribute("SPRING_SECURITY_CONTEXT", SecurityContextHolder.getContext()); // 这个非常重要，否则验证后将无法登陆
            } catch (AuthenticationException ex) {
                System.out.println("用户名或密码错误+id10086");
                return "0";
            }//end catch
            User user=userService.getUserByUsername(username);
            System.out.println(user+"现在的user");
            session.setAttribute("account",user);
            return "1";

        }


    }



    //用于验证后登录后台管理界面
    private static final String INDEX="index";
    @RequestMapping("/admin")
    public String gotobackground(){
        System.out.println("==========================gotobackground");
        return "background/index";
    }

    @RequestMapping("/test")
    public String gotobaeckground(){
        System.out.println("==========================gotobackground");
        return "background/test";
    }


    //注销
    @RequestMapping("/logout")
    public void logout(HttpServletRequest request,HttpServletResponse response) throws IOException {
        System.out.println("==========================logout");
        HttpSession session = request.getSession(false);//防止创建Session
        if(session != null){
            session.removeAttribute("account");
        }

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


    //需要增加一个检测session是否注销的操作，当用户提出请求的时候，检测session是否已经注销

    /*
    ** 增加用户
     */



    //1.增加用户
    @ResponseBody
    @RequestMapping(value="/addUser",method = RequestMethod.POST)
    public int addUser(@RequestParam String username,String nickname,String password,String password2){
        System.out.println("==========================addUser");
        //判断用户名和密码非空
        if(username.trim().equals("")||password.trim().equals(""))
            return 0;
        //判断账户是否重复
        else if(userService.getUserByUsername(username)!=null)
            return -1;

        //判断两次密码是否一致
        else if(password.equals(password2)){
            User user=new User();
            user.setUsername(username);
            user.setPassword(password);
            user.setAuthority(1);//此处默认授予管理员权限
            if(nickname.trim().equals(""))
                nickname="guest";
            user.setNickname(nickname);
            user.setVisittime(String.valueOf(getNowDate()));
            return userService.addUser(user);
         }
         else return -2;
    }


    /*
    **查询用户
     */

    //默认调用其他方法前先调用该方法
    @ModelAttribute
    public void getUser(@RequestParam(value="id",required=false) Integer userId,Map<String,Object>map) {
        System.out.println("-----------------------modelAttribute method++++++++++++++++++++++++++"+userId);
        if(userId!=null){
            User user=userService.getUserById(userId);
            if(user==null)
                System.out.println("没有该id");
            else{
                System.out.println("从数据库中查出user"+user);
                map.put("user",user);
            }
        }
    }

    //1.id查询用户
    @ResponseBody
    @RequestMapping(value="/getUserById",method = RequestMethod.POST)
    public User getUserById(@RequestParam Integer id,Map<String,Object>map){
        System.out.println("-=-------------------调用了getUserById");
        User u= (User) map.get("user");
        System.out.println("________________"+u);
        return userService.getUserById(id);
    }

    //2.查询所有user
    @ResponseBody
    @RequestMapping(value="getAllUsers",method = RequestMethod.POST)
    public List<User> getAllUsers(){
        System.out.println("调用了getAllUsers()+++++++++++++++");
        List<User> list=userService.getAllUsers();
      return list;
    }


    //搜索框搜索user
    @ResponseBody
    @RequestMapping(value = "searchUser",method = RequestMethod.POST)
    public List<User> searchUser(@RequestParam String criteria){
        System.out.println(" ++++++++++++"+criteria);
        User u=new User();
        u.setUsername(criteria);
        u.setNickname(criteria);
        u.setVisittime(criteria);
        return userService.searchUser(u);
    }


    /*
    ** 删除用户
     */
    //之后实现回收站功能   目前没有实现检测用户名不能重复的功能，后续必须添加
    //1.删除用户
    @ResponseBody
    @RequestMapping(value = "/deleteUserById",method = RequestMethod.POST)
    public int deleteUser(@RequestParam Integer id){
        System.out.println("==========================deleteUserById");
        int n=userService.deleteUserById(id);
        return n;
    }



    /*
    * 修改用户
     */

    //1.修改用户

    @ResponseBody
    @RequestMapping(value = "/updateUser",method = RequestMethod.POST)
    public int updateUser(@RequestParam String username,String nickname,Map<String,Object>map){

        System.out.println("==========================updateUser");
        User u= (User) map.get("user");
        u.setUsername(username);
        u.setNickname(nickname);
        userService.updateUser(u);
        return 1;
    }


    //单文件上传
    @ResponseBody
    @RequestMapping(value = "upload")
    public String queryFileData(@RequestParam("uploadfile") CommonsMultipartFile file, HttpServletRequest request) {
        // MultipartFile是对当前上传的文件的封装，当要同时上传多个文件时，可以给定多个MultipartFile参数(数组)
        if (!file.isEmpty()) {
            String type = file.getOriginalFilename().substring(
                    file.getOriginalFilename().indexOf("."));// 取文件格式后缀名
            String filename = System.currentTimeMillis() + type;// 取当前时间戳作为文件名
            String path = request.getSession().getServletContext()
                    .getRealPath("/uploadFiles/" + filename);// 存放位置
            File destFile = new File(path);
            try {
                // FileUtils.copyInputStreamToFile()这个方法里对IO进行了自动操作，不需要额外的再去关闭IO流
                FileUtils
                        .copyInputStreamToFile(file.getInputStream(), destFile);// 复制临时文件到指定目录下
            } catch (IOException e) {
                e.printStackTrace();
            }
            return "success";
        } else {
            return "failed";
        }
    }



    //多文件上传
    @ResponseBody
    @RequestMapping(value = "/uploads")
    public String queryFileDatas(@RequestParam("uploadfile") CommonsMultipartFile[] files, HttpServletRequest request) {
        if (files != null) {
            for (int i = 0; i < files.length; i++) {
                String type = files[i].getOriginalFilename().substring(
                        files[i].getOriginalFilename().indexOf("."));// 取文件格式后缀名
                String filename = System.currentTimeMillis() + type;// 取当前时间戳作为文件名
                String path = request.getSession().getServletContext()
                        .getRealPath("/upload/" + filename);// 存放位置
                File destFile = new File(path);
                try {
                    FileUtils.copyInputStreamToFile(files[i].getInputStream(),
                            destFile);// 复制临时文件到指定目录下
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            return "success";
        } else {
            return "false";
        }

    }

}


