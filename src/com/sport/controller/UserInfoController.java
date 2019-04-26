package com.sport.controller;

import java.io.Serializable;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sport.entity.*;
import com.sport.service.*;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.aliyuncs.exceptions.ClientException;
import com.sport.utils.AliSms;
import com.sport.utils.MD5Util;
import com.sport.utils.ReturnJson;
import com.sport.utils.SessionExpire;

@Controller
public class UserInfoController {
	
	@Autowired
	@Qualifier("userInfoService")
	private UserInfoService userInfoService;
	
	@Autowired
	@Qualifier("activityService")
	private ActivityService activityService;
	
	@Autowired
	@Qualifier("commonSenseService")
	private CommonSenseService commonSenseService;
	
	@Autowired
	@Qualifier("zhiDaoYuanService")
	private ZhiDaoYuanService zhiDaoYuanService;
	
	@Autowired
	@Qualifier("siteService")
	private SiteService siteService;
	
	@Autowired
	@Qualifier("clubService")
	private ClubService clubService;

	@Autowired
	@Qualifier("userActivityService")
	private UserActivityService userActivityService;

	@Autowired
	@Qualifier("userSiteService")
	private UserSiteService userSiteService;
	
	int random;
	
	@RequestMapping("index")
	public ModelAndView index() throws ParseException{
		
		ModelAndView mv = publicIndex();
		
		return mv;
		
	}
	
	@RequestMapping("site")
	public void site(HttpServletResponse response, String site){
		
		JSONObject sitejson = new JSONObject();
		
		String siteHql = "";
		
		if(!StringUtils.isBlank(site) && !"全部".equals(site)){
			siteHql = "from Site where name like '%" + site + "%' order by price";
		}else {
			siteHql = "from Site order by price";
		}
		
		List<Site> sites = siteService.queryPage(siteHql, 3, 1);
		
		if(sites.size() > 0){
			sitejson.put("code", 0);
			sitejson.put("messages", "查询成功!");
			sitejson.put("sites", sites);
		}else {
			sitejson.put("code", 1);
			sitejson.put("messages", "暂无有关"+site+"的数据!");
		}
		
		ReturnJson.response(sitejson.toString(), response);
		
	}
	
	@RequestMapping("login")
	public void login(HttpServletRequest request, HttpServletResponse response,
			String username, String password){
		
		JSONObject userInfoJson = new JSONObject();
		
		UserInfo userInfo = null;
		
		Boolean flag;
		
		try {
			
			flag = userInfoService.isUserExits(username, username);
			
			if(flag){
				
				userInfo = userInfoService.login(request, response, username, password);
				
				if(userInfo != null){
					
					if(MD5Util.makeMD5(password).equals(userInfo.getPassword())){
						
						userInfoJson = JSONObject.fromObject(userInfo);
						
						userInfoJson.put("code", "0");
						
						userInfoJson.put("message", "欢迎 "+username+" 登录");
					}else{
						
						userInfoJson.put("code", "2");
						
						userInfoJson.put("message", "密码错误!");
					}
					
				}else {
					
					userInfoJson.put("code", "2");
					
					userInfoJson.put("message", "密码错误!");
				}				
				
			}else{
				
				userInfoJson.put("code", "1");
				
				userInfoJson.put("message", "该用户不存在!");
			}
			
		} catch (Exception e) {
			
			userInfoJson.put("code", "-1");
			
			userInfoJson.put("message", "后台出问题了!");
			
			e.printStackTrace();
			
		}
		
		ReturnJson.response(userInfoJson.toString(), response);
		
	}
	
	@RequestMapping("logout")
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws ParseException{
		
		ModelAndView mv = publicIndex();
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("username");
		
		session.removeAttribute("uid");
		
		session.removeAttribute("radio");
		
		Cookie[] cookie = request.getCookies();
		
		if(cookie.length > 0){
			for(Cookie c : cookie){
				if("username".equals(c.getName())){
					c.setMaxAge(0);
					c.setPath("/");
					response.addCookie(c);
				}
				if("password".equals(c.getName())){
					c.setMaxAge(0);
					c.setPath("/");
					response.addCookie(c);
				}
			}
		}
		
		return mv;
		
	}
	
