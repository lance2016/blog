package com.lance.dao.mapper;

import com.lance.bean.Blogs;
import com.lance.bean.BlogsExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface BlogsMapper {
    long countByExample(BlogsExample example);

    int deleteByExample(BlogsExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Blogs record);

    int insertSelective(Blogs record);

    List<Blogs> selectByExample(BlogsExample example);

    List<Blogs> selectBlogForIndex(BlogsExample example);

    Blogs selectByPrimaryKey(Integer id);


    int updateByExampleSelective(@Param("record") Blogs record, @Param("example") BlogsExample example);

    int updateByExample(@Param("record") Blogs record, @Param("example") BlogsExample example);

    int updateByPrimaryKeySelective(Blogs record);

    int updateByPrimaryKey(Blogs record);

    List<Blogs>searchBlog(Blogs blogs);
}