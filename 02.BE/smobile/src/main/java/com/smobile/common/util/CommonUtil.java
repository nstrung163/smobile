package com.smobile.common.util;

import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

import org.apache.commons.lang3.StringUtils;

import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@UtilityClass
public class CommonUtil {
	
	/**
	 * Convert date to string with input format
	 * 
	 * @param inputDate
	 * @param dateFormat
	 * @return outputDateStr
	 */
	
	public static String cvDateToString(Date inputDate, String dateFormat) {
		
		String outputDate = StringUtils.EMPTY;
		if (inputDate != null) {
			SimpleDateFormat dateFormatOutput = new SimpleDateFormat(dateFormat);
			outputDate = dateFormatOutput.format(inputDate);
		}
		return outputDate;
	}
	
	/**
	 * Convert string to date
	 * 
	 * @param dateStr
	 * @param dateFormat
	 * @return Date
	 */
	
	public static Date cvStringToDate(String dateStr, String dateFormat) {
		
		Date outputDate = null;
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(dateFormat);
		try {
			outputDate = simpleDateFormat.parse(dateStr);
		} catch (ParseException e) {
			log.error("Error when converting date: " + e.getMessage());
		}
		
		return outputDate;
	}
	
	/**
	 * Read Properties
	 * 
	 * @param key
	 * @param fileName
	 * @return value
	 */
	public static String readProperties(String key, String fileName) {
		InputStream inputStream = CommonUtil.class.getClassLoader().getResourceAsStream(fileName);
		Properties prop = new Properties();
		try {
			prop.load(inputStream);
			return prop.getProperty(key);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