	@RequestMapping("yanZhengMa")
	public void yanZhengMa(HttpServletResponse response, String phone, String type){
		
		JSONObject json = new JSONObject();
		
		random = new Random().nextInt(999999);
		if(random < 100000){
			random += 100000;
		}
		
		Boolean flag = userInfoService.isUserExits(phone, phone);
		
		try {
			if("zc".equals(type)){
				if(!flag){
					json = JSONObject.fromObject(returncode(phone));
				}else{
					json.put("code", -1);
					json.put("message", "该用户已被注册");
				}
			}else if("zh".equals(type)){
				if(flag){
					json = JSONObject.fromObject(returncode(phone));
				}else{
					json.put("code", -1);
					json.put("message", "该用户还未注册");
				}
			}
			
		} catch (ClientException e) {
			e.printStackTrace();
			json.put("code", -2);
			json.put("message", "发送失败");
		}
		
		ReturnJson.response(json.toString(), response);
		
	}
	
	public JSONObject returncode(String phone) throws ClientException{
		JSONObject json = new JSONObject();
		String code = AliSms.sendSms(phone, random);
		if("OK".equals(code)){
			json.put("code", 0);
			json.put("message", "发送成功");
		} else {
			json.put("code", 1);
			json.put("message", "发送失败");
		}
		return json;
	}
	
	@RequestMapping("register")
	public void register(HttpServletResponse response, String username,
			String password, String phone, int code, int radio){
		
		UserInfo userInfo = new UserInfo();
		
		JSONObject regjson = new JSONObject();
		
		if(!StringUtils.isBlank(username)  && !StringUtils.isBlank(password)){
		
			Boolean flag = userInfoService.isUserExits(username, phone);
			
			if(flag){
				
				regjson.put("code", "1");
				
				regjson.put("message", "该用户已被注册");
				
			} else {
					
				if(code == random){
					userInfo.setUsername(username);
					userInfo.setPassword(MD5Util.makeMD5(password));
					userInfo.setPhone(phone);
					userInfo.setRadio(radio);
					
					userInfoService.save(userInfo);
					
					regjson.put("code", "0");
					regjson.put("message", "注册成功");
				} else {
					regjson.put("code", "-1");				
					regjson.put("message", "验证码错误");
				}
				
				
			}
		}
		
		ReturnJson.response(regjson.toString(), response);
		
	}
	
	@RequestMapping("profile")
	public ModelAndView personal(HttpServletRequest request){
		
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		Boolean flag = SessionExpire.isSessionExpire(request);
		
		if(flag){
			
			int uid = (Integer) session.getAttribute("uid");
			
			UserInfo userInfo = userInfoService.findById((Serializable) uid);
			
			if(userInfo != null){
				
				mv.addObject("headimg", userInfo.getHeadimg());
				
				mv.addObject("nickname", userInfo.getNickname());
				
				mv.addObject("gender", userInfo.getGender());
				
			}
			
			mv.setViewName("personal/profile");
			
		}else {
			
			mv.setViewName("index");
			
		}
		
		return mv;
		
	}
	
	@RequestMapping("updateprofile")
	@ResponseBody
	public ModelAndView updateprofile(HttpServletRequest request,
			@RequestParam(value="nick",required=false) String nickname,
			@RequestParam(value="gender",required=false) String gender){
		
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		Boolean flag = SessionExpire.isSessionExpire(request);
		
		if(flag){
			
			int uid = (Integer) session.getAttribute("uid");
			
			UserInfo userInfo = userInfoService.findById((Serializable) uid);
			
			if(userInfo != null){
				
				if(!StringUtils.isBlank(nickname) && !StringUtils.isBlank(gender)){
				
					userInfo.setNickname(nickname);
					
					userInfo.setGender(Integer.valueOf(gender));
					
					userInfoService.update(userInfo);
					
					mv.addObject("headimg", userInfo.getHeadimg());
					
					mv.addObject("nickname", userInfo.getNickname());
					
					mv.addObject("gender", userInfo.getGender());
				
				}
				
			}
			
			mv.setViewName("personal/profile");
			
		}else {
			
			mv.setViewName("index");
			
		}		
		
		return mv;
		
	}
	
