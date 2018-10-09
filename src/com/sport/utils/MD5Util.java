package com.sport.utils;

/**
 * @author job
 * MD5 加密
 */
import java.math.BigInteger;
import java.security.MessageDigest;

public class MD5Util {
	public static String makeMD5(String password) {
		MessageDigest md;
		try {
			md = MessageDigest.getInstance("MD5");
			if (password == null) {
				return null;
			}
			md.update(password.getBytes());
			String pwd = new BigInteger(1, md.digest()).toString(16);
			return pwd;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return password;
	}
	public static void main(String[] args) {
		System.out.println(makeMD5("12345"));
	}
}