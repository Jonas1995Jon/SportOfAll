package com.sport.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sport.entity.Activity;
import com.sport.entity.Menus;
import com.sport.entity.Page;
import com.sport.entity.UserActivity;
import com.sport.entity.UserInfo;
import com.sport.service.ActivityService;
import com.sport.service.PublishService;
import com.sport.service.SaiShiMenuService;
import com.sport.service.UserInfoService;
import com.sport.utils.DateUtil;
import com.sport.utils.ReturnJson;
import com.sport.utils.SessionExpire;

@Controller
@RequestMapping("publish")
public class PublishController {
	
	@Autowired
	@Qualifier("userInfoService")
	private UserInfoService userInfoService;
	
	@Autowired
	@Qualifier("publishService")
	private PublishService publishService;
	
	@Autowired
	@Qualifier("activityService")
	private ActivityService activityService;
	
	@Autowired
	@Qualifier("saiShiMenuService")
	private SaiShiMenuService menuService;
	
	private int aid;
	
	public int getAid() {
		return aid;
	}

	public void setAid(int aid) {
		this.aid = aid;
	}

	/**
	 * 跳转到发布活动界面
	 * @param request
	 * @return
	 */
	@RequestMapping("topublish")
	public ModelAndView topublish(HttpServletRequest request){
		
		String menuHql = "from Menus where menuLevel = 1";
		
		List<Menus> menus = menuService.findByHql(menuHql, null);
		
		menus.remove(menus.get(0));
		
		ModelAndView mv = new ModelAndView();
		
		Boolean flag = SessionExpire.isSessionExpire(request);
		
		if(flag){
			mv.addObject("menus", menus);
			mv.setViewName("publish");
		}else {
			mv.setViewName("index");
		}
		
		return mv;
		
	}
	
	/**
	 * 发布活动和修改活动
	 * @param request
	 * @param response
	 * @param title
	 * @param title
	 * @param summary
	 * @param synopsis
	 * @param edit
	 * @param position
	 * @param price
	 * @param time
	 * @param activityImg
	 * @param type
	 */
	@RequestMapping("publishActivity")
	public void pubishActivity(HttpServletRequest request, HttpServletResponse response,
			String title, String menuName, String summary, String synopsis, String edit,
			String position, float price, String time, String activityImg, int type){
		
		HttpSession session = request.getSession();
		
		JSONObject activityjson = new JSONObject();
		
		Boolean flag = SessionExpire.isSessionExpire(request);
		
		if(flag){
			
			if (type == 2) {
				
				Activity activity = new Activity();
				
				activity.setUid((Integer) session.getAttribute("uid"));
				activity.setTitle(title);
				activity.setMenuName(menuName);
				activity.setSummary(summary);
				activity.setSynopsis(synopsis);
				activity.setContent(edit);
				activity.setPosition(position);
				activity.setPrice(price);
				activity.setBeginTime(DateUtil.getStrToDate(time.substring(0, 10)));
				activity.setEndTime(DateUtil.getStrToDate(time.substring(13)));
				if(activityImg != null && activityImg != ""){
					activity.setImage(activityImg);
				}
				
				publishService.save(activity);
				
				activityjson.put("code", "2");
				
				activityjson.put("message", "发布成功!");
				
			}else if(type == 4) {
				
				Activity activity = publishService.findById((Serializable) getAid());
				
				activity.setTitle(title);
				activity.setMenuName(menuName);
				activity.setSummary(summary);
				activity.setSynopsis(synopsis);
				activity.setContent(edit);
				activity.setPosition(position);
				activity.setPrice(price);
				activity.setBeginTime(DateUtil.getStrToDate(time.substring(0, 10)));
				activity.setEndTime(DateUtil.getStrToDate(time.substring(13)));
				if(activityImg != null && activityImg != ""){
					activity.setImage(activityImg);
				}
				
				publishService.update(activity);
				
				activityjson.put("code", "4");
				
				activityjson.put("message", "修改成功!");
				
			}else {
				
				activityjson.put("code", "-1");
				
				activityjson.put("message", "出错啦");
				
			}
			
		}else {
			
			activityjson.put("code", "1");
			
			activityjson.put("message", "请先登录!");
			
		}
		
		ReturnJson.response(activityjson.toString(), response);
		
	}
	
	
	/**
	 * 活动图片上传
	 * 
	 * @param filedata
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "activityImgUpload", method = RequestMethod.POST)
	public void saveFile(@RequestParam("file") MultipartFile filedata,
			HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		
		Activity activity = new Activity();
		
		JSONObject activityjson = new JSONObject();

		Boolean flag = SessionExpire.isSessionExpire(request);

		if (flag) {

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

					activity.setImage(imgPath);
					
					activityjson.put("code", "0");
					
					activityjson.put("message", "上传成功!");
					
					activityjson.put("activityImg", imgPath);
					
//					publishService.save(activity);

					// 打印图片位置
					System.out.println(pathval + imgPath);

					FileOutputStream out = new FileOutputStream(pathval
							+ imgPath);

					// 写入文件
					out.write(filedata.getBytes());

					out.flush();

					out.close();

				} catch (Exception e) {
					e.printStackTrace();
				}

			}else {
				
				activityjson.put("code", "1");
				
				activityjson.put("message", "上传失败嘛，请先选择要上传的文件!");
			}

		}else {
			
			activityjson.put("code", "-1");
			
			activityjson.put("message", "请先登录!");
		}
		
		ReturnJson.response(activityjson.toString(), response);

	}
	
	/**
	 * 跳转到活动修改页面
	 * @param aid
	 * @return
	 */
	@RequestMapping("toModifyPage")
	public ModelAndView toModifyPage(int aid) {
		
		String menuHql = "from Menus where menuLevel = 1";
		
		List<Menus> menus = menuService.findByHql(menuHql, null);
		
		menus.remove(menus.get(0));
		
		setAid(aid);
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("aid", aid);
		
		mv.addObject("menus", menus);
		
		mv.setViewName("modifyPublish");
		
		return mv;
		
	}
	
