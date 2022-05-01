package com.example.xiegang.utils;

import com.aliyun.oss.OSSClient;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.io.File;
import java.security.SecureRandom;

@Slf4j
@Component
public class AliYunOss {
    // Endpoint
    @Value("${OSS.end-point}")
    public String ENDPOINT;

    // AccessKey 在AccessKey管理获取 -->登录后-->头像-->AccessKey管理
    @Value("${OSS.access-key}")
    public String ACCESSKEYID;

    // accessKeySecret 在AccessKey管理获取 -->登录后-->头像-->AccessKey管理
    @Value("${OSS.access-key-secret}")
    public String ACCESSKEYSECRET;

    // Bucket
    @Value("${OSS.bucket}")
    public String BUCKETNAME;

    @Value("${OSS.pic-url}")
    public String OSSPICURL;


    public String ossUpPic(File upFile) {
        String fileName = upFile.getName();

        // 获取文件的后缀名
        String suffixName = fileName.substring(fileName.lastIndexOf("."));
        // 生成上传文件名
        String finalFileName = System.currentTimeMillis() + "" + new SecureRandom().nextInt(0x0400) + suffixName;
        String objectName = "xiegang" + "/" + finalFileName;
        OSSClient ossClient = new OSSClient(ENDPOINT, ACCESSKEYID, ACCESSKEYSECRET);
        ossClient.putObject(BUCKETNAME, objectName, upFile);

        String url = OSSPICURL + finalFileName;
        log.info("上传图片至阿里云：{}", url);
        ossClient.shutdown();
        return url;
    }
}
