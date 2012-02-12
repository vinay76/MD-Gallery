package com.darryl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.*;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.ListObjectsRequest;
import com.amazonaws.services.s3.model.ObjectListing;
import com.amazonaws.services.s3.model.S3ObjectSummary;

@SuppressWarnings("serial")
public class Darryl_appServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		resp.setContentType("text/html");
		PrintWriter writer = resp.getWriter();
		
		AmazonS3 amazonS3 = new AmazonS3Client(new MyCredentials());
		ListObjectsRequest listObjectsRequest = new ListObjectsRequest();
		listObjectsRequest.setBucketName("darryl-poc");
		ObjectListing listObjects = amazonS3.listObjects(listObjectsRequest);
		List<S3ObjectSummary> objectSummaries = listObjects.getObjectSummaries();
		//writer.println(objectSummaries.size());
		for (S3ObjectSummary s3ObjectSummary : objectSummaries) {
			//http://darryl-poc.s3.amazonaws.com/3.jpg
			writer.println("<img src=\"https://s3.amazonaws.com/" + s3ObjectSummary.getBucketName() + "/"+ s3ObjectSummary.getKey() + "\">");
		}
	}
}
