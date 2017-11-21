package com.lance.handler;

import com.lance.bean.User;
import com.lance.common.GenericController;
import com.lance.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
    @RequestMapping("/index")
    public String nothing(){
        return INDEX;
    }



    //nothing
    @RequestMapping("/ajaxTest")
    @ResponseBody
    public ModelMap ajaxTest(){
        System.out.println("进ajax的action了");
        ModelMap model=new ModelMap();
        model.addAttribute("key", "I'm value");
        return model;
    }


    @RequestMapping("/login")
    public String checklogin(User user){
        User u=userService.getUserByUsername(user.getUsername());
        if(u==null){
            System.out.println("没有该用户");
        }else{
            System.out.println(u);
        }
        return "background/index";
    }
}
