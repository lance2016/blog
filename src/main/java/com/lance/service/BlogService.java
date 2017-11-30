package com.lance.service;

import com.lance.bean.Blogs;

import java.util.List;

/**
 * Created by lance on 2017/11/23.
 */
public interface BlogService {
    public int insertBlog(Blogs blogs);
    public int deleteBlog(Integer id);
    public Blogs findBlog(Integer id);
    public long CountSize();
    public List<Blogs> getAllBlogs(int pageNum,int pageSize);
    public List<Blogs> getBlogForIndex(int num);
    public Blogs getBlog(Integer id);
    public int updateBlog(Blogs blogs);
    public List<Blogs>searchBlog(Blogs blog);//搜索框查询
}
