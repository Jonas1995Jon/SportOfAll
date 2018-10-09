package com.sport.utils;

import java.io.UnsupportedEncodingException;

import org.apache.commons.lang.StringUtils;

public class LuanMa {
	public static String luanMa(String oldStr){
		String newStr = "";
		if(!StringUtils.isBlank(oldStr)){
			try {
				
				byte[] bytes = oldStr.getBytes("ISO-8859-1");
				
				newStr = new String(bytes, "utf-8");
				
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		return newStr;
	}
}
