package com.darryl;

import com.amazonaws.auth.AWSCredentials;

public class MyCredentials implements AWSCredentials {
	private static final String ACCESS_KEY = "AKIAJG4GFM2XRK6TOB7A";
	private static final String SECRET_KEY = "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";

	public String getAWSAccessKeyId() {
		return ACCESS_KEY;
	}

	public String getAWSSecretKey() {
		return SECRET_KEY;
	}

}
