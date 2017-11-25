package com.lance.handler;



import com.lance.bean.Blogs;
import com.lance.common.GenericController;
import com.lance.common.ImageUploadUtil;
import com.lance.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
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

//获取当时日期
    public static String getNowDate() {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss:SSS");
        String formatStr =formatter.format(new Date());
        return formatStr;
    }
    //随机数，用于生成随机博客图
    public int getRandomNum(){
        java.util.Random random=new java.util.Random();// 定义随机类
        int result=random.nextInt(10);// 返回[0,10)集合中的整数，注意不包括10
        return result+1;
    }



//    前台
//    查询首页blog,按照先hot，后date降序排列
    @ResponseBody
    @RequestMapping(value="/getBlogForIndex",method = RequestMethod.POST)
    public List<Blogs> getBlogForIndex(){

       List<Blogs>list=blogService.getBlogForIndex(6);
        return list;
    }
    //查看对应blog
    @ResponseBody
    @RequestMapping(value = "/getBlogById",method=RequestMethod.POST)
    public Blogs getBlogById(@RequestParam Integer id){
        return blogService.findBlog(id);
    }


    @RequestMapping(value = "/getBlog",method=RequestMethod.GET)
    public String getBlog(@RequestParam Integer id){
        return "second";
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






    //增加博客
    @ResponseBody
    @RequestMapping(value = "/addBlog",method = RequestMethod.POST)
    public int addBlog(@RequestParam  String blogname,String author,String blogcontent,Integer hot){

        if(blogname.trim().equals("")||author.trim().equals("")||blogcontent.trim().equals(""))
             return 0;
        else {
            Blogs blogs=new Blogs(blogname,blogcontent,getNowDate(),author,hot);
            blogs.setImgname("default ("+getRandomNum()+").jpg");//设置随机头像
            return blogService.insertBlog(blogs);
        }

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
      //  System.out.println(blogname+author+"&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
        //信息不全
        if(blogname.trim().equals("")||author.trim().equals("")||blogcontent.trim().equals(""))
            return 0;
        else{
            Blogs blogs= (Blogs) map.get("blog");
            blogs.setBlogname(blogname);
            blogs.setAuthor(author);
            blogs.setBlogcontent(blogcontent);
            blogs.setDate(getNowDate());
            blogs.setHot(hot);
        return  blogService.updateBlog(blogs);

        }

    }



    @RequestMapping("imageUpload")
    public void imageUpload(HttpServletRequest request, HttpServletResponse response) {
        String DirectoryName = "/images/";
        try {
            ImageUploadUtil.ckeditor(request, response, DirectoryName);
        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }




}
