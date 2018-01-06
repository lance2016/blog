package com.lance.bean;

public class UserRoles {
    private Integer userRoleId;

    private String username;

    private String role;

    public Integer getUserRoleId() {
        return userRoleId;
    }

    public void setUserRoleId(Integer userRoleId) {
        this.userRoleId = userRoleId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role == null ? null : role.trim();
    }

    @Override
    public String toString() {
        return "UserRoles{" +
                "userRoleId=" + userRoleId +
                ", username='" + username + '\'' +
                ", role='" + role + '\'' +
                '}';
    }
}