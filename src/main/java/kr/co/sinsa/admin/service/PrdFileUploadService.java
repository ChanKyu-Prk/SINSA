package kr.co.sinsa.admin.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface PrdFileUploadService {
	
public String prdImgUpload(List<MultipartFile> multipartFile);
}
