package com.sport.controller;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sport.entity.Activity;
import com.sport.entity.Page;
import com.sport.entity.Menus;
import com.sport.entity.UserActivity;
import com.sport.entity.UserInfo;
import com.sport.service.ActivityService;
import com.sport.service.SaiShiMenuService;
import com.sport.service.UserActivityService;
import com.sport.service.UserInfoService;
import com.sport.utils.LuanMa;
import com.sport.utils.ReturnJson;
import com.sport.utils.SessionExpire;

@Controller
@RequestMapping("huodong")
public class ActivityController {
	
	@Autowired
	@Qualifier("userInfoService")
	private UserInfoService userInfoService;
	
	@Autowired
	@Qualifier("activityService")
	private ActivityService activityService;
	
	@Autowired
	@Qualifier("userActivityService")
	private UserActivityService userActivityService;
	
	@Autowired
	@Qualifier("saiShiMenuService")
	private SaiShiMenuService saiShiMenuService;
	
	@RequestMapping("tohuodong")
	public ModelAndView tohuodong(String search){
		
		String newSearch = LuanMa.luanMa(search);
		
		ModelAndView mv = new ModelAndView();
		
		String hql = "from Activity order by beginTime desc";
		
		List<Activity> activities = activityService.queryPage(hql, 2, 1);
		
		mv.addObject("search", newSearch);
		
		mv.addObject("activities", activities);
		
		mv.setViewName("huodong");
		
		return mv;
		
	}
	
	/**
	 * 显示所有活动信息
	 * @param request
	 * @param response
	 * @param curPage
	 */
	@RequestMapping("tohuodongpage")
	public void tohuodongpage(HttpServletRequest request, HttpServletResponse response,
			int curPage, String  menuName1, String  menuName2, String  menuName3,
			String search){
		
		HttpSession session = request.getSession();
		
		JSONObject activityjson = new JSONObject();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		List<Menus> MenuList = new ArrayList<Menus>();
		List<Menus> menuLevel1 = new ArrayList<Menus>();
		List<Menus> menuLevel2 = new ArrayList<Menus>();
		List<Menus> menuLevel3 = new ArrayList<Menus>();
		
		List<Activity> activityList = new ArrayList<Activity>();
		
		List<UserActivity> userActivityList = new ArrayList<UserActivity>();		
		JSONObject userActivityObj = new JSONObject();		
		JSONArray userActivityArr = new JSONArray();
		
		JSONObject dateObj = new JSONObject();
		JSONArray dateArr = new JSONArray();
		
		Page<Activity> page = new Page<Activity>();
		
		int uid = 0;
		
		if(session.getAttribute("uid") != null){
			uid = (Integer) session.getAttribute("uid");
		}
		
		String MenuHQL = "from Menus";
		
		MenuList = saiShiMenuService.findByHql(MenuHQL, null);
		
		for (int i = 0; i < MenuList.size(); i++) {
			if(MenuList.get(i).getMenuLevel() == 1){
				menuLevel1.add(MenuList.get(i));
			}else if (MenuList.get(i).getMenuLevel() == 2) {
				menuLevel2.add(MenuList.get(i));
			}else if (MenuList.get(i).getMenuLevel() == 3) {
				menuLevel3.add(MenuList.get(i));
			}
		}
		
		activityjson.put("menuLevel1", menuLevel1);
		activityjson.put("menuLevel2", menuLevel2);
		activityjson.put("menuLevel3", menuLevel3);
		
		UserInfo userInfo = userInfoService.findById((Serializable) uid);
		
		if(userInfo != null){
			activityjson.put("radio", userInfo.getRadio());
			activityjson.put("uid", userInfo.getUid());
		}
		
		String userActivityHQL = "from UserActivity where uid = ?";
		
		userActivityList = userActivityService.findByHql(userActivityHQL, uid);
		
		if(userActivityList != null){
			for (int i = 0; i < userActivityList.size(); i++) {
				userActivityObj.put("userActivity_aid", userActivityList.get(i).getAid());
				userActivityObj.put("status", userActivityList.get(i).getStatus());
				userActivityArr.add(userActivityObj);
			}
		}
		
		if(curPage < 1){
			
			curPage = 1;
		}
		
		int pageSize = page.getPageSize();
		
		String activityHQL = "";
		
		if(!StringUtils.isBlank(menuName1) && !StringUtils.isBlank(menuName2) && !StringUtils.isBlank(menuName3)){
			if("全部".equals(menuName1) && "全部".equals(menuName2) && "全部".equals(menuName3)){
				activityHQL = "from Activity order by beginTime desc";
			}else if ("已结束".equals(menuName3)) {
				activityHQL = "from Activity where status = '" + 1 + "'" + " order by beginTime desc";
			}else{
				activityHQL = "from Activity where menuName = '" + menuName1 + "'" + " order by beginTime desc";
			}
		}else if (!StringUtils.isBlank(search)) {
			activityHQL = "from Activity where title like '%"+ search +"%' order by beginTime desc";
		}else {
			activityHQL = "from Activity order by beginTime desc";
		}
		
		int totalCount = activityService.findByHql(activityHQL, null).size();
		
		activityList = activityService.queryPage(activityHQL, pageSize, curPage);
		
		page.setTotalCount(totalCount);
		
		page.setTotalPageCount();
		
		String beginTime = "";
		
		String endTime = "";
		
		for(int i=0; i<activityList.size(); i++){
			beginTime = sdf.format(activityList.get(i).getBeginTime());
			endTime = sdf.format(activityList.get(i).getEndTime());
			dateObj.put("beginTime", beginTime);
			dateObj.put("endTime", endTime);
			dateArr.add(dateObj);
		}
		
		page.setList(activityList);
		
		activityjson.put("code", "0");
		
		activityjson.put("message", "查询成功!");

		activityjson.put("userActivityjson", userActivityArr);
		
		activityjson.put("datejson", dateArr);
		
		activityjson.put("page", page);
			
		ReturnJson.response(activityjson.toString(), response);
		
	}
	
