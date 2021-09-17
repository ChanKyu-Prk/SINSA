package kr.co.sinsa.admin.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.sinsa.admin.vo.PrdVO;

@Service("prdFileUploadService")
public class PrdFileUploadServiceImpl implements PrdFileUploadService {
   
   private static final String SAVE_PATH = "/resources/prdImg";
   
   
   @Override
   public String prdImgUpload(List<MultipartFile> multipartFile, HttpServletRequest req, PrdVO vo) {
      
      File uploadPath = new File("C:\\upload\\prdImg");
      
      if (!uploadPath.exists()) {
         try{
             uploadPath.mkdirs(); 
          } catch(Exception e) {
             e.getStackTrace();
         } 
      }
      
      String fileNames = "";
      
      try {
         for(int i=0; i<multipartFile.size(); i++) {
            
            
         // 파일 정보
         //String originFileName = multipartFile.get(i).getOriginalFilename();
            String fileName = "";
            if (i == 0) {
               fileName = vo.getPrd_code() + ".png";
            } else {
               fileName = vo.getPrd_code() + i + ".png";
            }
            writeFile(multipartFile.get(i), fileName, req);      
         
            fileNames += fileName+"/";
         
         }
      }
      catch (IOException e) {
         throw new RuntimeException(e);
      }
         return fileNames;
      
      
   }

   
   // 파일을 실제로 write 하는 메서드
   private boolean writeFile(MultipartFile multipartFile, String saveFileName, HttpServletRequest req)
                        throws IOException{
      boolean result = false;
      byte[] data = multipartFile.getBytes();
      FileOutputStream fos = new FileOutputStream(req.getSession().getServletContext().getRealPath(SAVE_PATH)+"/" + saveFileName);
      fos.write(data);
      fos.close();
      
      return result;
   }   
}