	@RequestMapping("fitness")
	public ModelAndView fitness(HttpServletRequest request){
		
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		Boolean flag = SessionExpire.isSessionExpire(request);
		
		if(flag){
			
			int uid = (Integer) session.getAttribute("uid");
			
			UserInfo userInfo = userInfoService.findById((Serializable) uid);
			
			if(userInfo != null){
				
				mv.addObject("height", userInfo.getHeight());
				
				mv.addObject("weight", userInfo.getWeight());
				
				if(userInfo.getBirthday() != null){
					
					mv.addObject("birthday", userInfo.getBirthday().toString().substring(0, 10));
					
				}				
				
				mv.addObject("bodyfat", userInfo.getBodyfat());
				
			}
			
			mv.setViewName("personal/fitness");
			
		}else {
			
			mv.setViewName("index");
			
		}
		
		return mv;
		
	}
	
	@RequestMapping("modifyFitness")
	public void modifyFitness(HttpServletRequest request, HttpServletResponse response,
			float weight, float height, String birthday, int bodyfat){
		
		HttpSession session = request.getSession();
		
		JSONObject fitnessjson = new JSONObject();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Boolean flag = SessionExpire.isSessionExpire(request);
		
		if(flag){
			
			int uid = (Integer) session.getAttribute("uid");
			
			UserInfo userInfo = userInfoService.findById((Serializable) uid);
			
			if(userInfo != null){
				
				if(weight != 0.0 && height != 0.0 && !"".equals(birthday) && birthday != null && bodyfat != 0){
					
					if(weight != userInfo.getWeight()){
						userInfo.setWeight(weight);
					}
					if(height != userInfo.getHeight()){
						userInfo.setHeight(height);
					}
					try {
						if(sdf.parse(birthday) != userInfo.getBirthday()){
							userInfo.setBirthday(sdf.parse(birthday));
						}
					} catch (ParseException e) {
						
						fitnessjson.put("code", "-1");
						
						fitnessjson.put("message", "日期转换错误!");
						
						e.printStackTrace();
						
					}
					if(bodyfat != userInfo.getBodyfat()){
						userInfo.setBodyfat(bodyfat);
					}
					
					userInfoService.update(userInfo);
					
					fitnessjson.put("code", "0");
					
					fitnessjson.put("message", "修改成功!");
					
				}
					
			}
			
		}else {
			
			fitnessjson.put("code", "1");
			
			fitnessjson.put("message", "请先登录!");
			
		}
		
		ReturnJson.response(fitnessjson.toString(), response);
		
	}
	
	@RequestMapping("settings")
	public ModelAndView settings(HttpServletRequest request){
		
		ModelAndView mv = new ModelAndView();
		
		Boolean flag = SessionExpire.isSessionExpire(request);
		
		if(flag){
			
			mv.setViewName("personal/settings");
			
		}else {
			
			mv.setViewName("index");
			
		}
		
		return mv;
		
	}

	@RequestMapping("myActivity")
	public ModelAndView myActivity(HttpServletRequest request){

		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();

		Boolean flag = SessionExpire.isSessionExpire(request);

		if(flag){

			int uid = (Integer) session.getAttribute("uid");

			String userActivityHql = "from UserActivity where uid = ?";

			JSONObject jsonObj = new JSONObject();
			JSONArray jsonArr = new JSONArray();

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			List<UserActivity> userActivityList = userActivityService.findByHql(userActivityHql, uid);

			for (UserActivity ua : userActivityList) {
				Activity activity = activityService.findById((Serializable) ua.getAid());
				jsonObj.put("aid", activity.getAid());
				jsonObj.put("title", activity.getTitle());
				jsonObj.put("menuName", activity.getMenuName());
				jsonObj.put("position", activity.getPosition());
				jsonObj.put("beginTime", sdf.format(activity.getBeginTime()));
				jsonObj.put("endTime", sdf.format(activity.getEndTime()));
				jsonObj.put("price", activity.getPrice());
				jsonObj.put("state", ua.getState());
				jsonArr.add(jsonObj);
			}

			mv.addObject("activityList", jsonArr);

			mv.setViewName("personal/myActivity");

		}else {

			mv.setViewName("index");

		}

		return mv;

	}

