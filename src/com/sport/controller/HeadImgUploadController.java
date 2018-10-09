package com.sport.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.Serializable;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sport.entity.UserInfo;
import com.sport.service.UserInfoService;
import com.sport.utils.SessionExpire;

@Controller
@RequestMapping("file")
public class HeadImgUploadController {

	@Autowired
	@Qualifier("userInfoService")
	private UserInfoService userInfoService;

	/**
	 * 头像上传
	 * 
	 * @param filedata
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "headImgUpload", method = RequestMethod.POST)
	public ModelAndView saveFile(@RequestParam("file") MultipartFile filedata,
			HttpServletRequest request, String nick, String gender) {

		String nickname = "";

		try {
			
			byte[] b = nick.getBytes("ISO-8859-1");

			nickname = new String(b, "utf-8");

		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();

		Boolean flag = SessionExpire.isSessionExpire(request);

		if (flag) {

			int uid = (Integer) session.getAttribute("uid");

			UserInfo userInfo = userInfoService.findById((Serializable) uid);

			if (userInfo != null) {

				if (!"".equals(filedata.getOriginalFilename())) {

					String pathval = session.getServletContext().getRealPath("/");

					// 根据配置文件获取服务器图片存放路径
					String newFileName = String.valueOf(System.currentTimeMillis());

					String saveFilePath = "images\\uploadFile\\";

					/* 构建文件目录 */
					File fileDir = new File(pathval + saveFilePath);

					if (!fileDir.exists()) {

						fileDir.mkdirs();

					}

					// 上传的文件名
					String filename = filedata.getOriginalFilename();

					// 文件的扩张名
					String extensionName = filename.substring(filename
							.lastIndexOf(".") + 1);

					try {

						String imgPath = saveFilePath + newFileName + "."
								+ extensionName;

						if (userInfo != null) {

							userInfo.setHeadimg(imgPath);

						}

						// 打印图片位置
						System.out.println(pathval + imgPath);

						FileOutputStream out = new FileOutputStream(pathval
								+ imgPath);

						// 写入文件
						out.write(filedata.getBytes());

						out.flush();

						out.close();

						mv.addObject("headimg", userInfo.getHeadimg());

						mv.addObject("nickname", userInfo.getNickname());

						mv.addObject("gender", userInfo.getGender());

					} catch (Exception e) {
						e.printStackTrace();
					}

				}

				if (!StringUtils.isBlank(nick) && !StringUtils.isBlank(gender)) {

					userInfo.setNickname(nickname);

					userInfo.setGender(Integer.valueOf(gender));

					mv.addObject("headimg", userInfo.getHeadimg());

					mv.addObject("nickname", userInfo.getNickname());

					mv.addObject("gender", userInfo.getGender());

				}
				
				userInfoService.update(userInfo);

			}

		}

		mv.setViewName("personal/profile");

		return mv;
	}

}
