package com.lance.bean;

public class Message {
    private Integer id;

    private String name;

    private String content;

    private String email;

    private Integer isread;

    private String createtime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getIsread() {
        return isread;
    }

    public void setIsread(Integer isread) {
        this.isread = isread;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime == null ? null : createtime.trim();
    }

    public Message(String name, String content, String email, Integer isread, String createtime) {
        this.name = name;
        this.content = content;
        this.email = email;
        this.isread = isread;
        this.createtime = createtime;
    }

    public Message() {
        super();
    }

    public Message(Integer id, String name, String content, String email, Integer isread, String createtime) {
        this.id = id;
        this.name = name;
        this.content = content;
        this.email = email;
        this.isread = isread;
        this.createtime = createtime;
    }

    @Override
    public String toString() {
        return "Message{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", content='" + content + '\'' +
                ", email='" + email + '\'' +
                ", isread=" + isread +
                ", createtime='" + createtime + '\'' +
                '}';
    }
}