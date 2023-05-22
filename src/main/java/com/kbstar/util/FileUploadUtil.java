package com.kbstar.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.FileOutputStream;

public class FileUploadUtil {
	public static void saveFile(MultipartFile mf, String dir) { //파일 덩어리와 디렉토리 정보를 주면 저장해줄게
		byte [] data;
		String imgname = mf.getOriginalFilename();
		try {
			data = mf.getBytes();
			FileOutputStream fo = 
					new FileOutputStream(dir+imgname);
			fo.write(data);
			fo.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
}




