package com.sport.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class ImgToBase64 {

	/**
	 * 将图片文件转化为字节数组字符串，并对其进行Base64编码处理
	 * 
	 * @param imgStream
	 * @return
	 */
	public static String getImgEncoder(InputStream imgStream) {

		byte[] data = null;

		// 读取图片字节数组
		try {
			FileInputStream in = (FileInputStream) imgStream;
			data = new byte[in.available()];
			in.read(data);
			in.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		// 对字节数组Base64编码
		BASE64Encoder encoder = new BASE64Encoder();

		// 返回Base64编码过的字节数组字符串
		return encoder.encode(data);
	}

	/**
	 * 对字节数组字符串进行Base64解码并生成图片
	 * 
	 * @param imgStr
	 * @param imgFilePath
	 * @return
	 */
	public static boolean getImgDecoder(String imgStr, String imgFilePath) {

		// 图像数据为空
		if (imgStr == null) {

			return false;

		}

		BASE64Decoder decoder = new BASE64Decoder();

		try {

			// Base64解码
			byte[] bytes = decoder.decodeBuffer(imgStr);

			for (int i = 0; i < bytes.length; ++i) {

				// 调整异常数据
				if (bytes[i] < 0) {

					bytes[i] += 256;

				}
			}

			// 生成jpeg图片
			OutputStream out = new FileOutputStream(imgFilePath);

			out.write(bytes);

			out.flush();

			out.close();

			return true;

		} catch (Exception e) {

			return false;

		}
	}	

	public static void main(String[] args) {

		File file = new File("E:/360壁纸/QQ头像/1.jpg");

		InputStream stream;

		String imgBase64 = "";

		try {

			stream = new FileInputStream(file);

			imgBase64 = getImgEncoder(stream);

			System.out.println(imgBase64);

		} catch (FileNotFoundException e) {

			e.printStackTrace();
		}

		if (imgBase64 != "" && imgBase64 != null) {

			Boolean flag = getImgDecoder(imgBase64,
					"E:/360壁纸/QQ头像/imgBase64.jpg");

			System.out.println(flag);

		}

	}

}
