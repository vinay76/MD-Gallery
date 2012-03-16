package com.darryl.model;

import java.io.Serializable;

/**
 * Created by IntelliJ IDEA.
 * User: vkumar
 * Date: 3/11/12
 * Time: 1:43 PM
 * To change this template use File | Settings | File Templates.
 */
public class Contact implements Serializable {
    private String fullName;
    private String phone;
    private String email;
    private String webUrl;
    private String comments;

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName == null || fullName.equals("") ? "'Anonymous'" : fullName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null || phone.equals("") ? "'-No Phone provided-'" : phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null || email.equals("") ? "'-No Email provided-'" : email;
    }

    public String getWebUrl() {
        return webUrl;
    }

    public void setWebUrl(String webUrl) {
        this.webUrl = webUrl == null || webUrl.equals("") ? "'-No Web Url specified-'" : webUrl;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }
}
