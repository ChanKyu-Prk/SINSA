package kr.co.sinsa.biz.customer.impl;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.sinsa.biz.customer.FileUploadService;

@Service("fileUploadService")
public class FileUploadServiceImpl implements FileUploadService{
	private static final String SAVE_PATH = "\\resources\\img\\review";
	@Override
	public String reviewImgUpload(List<MultipartFile> multipartFile , HttpServletRequest req) {
		String fileNames= "";

		try {
			for(int i = 0; i <multipartFile.size();i ++) {
				
				
			// 파일 정보
			String originFilename = multipartFile.get(i).getOriginalFilename();
			String extName
				= originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
			// 서버에서 저장 할 파일 이름
			String saveFileName = genSaveFileName(extName);			
			writeFile(multipartFile.get(i), saveFileName ,req);		
			fileNames += saveFileName+"/";
			
			}
		}
		catch (IOException e) {
			throw new RuntimeException(e);
		}
			return fileNames;
		
		
	}

	//파일 이름 생성
	private String genSaveFileName(String extName) {
		String fileName = "";
		
		Calendar calendar = Calendar.getInstance();
		fileName += calendar.get(Calendar.YEAR);
		fileName += calendar.get(Calendar.MONTH);
		fileName += calendar.get(Calendar.DATE);
		fileName += calendar.get(Calendar.HOUR);
		fileName += calendar.get(Calendar.MINUTE);
		fileName += calendar.get(Calendar.SECOND);
		fileName += calendar.get(Calendar.MILLISECOND);
		fileName += extName;
		
		return fileName;
	}
	
	
	// 파일을 실제로 write 하는 메서드
	private boolean writeFile(MultipartFile multipartFile, String saveFileName, HttpServletRequest req)
								throws IOException{
		boolean result = false;
		byte[] data = multipartFile.getBytes();
		FileOutputStream fos = new FileOutputStream(req.getSession().getServletContext().getRealPath(SAVE_PATH)+"\\" + saveFileName);
		fos.write(data);
		fos.close();
		
		return result;
	}
}
