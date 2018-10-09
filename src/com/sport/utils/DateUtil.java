package com.sport.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

/**
 * @author zlj
 * @return String
 */
public class DateUtil {

	private SimpleDateFormat sdf = null;
	
	/**
	 * 将具有日期格式的字符串转化为日期型
	 * @param dateStr
	 * @return
	 */
	public static Date getStrToDate(String dateStr) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = null;
		
		try {
			date = sdf.parse(dateStr);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return date;
		
	}

	/**
	 * 时间戳加随机数
	 */
	public String getTimeRand() {
		StringBuffer buf = new StringBuffer();
		buf.append(this.getTimeStamp());
		Random r = new Random();
		for (int i = 0; i < 3; i++) {
			buf.append(r.nextInt(10));
		}
		return buf.toString();
	}

	/**
	 * 将日期型转成字符串 返回字符串，形如：yyyyMMddHHmmssSSS
	 */
	public String getTimeStamp() {
		this.sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		return this.sdf.format(new Date());
	}

	public String getTimeStamp(String s) {
		this.sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		return this.sdf.format(s);
	}

	/**
	 * 具体到秒 返回类型： 字符串（纯数字）
	 */
	public String getTimeStamp2() {
		this.sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		return this.sdf.format(new Date());
	}

	/**
	 * 形如：1501231150
	 */
	public static int getNowTime() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmm");
		return Integer.parseInt(sdf.format(new Date()));
	}

	/**
	 * 形如：1501230000
	 */
	public static int getZeroTime() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd0000");
		return Integer.parseInt(sdf.format(new Date()));
	}

	/**
	 * 形如：1501231150->2015-01-23 11:50
	 */
	public static String getFmtTime(int intTime) {
		String fmtTime = String.valueOf(intTime);
		fmtTime = "20" + fmtTime.substring(0, 2) + "-"
				+ fmtTime.substring(2, 4) + "-" + fmtTime.substring(4, 6) + " "
				+ fmtTime.substring(6, 8) + ":" + fmtTime.substring(8, 10);
		return fmtTime;
	}

	/**
	 * 形如：2015-01-23 11:50->1501231150
	 */
	public static int getFmtTime(String strTime) {
		strTime = strTime.replaceAll("\\D", "").substring(1, 12);
		int fmtTime = Integer.parseInt(strTime);
		return fmtTime;
	}

	/**
	 * 参数int date 返回类型： 字符串（如2014-01-01）
	 */
	public static String getDate(int date) {
		String strDate = (date + "").substring(0, 4) + "-"
				+ (date + "").substring(4, 6) + "-"
				+ (date + "").substring(6, 8);
		return strDate;
	}

	/**
	 * 获取系统当前日期
	 * 
	 * @return 形如：20140101
	 */
	public int getTime2() {
		this.sdf = new SimpleDateFormat("yyyyMMdd");
		int time = Integer.parseInt(this.sdf.format(new Date()));
		return time;
	}

	/**
	 * 获取系统当前日期
	 * 
	 * @return 字符串，形如：2014-01-01
	 */
	public String getDate() {
		this.sdf = new SimpleDateFormat("yyyy-MM-dd");
		return this.sdf.format(new Date());
	}

	/**
	 * 获取系统当前时间
	 * 
	 * @return yyyyMMddHHmm
	 */
	public long getTime() {
		this.sdf = new SimpleDateFormat("yyyyMMddHHmm");
		long time = Long.parseLong(this.sdf.format(new Date()));
		return time;
	}

	/**
	 * 返回一个整型日期，具体到分钟 2014-01-01 12:00 -> 201401011200
	 */
	public static long getDate(String date) {
		date = date.replaceAll("\\D", "").substring(0, 12);
		Long result = Long.parseLong(date);
		return result;
	}

	/**
	 * 返回一个整型日期，具体到某天
	 * 
	 * @param String
	 *            2014-01-01 12:00
	 * @return int 处理后为整形数据形如：20140101
	 */
	public static int getDate2(String date) {
		date = date.replaceAll("\\D", "").substring(0, 8);
		int result = Integer.parseInt(date);
		return result;
	}

	/**
	 * 返回一个字符串日期，具体到某天
	 * 
	 * @return String: 20140101
	 */
	public String getDateStr() {
		this.sdf = new SimpleDateFormat("yyyyMMdd");
		String dateStr = sdf.format(new Date());
		return dateStr;
	}

	/**
	 * 时间戳转字符串 返回类型： 字符串
	 */
	public static String ts2String(long timeStamp) {
		String re_StrTime = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		long time = Long.valueOf(timeStamp);
		re_StrTime = sdf.format(new Date(time * 1L));
		return re_StrTime;
	}

	public static String tsToDate(long timeStamp) {
		String re_StrTime = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
		long time = Long.valueOf(timeStamp);
		re_StrTime = sdf.format(new Date(time * 1L));
		return re_StrTime;
	}

	public String tsToExcelDate(long timeStamp) {
		String re_StrTime = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		long time = Long.valueOf(timeStamp);
		re_StrTime = sdf.format(new Date(time * 1L));
		return re_StrTime;
	}

	/**
	 * 字符串转时间戳 返回类型： 字符串
	 */
	public static String String2Ts(String user_time) {
		String re_time = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date date;
		try {

			date = sdf.parse(user_time);
			long ld = date.getTime();
			re_time = String.valueOf(ld);

		} catch (ParseException e) {
			e.printStackTrace();
		}
		return re_time;
	}

	/**
	 * 从身份证提取出生日期
	 * 
	 * @param IDcard
	 * @return
	 */
	public String getBirthday(String IDcard) {
		String birthday = null;
		if (IDcard.length() == 15) {
			birthday = IDcard.substring(7, 12);
		} else if (IDcard.length() == 18) {
			birthday = IDcard.substring(6, 14);
		}
		return birthday;
	}

	/**
	 * 计算统计用的起始时间
	 * 
	 * @return 根据当前时间得到相应的起始日期
	 */
	public static int getLowTime(int YMD, int value) {
		Date date = new Date();
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmm");
		if (sdf.format(cal.getTime()).equals(sdf.format(date))) {
			cal.add(YMD, value);
		}
		int lowTime = Integer.parseInt(sdf.format(cal.getTime()));
		return lowTime;
	}

	public static void main(String args[]) {
		System.out.println(getNowTime());
		System.out.println(getFmtTime(1501231150));
		System.out.println(getFmtTime("2015-01-23 11:50 AM"));
		System.out.println(ts2String(1405652040000L));
		System.out.println(String2Ts("2015-01-12 11:20"));
		System.out.println(getLowTime(Calendar.DAY_OF_MONTH, -7));
	}
}
