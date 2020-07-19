package com.mycompany.util;

import java.io.File;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class FileUpload {
	public static void uploadFile(MultipartHttpServletRequest mtfRequest, String path) {
		makeDirectory(path);
		MultipartFile mf = mtfRequest.getFile("file");

		String originFileName = mf.getOriginalFilename(); // 원본 파일 명
		long fileSize = mf.getSize(); // 파일 사이즈

		String filePath = path + "/" + System.currentTimeMillis() + "__" + originFileName ;
		if(originFileName=="" || originFileName == null)
			return;
		try {
			mf.transferTo(new File(filePath));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void uploadFiles(MultipartHttpServletRequest mtfRequest, String path) {
		makeDirectory(path);
		List<MultipartFile> fileList = mtfRequest.getFiles("file");

		for (MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명
			long fileSize = mf.getSize(); // 파일 사이즈

			String filePath = path + "/" + System.currentTimeMillis() + "__" + originFileName ;
			if(originFileName=="" || originFileName == null)
				return;
			try {
				mf.transferTo(new File(filePath));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public static void makeDirectory(String path) {
		File Folder = new File(path);

		// 해당 디렉토리가 없을경우 디렉토리를 생성합니다.
		if (!Folder.exists()) {
			try {
				Folder.mkdir(); // 폴더 생성합니다.
//				System.out.println("폴더가 생성되었습니다.");
			} catch (Exception e) {
				e.getStackTrace();
			}
		} else {
//			System.out.println("이미 폴더가 생성되어 있습니다.");
		}
	}
}
