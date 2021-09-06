package kr.co.sinsa.admin.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import kr.co.sinsa.admin.vo.PrdVO;

public interface PrdFileUploadService {
	
public String prdImgUpload(List<MultipartFile> multipartFile, HttpServletRequest req, PrdVO vo);
}
