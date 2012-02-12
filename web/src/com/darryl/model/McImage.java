package com.darryl.model;

/**
 * Created by IntelliJ IDEA.
 * User: vkumar
 * Date: 2/2/12
 * Time: 10:33 PM
 * To change this template use File | Settings | File Templates.
 */
public class McImage {
    private String bucketName = "";
    private String imageName = "";
    public static final String smallExt = "-150x150.gif";
    public static final String longExt = "-668x351.gif";
    public static final String url = "https://s3.amazonaws.com/";
    public static final double cost = 39.99;

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
        return imageName.replace('_',' ').replace('-',' ');
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

    @Override
    public String toString(){
        return bucketName+" "+imageName;
    }
}
