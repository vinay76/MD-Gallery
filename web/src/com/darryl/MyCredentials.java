package com.darryl;

import com.amazonaws.auth.AWSCredentials;

public class MyCredentials implements AWSCredentials {
//	private static final String ACCESS_KEY = "AKIAJG4GFM2XRK6TOB7A";
//	private static final String SECRET_KEY = "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";
    //Darryl Credentials
	private static final String ACCESS_KEY = "AKIAIW63EDJ6ATS5XECA";
	private static final String SECRET_KEY = "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";

	public String getAWSAccessKeyId() {
		return ACCESS_KEY;
	}

	public String getAWSSecretKey() {
		return SECRET_KEY;
	}

}
