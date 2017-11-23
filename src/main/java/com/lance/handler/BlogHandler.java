package com.lance.handler;



import com.lance.bean.Blogs;
import com.lance.common.GenericController;
import com.lance.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;


/**
 * Created by lance on 2017/11/23.
 */
@Controller
@RequestMapping("/blog")
public class BlogHandler extends GenericController {

    @Autowired
    BlogService blogService;

    @ResponseBody
    @RequestMapping(value="/getBlogForIndex",method = RequestMethod.POST)
    public List<Blogs> getBlogForIndex(){
        System.out.println("调用了getAllBlogs()+++++++++++++++");
       List<Blogs>list=blogService.getBlogForIndex();
        System.out.println(list);
        return list;
    }
}