	/**
	 * 跳转到活动详情页面
	 * @param aid
	 * @return
	 */
	@RequestMapping("tohuodongxq")
	public ModelAndView tohdDetail(int aid){
		
		ModelAndView mv = new ModelAndView();
		
		if(aid > 0){
			
			Activity activity = activityService.findById((Serializable) aid);
			
			activity.setView(activity.getView()+1);
			
			activityService.update(activity);
			
			mv.addObject("activity", activity);
			
		}
		
		mv.setViewName("huodongxq");
		
		return mv;
		
	}
	
	public int gettotalCount() {
		
		String hql = "from Activity";
		
		List<Activity> activities = new ArrayList<Activity>();
		
		activities = activityService.findByHql(hql, null);
		
		return activities.size();
		
	}
	
	/**
	 * 活动报名
	 * @param request
	 * @param response
	 * @param aid
	 */
	@RequestMapping("signUp")
	public void signUp(HttpServletRequest request, HttpServletResponse response,
			int aid, int status){
		
		HttpSession session = request.getSession();
		
		JSONObject userActivityjson = new JSONObject();
		
		Boolean flag = SessionExpire.isSessionExpire(request);
		
		if(flag){
			
			int uid = 0;
			
			if(session.getAttribute("uid") != null){
				uid = (Integer) session.getAttribute("uid");
			}

			String userHql = "from UserInfo where uid = ?";

			List<UserInfo> userInfo = userInfoService.findByHql(userHql, uid);

			UserInfo info = new UserInfo();

			for (UserInfo user : userInfo) {
				info = user;
				break;
			}

			if (info.getRadio() == 0) {
				if(status == 0){

					UserActivity userActivity = new UserActivity();

					userActivity.setUid(uid);
					userActivity.setAid(aid);
					userActivity.setStatus(1);

					userActivityService.save(userActivity);

					userActivityjson.put("message", "报名成功!");

				}else if (status == 1) {

					String hql = "from UserActivity where aid = ?";

					List<UserActivity> userActivityList = userActivityService.findByHql(hql, aid);

					for (int i = 0; i < userActivityList.size(); i++) {

						userActivityService.delete((Serializable) userActivityList.get(i).getUaid());

					}

					userActivityjson.put("message", "取消成功!");

				}
			} else if (info.getRadio() == 1) {
				userActivityjson.put("message", "管理员不能操作");
			}

			userActivityjson.put("code", "0");
			
		}else {
			
			userActivityjson.put("code", "1");
			
			userActivityjson.put("message", "请先登录!");
			
		}
		
		ReturnJson.response(userActivityjson.toString(), response);
		
	}

}
