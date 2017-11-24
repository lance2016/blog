package com.lance.handler;



import com.lance.bean.Blogs;
import com.lance.common.GenericController;
import com.lance.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;


/**
 * Created by lance on 2017/11/23.
 */
@Controller
@RequestMapping("/blog")
public class BlogHandler extends GenericController {

    @Autowired
    BlogService blogService;


    public static String getNowDate() {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss:SSS");
        String formatStr =formatter.format(new Date());
        return formatStr;
    }
//    前台
//    查询首页blog,按照先hot，后date降序排列
    @ResponseBody
    @RequestMapping(value="/getBlogForIndex",method = RequestMethod.POST)
    public List<Blogs> getBlogForIndex(){

       List<Blogs>list=blogService.getBlogForIndex();
        return list;
    }
    //查看对应blog
    @ResponseBody
    @RequestMapping(value = "/getBlogById",method=RequestMethod.POST)
    public Blogs getBlogById(@RequestParam Integer id){
        return blogService.findBlog(id);
    }



    /*
    *后台
     */




    //默认调用其他方法前先调用该方法
    @ModelAttribute
    public void getBlog(@RequestParam(value="id",required=false) Integer id,Map<String,Object> map) {
        System.out.println("----------------blog modelAttribute method++++++++++++"+id);
        if(id!=null){
            Blogs blog=blogService.getBlog(id);
            if(blog==null)
                System.out.println("没有该blog");
            else{
                System.out.println("从数据库中查出blog");
                map.put("blog",blog);
            }
        }
    }
    //查询所有数据
    @ResponseBody
    @RequestMapping(value = "/listAllBlogs",method = RequestMethod.POST)
    public List<Blogs>listAllBlogs(){
        List<Blogs>list=blogService.getAllBlogs();
        return list;
    }


    //更新博客




    //增加博客
    @ResponseBody
    @RequestMapping("/addBlog")
    public int addBlog(@RequestParam  String blogname,String author,String blogcontent,Integer hot){

        Blogs blogs=new Blogs(blogname,blogcontent,getNowDate(),author,hot);
        System.out.println(blogs);
        return blogService.insertBlog(blogs);
    }


    //删除博客
    @ResponseBody
    @RequestMapping(value = "deleteBlogById",method = RequestMethod.POST)
    public int deleteBlogById(@RequestParam Integer id){
        System.out.println("调用了+++++++++++++++++++deleteBlogById");
        return blogService.deleteBlog(id);
    }

    @ResponseBody
    @RequestMapping(value = "updateBlog",method = RequestMethod.POST)
    public int updateBlog(@RequestParam  String blogname,String author,String blogcontent,Integer hot,Map<String,Object>map){
        System.out.println(blogname+author+"&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
        Blogs blogs= (Blogs) map.get("blog");
        blogs.setBlogname(blogname);
        blogs.setAuthor(author);
        blogs.setBlogcontent(blogcontent);
        blogs.setDate(getNowDate());
        blogs.setHot(hot);
        blogService.updateBlog(blogs);
        return 1;
    }




}
