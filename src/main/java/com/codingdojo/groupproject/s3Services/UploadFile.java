package com.codingdojo.groupproject.s3Services;

import java.io.InputStream;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectResult;

public class UploadFile {
	private final String AWSKEY = "AKIA4RWVHHZFP43FTM74";
	private final String AWSPASS = "adHaRKQcK/xQC/CwjxGZOMEoGdXspHvhYTvjuF71";
	
	public String getAWSKEY() {
		return AWSKEY;
	}
	public String getAWSPASS() {
		return AWSPASS;
	}
//	public static void main(String[] args) {
//		final AmazonS3 s3=AmazonS3ClientBuilder.standard().withCredentials(new AWSStaticCredentialsProvider(awsCreds)).withRegion("us-west-1").build();
//		String bucket_name = "eventsimg132";
//		String key_name = "displayBlocks.png";
//		String file_path = "/Users/ellie/Desktop/displayBlocks.png";
//		
		
//	}
	public String Upload(String bucketName, String keyName, InputStream filePath, ObjectMetadata metaData) {
		String awsKey = this.getAWSKEY();
		String awsPass = this.getAWSPASS();
		BasicAWSCredentials awsCreds = new BasicAWSCredentials(awsKey, awsPass);
		final AmazonS3 s3=AmazonS3ClientBuilder.standard().withCredentials(new AWSStaticCredentialsProvider(awsCreds)).withRegion("us-west-1").build();
		try {
			
			s3.putObject(bucketName, keyName, filePath, metaData);
			System.out.println(s3.getUrl("eventsimg132", keyName).toString());
			return s3.getUrl("eventsimg132", keyName).toString();
		}
		catch (AmazonServiceException e) {
			System.err.println(e.getErrorMessage());
			System.exit(1);
			return null;
		}

	}
}
