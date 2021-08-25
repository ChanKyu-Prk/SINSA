package kr.co.sinsa.admin.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service("prdFileUploadService")
public class PrdFileUploadServiceImpl implements PrdFileUploadService {
	
	private static final String SAVE_PATH = "/upload/prdImg";
	private static final String PREFIX_URL = "/upload/prdImg/";
	
	
	
	@Override
	public String prdImgUpload(List<MultipartFile> multipartFile) {
		
		File uploadPath = new File("C:\\upload\\prdImg");
		
		if (!uploadPath.exists()) {
			try{
			    uploadPath.mkdirs(); 
		    } catch(Exception e) {
			    e.getStackTrace();
			} 
		}
		
		String url = null;
		
		try {
			for(int i=0; i<multipartFile.size(); i++) {
				
				
			// 파일 정보
			String originFileName = multipartFile.get(i).getOriginalFilename();
			writeFile(multipartFile.get(i), originFileName);		
			
			url = PREFIX_URL + originFileName;
			
			}
		}
		catch (IOException e) {
			throw new RuntimeException(e);
		}
			return url;
		
		
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
	private boolean writeFile(MultipartFile multipartFile, String saveFileName)
								throws IOException{
		boolean result = false;

		byte[] data = multipartFile.getBytes();
		FileOutputStream fos = new FileOutputStream(SAVE_PATH + "/" + saveFileName);

		fos.write(data);
		fos.close();
		
		return result;
	}
}
