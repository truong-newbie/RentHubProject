package com.example.renthubproject.service;

import jakarta.servlet.ServletContext;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

@Service
public class UploadService {
    private final ServletContext servletContext;
    public UploadService(ServletContext servletContext) {
        this.servletContext = servletContext;
    }
    public String handleSaveUploadFile(MultipartFile file , String targetFolder){
        String rootPath = this.servletContext.getRealPath("/resources/images");
        String finalName="";
        try {
            byte[] bytes = null;
            bytes = file.getBytes();
            //TargetFolder la folder ma ta muon den (avatar,product)
            File dir = new File(rootPath + File.separator + targetFolder);
            if (!dir.exists())
                dir.mkdirs();
// Create the file on server
            finalName= System.currentTimeMillis() + "-" + file.getOriginalFilename();
            File serverFile = new File(dir.getAbsolutePath() + File.separator +finalName);
            BufferedOutputStream stream = new BufferedOutputStream(
                    new FileOutputStream(serverFile));
            stream.write(bytes);
            stream.close();

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return finalName;
    }
}
