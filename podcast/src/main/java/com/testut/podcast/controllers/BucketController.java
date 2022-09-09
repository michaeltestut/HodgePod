package com.testut.podcast.controllers;

//Thank you to Ihor Sokolyk @ medium.com for this code
//https://medium.com/oril/uploading-files-to-aws-s3-bucket-using-spring-boot-483fcb6f8646

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.testut.podcast.services.AmazonClient;

@Controller
public class BucketController {
	
	@Autowired
    private AmazonClient amazonClient;

//    @PostMapping("/uploadFile")
//    public String uploadFile(@RequestPart(value = "file") MultipartFile file) {
//    	String url = this.amazonClient.uploadFile(file);
//    	System.out.println(url);
//        return "redirect:/home";
//    }

    @DeleteMapping("/deleteFile")
    public String deleteFile(@RequestPart(value = "url") String fileUrl) {
        return this.amazonClient.deleteFileFromS3Bucket(fileUrl);
    }
}