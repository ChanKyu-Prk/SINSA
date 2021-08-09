package kr.co.sinsa;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class test {

	public static void main(String[] args) {

		Date date = new Date();

		
		SimpleDateFormat sdg = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String d = sdg.format(date);
	
		try {
		Date da = sdg.parse(d);
		Map<String, Date> map = new HashMap<String, Date>();
		System.out.println(da);
		map.put("test", da);

		
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	


}