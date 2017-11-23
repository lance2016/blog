package com.lance.service.impl;

import com.lance.bean.Blogs;
import com.lance.bean.BlogsExample;
import com.lance.dao.mapper.BlogsMapper;
import com.lance.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by lance on 2017/11/23.
 */
@Service
public class BlogServiceImpl implements BlogService {

    @Autowired
    private BlogsMapper blogsMapper;

    @Override
    public int insertBlog(Blogs blogs) {
        return 0;
    }

    @Override
    public int deleteBlog(Integer id) {
        return 0;
    }

    @Override
    public Blogs findBlog(Integer id) {
        return null;
    }

    @Override
    public List<Blogs> getAllBlogs() {
        return null;
    }

    @Override
    public List<Blogs> getBlogForIndex() {
        BlogsExample blogsExample=new BlogsExample();
        return blogsMapper.selectByExample(blogsExample);
    }

    @Override
    public int updateBlog() {
        return 0;
    }
}
