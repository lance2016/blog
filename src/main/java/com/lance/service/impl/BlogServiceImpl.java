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
        return blogsMapper.insert(blogs);
    }

    @Override
    public int deleteBlog(Integer id) {
        return blogsMapper.deleteByPrimaryKey(id);
    }


    @Override
    public Blogs findBlog(Integer id) {
        return blogsMapper.selectByPrimaryKey(id);
    }

    @Override
    public long CountSize() {
        BlogsExample example=new BlogsExample();
        return blogsMapper.countByExample(example);
    }


    @Override
    public List<Blogs> getAllBlogs(int pageNum,int pageSize) {
        BlogsExample blogsExample=new BlogsExample();
        blogsExample.setOrderByClause("hot desc,date desc limit "+(pageNum-1)*pageSize+','+pageSize);
        return blogsMapper.selectByExample(blogsExample);
    }

    @Override
    public List<Blogs> getBlogForIndex(int num) {
        BlogsExample blogsExample=new BlogsExample();
        blogsExample.setOrderByClause("hot desc,date desc  limit "+num );
        return blogsMapper.selectBlogForIndex(blogsExample);
    }

    @Override
    public Blogs getBlog(Integer id) {
        return blogsMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateBlog(Blogs blogs) {
        return blogsMapper.updateByPrimaryKey(blogs);
    }
}
