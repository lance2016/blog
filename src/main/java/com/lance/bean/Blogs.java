package com.lance.bean;

public class Blogs {
    private Integer id;

    private String blogname;

    private String imgname;

    private String blogcontent;

    private String date;

    private String author;

    private String deleted;

    private Integer hot;

    private Integer visittime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBlogname() {
        return blogname;
    }

    public void setBlogname(String blogname) {
        this.blogname = blogname == null ? null : blogname.trim();
    }

    public String getImgname() {
        return imgname;
    }

    public void setImgname(String imgname) {
        this.imgname = imgname == null ? null : imgname.trim();
    }

    public String getBlogcontent() {
        return blogcontent;
    }

    public void setBlogcontent(String blogcontent) {
        this.blogcontent = blogcontent == null ? null : blogcontent.trim();
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date == null ? null : date.trim();
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author == null ? null : author.trim();
    }

    public String getDeleted() {
        return deleted;
    }

    public void setDeleted(String deleted) {
        this.deleted = deleted == null ? null : deleted.trim();
    }

    public Integer getHot() {
        return hot;
    }

    public void setHot(Integer hot) {
        this.hot = hot;
    }

    public Integer getVisittime() {
        return visittime;
    }

    public void setVisittime(Integer visittime) {
        this.visittime = visittime;
    }

    public Blogs() {
        super();
    }

    public Blogs(Integer id, String blogname, String imgname, String blogcontent, String date, String author, String deleted, Integer hot, Integer visittime) {
        this.id = id;
        this.blogname = blogname;
        this.imgname = imgname;
        this.blogcontent = blogcontent;
        this.date = date;
        this.author = author;
        this.deleted = deleted;
        this.hot = hot;
        this.visittime = visittime;
    }

    @Override
    public String toString() {
        return "Blogs{" +
                "id=" + id +
                ", blogname='" + blogname + '\'' +
                ", imgname='" + imgname + '\'' +
                ", blogcontent='" + blogcontent + '\'' +
                ", date='" + date + '\'' +
                ", author='" + author + '\'' +
                ", deleted='" + deleted + '\'' +
                ", hot=" + hot +
                ", visittime=" + visittime +
                '}';
    }

    public Blogs(String blogname, String blogcontent, String date, String author, Integer hot) {
        this.blogname = blogname;
        this.blogcontent = blogcontent;
        this.date = date;
        this.author = author;
        this.hot = hot;
    }
}