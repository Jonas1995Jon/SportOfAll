package com.sport.utils;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

//返回json类型数据
public class ReturnJson {

public static void response(String json, HttpServletResponse response){
		
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out;
		
		try {
			out = response.getWriter();
			out.print(json.toString());
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
