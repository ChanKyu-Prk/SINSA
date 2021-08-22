package kr.co.sinsa.biz.customer;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface FileUploadService {
public String reviewImgUpload(List<MultipartFile> multipartFile);
}
