package com.neutrino.utils;

import net.coobird.thumbnailator.Thumbnails;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 * 文件上传工具
 */
public class UploadUtil {

	/**
	 * 处理文件上传
	 *
	 * @param file
	 * @param basePath
	 *            存放文件的目录的绝对路径 servletContext.getRealPath("/upload")
	 * @return  123.png
	 */
	public static String upload(MultipartFile file, String basePath) {
		String uuid = UUID.randomUUID().toString();

		String orgFileName = file.getOriginalFilename();
		String ext= "." + FilenameUtils.getExtension(orgFileName);
		String fileName = uuid + ext;
		try {
			File targetFile = new File(basePath, fileName);
			FileUtils.writeByteArrayToFile(targetFile, file.getBytes());
			//图片压缩
			String smallImg = uuid + "_small" + ext;
			File smallTargetFile = new File(basePath, smallImg);
			Thumbnails.of(new File[] { targetFile }).scale(0.4D).toFile(smallTargetFile);
			return fileName;

		} catch (IOException e) {
			e.printStackTrace();
		}
		return "";
	}

	/**
	 * 删除文件
	 * @param imagePath
     */
	public static void deleteFile(ServletContext servletContext, String imagePath) {
		String path = servletContext.getRealPath("/") + imagePath;
		File file = new File(path);
		if (file.exists()) {
			file.delete();
		}
		path = servletContext.getRealPath("/")
				+ imagePath.substring(0, imagePath.indexOf(".")) + "_small"
				+ imagePath.substring(imagePath.indexOf("."));
		file = new File(path);
		if (file.exists()) {
			file.delete();
		}
	}
}
