	@RequestMapping("mySite")
	public ModelAndView mySite(HttpServletRequest request){

		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();

		Boolean flag = SessionExpire.isSessionExpire(request);

		if(flag){

			int uid = (Integer) session.getAttribute("uid");

			String userActivityHql = "from UserSite where uid = ?";

			JSONObject jsonObj = new JSONObject();
			JSONArray jsonArr = new JSONArray();

			List<UserSite> userActivityList = userSiteService.findByHql(userActivityHql, uid);

			for (UserSite us : userActivityList) {
				Site site = siteService.findById((Serializable) us.getSid());
				jsonObj.put("sid", site.getSid());
				jsonObj.put("name", site.getName());
				jsonObj.put("phone", site.getPhone());
				jsonObj.put("address", site.getAddress());
				jsonObj.put("price", site.getPrice());
				jsonObj.put("state", us.getState());
				jsonArr.add(jsonObj);
			}

			mv.addObject("siteList", jsonArr);

			mv.setViewName("personal/mySite");

		}else {

			mv.setViewName("index");

		}

		return mv;

	}

	@RequestMapping("activityShenHe")
	public ModelAndView activityShenHe(HttpServletRequest request){

		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();

		Boolean flag = SessionExpire.isSessionExpire(request);

		if(flag){

			int uid = (Integer) session.getAttribute("uid");

			String userActivityHql = "from UserActivity where state = 0";

			JSONObject jsonObj = new JSONObject();
			JSONArray jsonArr = new JSONArray();

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			List<UserActivity> userActivityList = userActivityService.findByHql(userActivityHql);

			for (UserActivity ua : userActivityList) {
				Activity activity = activityService.findById((Serializable) ua.getAid());
				if (uid == activity.getUid()) {
					jsonObj.put("aid", activity.getAid());
					jsonObj.put("title", activity.getTitle());
					jsonObj.put("menuName", activity.getMenuName());
					jsonObj.put("position", activity.getPosition());
					jsonObj.put("beginTime", sdf.format(activity.getBeginTime()));
					jsonObj.put("endTime", sdf.format(activity.getEndTime()));
					jsonObj.put("price", activity.getPrice());
					jsonObj.put("uaid", ua.getUaid());
					jsonObj.put("state", ua.getState());
					jsonArr.add(jsonObj);
				}
			}

			mv.addObject("activityList", jsonArr);

			mv.setViewName("personal/activityShenHe");

		}else {

			mv.setViewName("index");

		}

		return mv;

	}

	@RequestMapping("activityYesOrNo")
	public void activityYesOrNo(HttpServletRequest request, int uaid, int state){

		UserActivity userActivity = userActivityService.findById((Serializable) uaid);

		if (state == 1) {
			userActivity.setState(1);
		} else if (state == 2) {
			userActivity.setState(2);
		}

		userActivityService.update(userActivity);

		new UserInfoController().activityShenHe(request);
	}

	@RequestMapping("siteShenHe")
	public ModelAndView siteShenHe(HttpServletRequest request){

		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();

		Boolean flag = SessionExpire.isSessionExpire(request);

		if(flag){

			int uid = (Integer) session.getAttribute("uid");

			String userSiteHql = "from UserSite where state = 0";

			JSONObject jsonObj = new JSONObject();
			JSONArray jsonArr = new JSONArray();

			List<UserSite> siteList = userSiteService.findByHql(userSiteHql);

			for (UserSite us : siteList) {
				Site site = siteService.findById((Serializable) us.getSid());
				if (uid == site.getUid()) {
					jsonObj.put("sid", site.getSid());
					jsonObj.put("name", site.getName());
					jsonObj.put("phone", site.getPhone());
					jsonObj.put("address", site.getAddress());
					jsonObj.put("price", site.getPrice());
					jsonObj.put("usid", us.getUsid());
					jsonObj.put("state", us.getState());
					jsonArr.add(jsonObj);
				}
			}

			mv.addObject("siteList", jsonArr);

			mv.setViewName("personal/siteShenHe");

		}else {

			mv.setViewName("index");

		}

		return mv;

	}

	@RequestMapping("siteYesOrNo")
	public void siteYesOrNo(HttpServletRequest request, int usid, int state){

		UserSite userSite = userSiteService.findById((Serializable) usid);

		if (state == 1) {
			userSite.setState(1);
		} else if (state == 2) {
			userSite.setState(2);
		}

		userSiteService.update(userSite);

		new UserInfoController().siteShenHe(request);
	}
	