	/**
	 * 根据活动ID查询活动信息显示到修改页面
	 * @param request
	 * @param response
	 * @param aid
	 */
	@RequestMapping("modifyActivity")
	public void modifyActivity(HttpServletRequest request, HttpServletResponse response, int aid){
		
		JSONObject activityjson = new JSONObject();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Boolean flag = SessionExpire.isSessionExpire(request);
		
		if(flag){
			
			if(aid > 0){
				
				Activity activity = activityService.findById((Serializable) aid);
				
				activityjson.put("code", "0");
				
				activityjson.put("message", "查询成功!");
				
				String date = sdf.format(activity.getBeginTime())+" - "+sdf.format(activity.getEndTime());
				
				activityjson.put("date", date);
				
				activityjson.put("activityjson", activity);
				
			}else {
				
				activityjson.put("code", "1");
			}
			
		}else {
			
			activityjson.put("code", "-1");
			
			activityjson.put("message", "请先登录!");
			
		}
		
		ReturnJson.response(activityjson.toString(), response);
				
	}
	
	/**
	 * 删除活动
	 * @param request
	 * @param aid
	 * @return
	 */
	@RequestMapping("deleteActivity")
	public ModelAndView deleteActivity(HttpServletRequest request, int aid) {
		
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		int curPage = 1;
		
		int uid = (Integer) session.getAttribute("uid");
		
		UserInfo userInfo = userInfoService.findById((Serializable) uid);
		
		List<Activity> activityList = new ArrayList<Activity>();
		
		publishService.delete((Serializable) aid);
		
		Page<Activity> page = new Page<Activity>();
		
		int pageSize = page.getPageSize();
		
		int totalCount = gettotalCount();
		
		page.setTotalCount(totalCount);
		
		page.setTotalPageCount();
		
		String hql = "from Activity";
		
		activityList = activityService.queryPage(hql, pageSize, curPage);
		
		page.setList(activityList);
		
		mv.addObject("radio", userInfo.getRadio());
		
		mv.addObject("page", page);
		
		mv.addObject("activityList", activityList);
		
		mv.setViewName("huodong");
		
		return mv;
		
	}
	
	/**
	 * 活动上下和下线
	 * @param request
	 * @param aid 活动ID 
	 * @param status 上下线标志(0:要下线l,1:要上线)
	 * @return
	 */
	@RequestMapping("ondownline")
	public void ondownline(HttpServletRequest request, HttpServletResponse response,
			int aid, int status){
		
		JSONObject linejson = new JSONObject();
		
		Boolean flag = SessionExpire.isSessionExpire(request);
		
		if(flag){
			
			Activity activity = activityService.findById((Serializable) aid);
			
			if(activity != null){
				
				if(status == 0){
					
					activity.setStatus(1);
					
					activityService.update(activity);
					
					linejson.put("message", "下线成功!");
					
				}else if (status == 1) {
					
					activity.setStatus(0);
					
					activityService.update(activity);
					
					linejson.put("message", "上线成功!");
					
				}
				
				linejson.put("code", "0");
				
			}else {
				
				linejson.put("code", "1");
				
				linejson.put("message", "没有找到该活动!");
				
			}
			
		}else {
			
			linejson.put("code", "-1");
			
			linejson.put("message", "请先登录企业账号!");
			
		}
		
		ReturnJson.response(linejson.toString(), response);
		
	}
	
	public int gettotalCount() {
		
		String hql = "from Activity";
		
		List<Activity> activities = new ArrayList<Activity>();
		
		activities = activityService.findByHql(hql, null);
		
		return activities.size();
		
	}
}
