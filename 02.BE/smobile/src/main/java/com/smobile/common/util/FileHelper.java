package com.smobile.common.util;

import java.io.File;
import java.io.IOException;
import java.math.BigInteger;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.SecureRandom;
import java.util.Date;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.smobile.common.constant.Constants;

public class FileHelper {
	
	/**
	 * 
	 * Save new file in server storage
	 * 
	 * @param parenFolderPath
	 * @param files
	 * @param filse
	 * @throws IOException
	 */
	public static String addNewFile(String parentFolderPath, MultipartFile[] files) throws IOException {
		return editFile(parentFolderPath, files, null);
	}
	
	/**
	 * 
	 * Save new file in server storage
	 * 
	 * @param parenFolderPath
	 * @param files
	 * @param filse
	 * @throws IOException
	 */
	public static String addNewFile(String parentFolderPath, MultipartFile files) throws IOException {
		return editFile(parentFolderPath, files, null);
	}
	
	/**
	 * 
	 * Save new file and remove old file in server storage
	 * 
	 * @param parenFolderPath
	 * @param files
	 * @param oldFilePath
	 * @param filse
	 * @throws IOException
	 */
	public static String editFile(String parentFolderPath, MultipartFile[] files, String oldFilePath ) 
				throws IOException {
		String randomStr = new BigInteger(130, new SecureRandom()).toString(32).substring(0, 6);
		String newFileName = CommonUtil.cvDateToString(new Date(), Constants.DATE_FORMAT_FOR_FILE_NAME) + Constants.COMMON_HYPHEN + randomStr;
		String rootFolderPath = System.getProperty(Constants.PROP_KEY_ROOT_FOLDER);
		
		String originalFileName = files[0].getOriginalFilename();
		String fileExtension = originalFileName.substring(originalFileName.lastIndexOf('.'), originalFileName.length());
		String assetPath = parentFolderPath + newFileName + fileExtension;
		String fullAssetPath = rootFolderPath + assetPath;
		
		/* Create folder to save video or image */
		File parentFolder = new File(rootFolderPath + parentFolderPath);
		if (!parentFolder.exists()) {
			parentFolder.mkdirs();
		}
		
		if (StringUtils.isNotEmpty(oldFilePath)) {
			/* Remove old file if it existed */
			deleteFile(rootFolderPath, oldFilePath);
		}
		
		byte[] fileInByte = files[0].getBytes();
		Path path = Paths.get(fullAssetPath);
		Files.write(path, fileInByte);
		return assetPath;
	}
	
	/**
	 * 
	 * Save new file and remove old file in server storage
	 * 
	 * @param parenFolderPath
	 * @param files
	 * @param oldFilePath
	 * @param filse
	 * @throws IOException
	 */
	public static String editFile(String parentFolderPath, MultipartFile files, String oldFilePath) 
				throws IOException {
		String randomStr = new BigInteger(130, new SecureRandom()).toString(32).substring(0, 6);
		String newFileName = CommonUtil.cvDateToString(new Date(), Constants.DATE_FORMAT_FOR_FILE_NAME) + Constants.COMMON_HYPHEN + randomStr;
		String rootFolderPath = System.getProperty(Constants.PROP_KEY_ROOT_FOLDER);
		
		String originalFileName = files.getOriginalFilename();
		String fileExtension = originalFileName.substring(originalFileName.lastIndexOf('.'), originalFileName.length());
		String assetPath = parentFolderPath + newFileName + fileExtension;
		String fullAssetPath = rootFolderPath + assetPath;
		
		/* Create folder to save video or image */
		File parentFolder = new File(rootFolderPath + parentFolderPath);
		if (!parentFolder.exists()) {
			parentFolder.mkdirs();
		}
		
		if (StringUtils.isNotEmpty(oldFilePath)) {
			/* Remove old file if it existed */
			deleteFile(rootFolderPath, oldFilePath);
		}
		
		byte[] fileInByte = files.getBytes();
		Path path = Paths.get(fullAssetPath);
		Files.write(path, fileInByte);
		return assetPath;
	}

	/**
	 * Delete File
	 * 
	 * @param parentFolder
	 * @param fileName
	 */
	public static void deleteFile(String fileName) throws IOException {
		
		String rootFolderPath = System.getProperty(Constants.PROP_KEY_ROOT_FOLDER);
		File deletedFile = new File(rootFolderPath + fileName);
		if(deletedFile.exists()) {
			deletedFile.delete();
		}
	}
	
	/**
	 * Delete File
	 * 
	 * @param parentFolder
	 * @param fileName
	 */
	public static void deleteFile(String parentFolder, String fileName) throws IOException{
		
		File deletedFile = new File(parentFolder + fileName);
		if (deletedFile.exists()) {
			deletedFile.delete();
		}
	}
	
	/**
	 * Enrcypt String(password) to MD5
	 * 
	 * @param inputStr
	 * @return
	 */
	public static String enrcyptMD5(String inputStr) {
		return DigestUtils.md5Hex(DigestUtils.md5(inputStr + Constants.ENCRYPT_CONSTANTS));
	}
	
	public static void main(String[] args) {
		System.out.println(enrcyptMD5("123"));
	}
}
