package com.darryl.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.Bucket;
import com.amazonaws.services.s3.model.ListObjectsRequest;
import com.amazonaws.services.s3.model.ObjectListing;
import com.amazonaws.services.s3.model.S3ObjectSummary;
import com.darryl.MyCredentials;
import com.darryl.model.McImage;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.web.context.ServletContextAware;

import javax.servlet.ServletContext;

public class S3Service implements ServletContextAware {

    public static final String IMAGES = "images";

    private Map<String, List<McImage>> images;
    private ServletContext servletContext;

    public Map<String, List<McImage>> getBucketInformation(MyCredentials credentials) {
        if (this.servletContext != null && this.servletContext.getAttribute(IMAGES) != null) {
            return (Map<String, List<McImage>>) this.servletContext.getAttribute(IMAGES);
        }
        Map<String, List<McImage>> returnMap = new HashMap<String, List<McImage>>();
        AmazonS3 amazonS3 = new AmazonS3Client(new MyCredentials());
        List<Bucket> buckets = amazonS3.listBuckets();
        for (Bucket bucket : buckets) {
            ListObjectsRequest listObjectsRequest = new ListObjectsRequest();
            listObjectsRequest.setBucketName(bucket.getName());
            ObjectListing listObjects = amazonS3.listObjects(listObjectsRequest);
            List<S3ObjectSummary> objectSummaries = listObjects.getObjectSummaries();
            List<McImage> images = new ArrayList<McImage>();
            for (S3ObjectSummary s3ObjectSummary : objectSummaries) {
                images.add(new McImage(s3ObjectSummary.getBucketName(), s3ObjectSummary.getKey()));
            }
            returnMap.put(bucket.getName(), images);
        }
        images = returnMap;
        return returnMap;
    }

    public void setServletContext(ServletContext servletContext) {
        this.servletContext = servletContext;
        images = getBucketInformation(new MyCredentials());
        servletContext.setAttribute(IMAGES, images);
    }
}
