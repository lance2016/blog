package com.lance.bean;

public class User {
    private Integer id;

    private String username;

    private String password;

    private Integer authority;

    private String nickname;

    private String visittime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public Integer getAuthority() {
        return authority;
    }

    public void setAuthority(Integer authority) {
        this.authority = authority;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname == null ? null : nickname.trim();
    }

    public String getVisittime() {
        return visittime;
    }

    public void setVisittime(String visittime) {
        this.visittime = visittime == null ? null : visittime.trim();
    }


    public User() {
        super();
    }

    public User(Integer id, String username, String password, Integer authority, String nickname, String visittime) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.authority = authority;
        this.nickname = nickname;
        this.visittime = visittime;
    }

    public User(String username, String password, Integer authority, String nickname, String visittime) {
        this.username = username;
        this.password = password;
        this.authority = authority;
        this.nickname = nickname;
        this.visittime = visittime;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", authority=" + authority +
                ", nickname='" + nickname + '\'' +
                ", visittime='" + visittime + '\'' +
                '}';
    }
}