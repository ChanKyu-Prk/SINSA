package kr.co.sinsa.biz.customer;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface FileUploadService {
	public String reviewImgUpload(List<MultipartFile> multipartFile, HttpServletRequest req);
}
