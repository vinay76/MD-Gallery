package com.darryl.model;

import java.io.Serializable;

/**
 * Created by IntelliJ IDEA.
 * User: vkumar
 * Date: 2/2/12
 * Time: 10:33 PM
 * To change this template use File | Settings | File Templates.
 */
public class McImage implements Serializable{
    private String bucketName = "";
    private String imageName = "";
    public static final String url = "https://s3.amazonaws.com/";
    public static final double cost = 49.99;
    public static final String BG = "_BG";
    public static final String RECENT = "NEW_PICS";

    public McImage(String bucketname, String imagename){
        bucketName = bucketname;
        imageName = imagename;
    }

    public String getImageName() {
        return imageName;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
    }

    public String getImageDescription() {
        return imageName.substring(0, imageName.lastIndexOf(".")).replace('_',' ').replace('-',' ');
    }

    public String getBucketName() {
        return bucketName;
    }

    public void setBucketName(String bucketName) {
        this.bucketName = bucketName;
    }

    public String getUrl(){
        return url + "/" + bucketName + "/" + imageName;
    }

    public String getBGUrl(){
        return url + "/" + bucketName + BG + "/" + imageName;
    }

    @Override
    public String toString(){
        return bucketName+" "+imageName;
    }
}
