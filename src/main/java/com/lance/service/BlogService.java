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
    public List<Blogs> getAllBlogs();
    public List<Blogs> getBlogForIndex();
    public Blogs getBlog(Integer id);
    public int updateBlog(Blogs blogs);
}