	@RequestMapping("modifypwdByResource")
	public void modifypwdByResource(HttpServletRequest request, HttpServletResponse response,
			String yuanpwd, String newpwd){
		
		HttpSession session = request.getSession();
		
		JSONObject usersjson = new JSONObject();
		
		Boolean flag = SessionExpire.isSessionExpire(request);
		
		if(flag){
			
			String username = (String) session.getAttribute("username");
			
			String hql = "from UserInfo where username=? and password=?";
			
			List<UserInfo> users = userInfoService.findByHql(hql, username, MD5Util.makeMD5(yuanpwd));
			
			UserInfo userInfo = new UserInfo();
			
			if(users.size() <= 0){
				
				usersjson.put("code", "1");
				
				usersjson.put("message", "您输入的密码有误!");
				
			}else{
				
				for (UserInfo user : users) {
					
					if(username.equals(user.getUsername())){
						
						userInfo = user;
						
						break;						
					}					
				}
					
				userInfo.setPassword(MD5Util.makeMD5(newpwd));
				
				userInfoService.update(userInfo);
				
				session.removeAttribute("username");
				
				usersjson.put("code", "0");
				
				usersjson.put("message", "修改成功!");
					
			}			
		}
		ReturnJson.response(usersjson.toString(), response);
	}
	
	@RequestMapping("modifypwdByCode")
	public void modifypwdByCode(HttpServletRequest request, HttpServletResponse response,
			String phone, int randomCode, String forgetnewpwd){
		
		JSONObject usersjson = new JSONObject();
		
		Boolean flag = userInfoService.isUserExits(phone, phone);
		
		if(flag){
			if(randomCode == random){
				
				UserInfo userInfo = new UserInfo();
				
				String hql = "from UserInfo where phone = '" + phone + "'";
				List<UserInfo> users = userInfoService.findByHql(hql, null);
				
				userInfo = users.get(0);
				userInfo.setPassword(MD5Util.makeMD5(forgetnewpwd));
				userInfoService.update(userInfo);
				
				usersjson.put("code", "0");					
				usersjson.put("message", "修改成功!");
			}else{
				usersjson.put("code", "1");					
				usersjson.put("message", "验证码错误!");
			}
		}else{
			usersjson.put("code", "-1");				
			usersjson.put("message", "该用户未注册!");
		}		
		ReturnJson.response(usersjson.toString(), response);
	}
	
	public ModelAndView publicIndex() throws ParseException{
		
		ModelAndView mv = new ModelAndView();
		
		String activityHql = "from Activity order by aid desc";
		
		Activity activity;
		
		SimpleDateFormat sft = new SimpleDateFormat("yyyy-MM-dd");
		
		List<Activity> activities = new ArrayList<Activity>();
		
		List<Activity> activityList = activityService.queryPage(activityHql, 4, 1);
		
		String senseHql = "from CommonSense order by view desc, date desc";
		
		List<CommonSense> commonSenses = commonSenseService.queryPage(senseHql, 7, 1);
		
		if(activityList.size() > 0){
			for (int i = 0; i < activityList.size(); i++) {
				activity = new Activity();
				activity = activityList.get(i);
				if(activity.getTitle().length() > 10){
					activity.setTitle(activity.getTitle().substring(i, 10)+"...");
				}
				activity.setBeginTime(new Date(sft.parse(sft.format(activity.getBeginTime())).getTime()));
				activity.setEndTime(new Date(sft.parse(sft.format(activity.getEndTime())).getTime()));
				activities.add(activity);
			}
		}
		
		String zdyHql = "from ZhiDaoYuan order by levelNum desc";
		
		List<ZhiDaoYuan> zdys = zhiDaoYuanService.queryPage(zdyHql, 8, 1);
		
		String clubHql = "from Club order by view desc";
		
		List<Club> clubs = clubService.queryPage(clubHql, 4, 1);
		
		mv.addObject("activities", activities);
		
		mv.addObject("commonSenses", commonSenses);
		
		mv.addObject("zdys", zdys);
		
		mv.addObject("clubs", clubs);
		
		mv.setViewName("index");
		
		return mv;
		
	}

}
