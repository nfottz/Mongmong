package com.gdu.mongmong.util;

import java.io.File;
import java.time.LocalDate;
import java.util.UUID;
import java.util.regex.Matcher;

import org.springframework.stereotype.Component;

@Component
public class MyFileUtil {

	private String sep = Matcher.quoteReplacement(File.separator);
	
	public String getPath() {
		
		LocalDate now = LocalDate.now();
		return "/storage" + sep + now.getYear() + sep + String.format("%02d", now.getMonthValue()) + sep + String.format("%02d", now.getDayOfMonth());
		
	}

	public String getFilesystemName(String originName) {
		
		String extName = null;
		
		if(originName.endsWith("tar.gz")) {
			extName = "tar.gz";
		} else {
			String[] array = originName.split("\\.");
			extName = array[array.length - 1];
		}
		
		return UUID.randomUUID().toString().replace("-", "") + "." + extName;
		
	}
	
	public String getTempPath() {
		return "/storage" + sep + "temp";
	}
	
	public String getTempfileName() {
		return UUID.randomUUID().toString().replace("-", "") + ".zip";
	}
	
	public String getYesterdayPath() {
		LocalDate date = LocalDate.now();
		date.minusDays(1);
		
		return "/storage" + sep + date.getYear() + sep + String.format("%02d", date.getMonthValue()) + sep + String.format("%02d", date.getDayOfMonth());
	}
	
}