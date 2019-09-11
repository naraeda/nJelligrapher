package com.codingdojo.groupproject.s3Services;

import java.util.List;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;

public class ListS3Bucket {

	public static void main(String[] args) {
		final AmazonS3 s3 = AmazonS3ClientBuilder.defaultClient();
		List<com.amazonaws.services.s3.model.Bucket> buckets = s3.listBuckets();
		System.out.println("Your Amazon S3 buckets are:");
		System.out.println(buckets);
	}
}
