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
import com.sport.entity.Menus;
import com.sport.entity.Page;
import com.sport.entity.Site;
import com.sport.entity.UserActivity;
import com.sport.entity.UserInfo;
import com.sport.entity.UserSite;
import com.sport.service.SaiShiMenuService;
import com.sport.service.SiteService;
import com.sport.service.UserSiteService;
import com.sport.utils.ReturnJson;
import com.sport.utils.SessionExpire;

@Controller
@RequestMapping("sheshi")
public class SheShiController {
	
	@Autowired
	@Qualifier("siteService")
	private SiteService siteService;
	
	@Autowired
	@Qualifier("userSiteService")
	private UserSiteService userSiteService;
	
	@Autowired
	@Qualifier("saiShiMenuService")
	private SaiShiMenuService saiShiMenuService;
	
	@RequestMapping("tosheshi")
	public ModelAndView sheshi(){
		
		ModelAndView mv = new ModelAndView();
		
		String hql = "from Site order by price";
		
		List<Site> sites = siteService.queryPage(hql, 1, 1);
		
		mv.addObject("sites", sites);
		
		mv.setViewName("sheshi");
		
		return mv;
		
	}
	
	@RequestMapping("tosheshipage")
	public void tosheshipage(HttpServletRequest request, HttpServletResponse response,
			int curPage, String  menuName1, String  menuName2, String  menuName3){
		
		HttpSession session = request.getSession();
		
		JSONObject activityjson = new JSONObject();
		
		List<Menus> MenuList = new ArrayList<Menus>();
		List<Menus> menuLevel1 = new ArrayList<Menus>();
		List<Menus> menuLevel2 = new ArrayList<Menus>();
		List<Menus> menuLevel3 = new ArrayList<Menus>();
		
		List<Site> siteList = new ArrayList<Site>();
		
		List<UserSite> userSiteList = new ArrayList<UserSite>();		
		JSONObject userSiteObj = new JSONObject();		
		JSONArray userSiteArr = new JSONArray();
		
		Page<Site> page = new Page<Site>();
		
		int uid = 0;
		
		if(session.getAttribute("uid") != null){
			uid = (Integer) session.getAttribute("uid");
		}
		
		String MenuHQL = "from Menus";
		
		MenuList = saiShiMenuService.findByHql(MenuHQL, null);
		
		for (int i = 0; i < MenuList.size(); i++) {
			if(MenuList.get(i).getMenuLevel() == 1){
				menuLevel1.add(MenuList.get(i));
			}else if (MenuList.get(i).getMenuLevel() == 4) {
				menuLevel2.add(MenuList.get(i));
			}else if (MenuList.get(i).getMenuLevel() == 5) {
				menuLevel3.add(MenuList.get(i));
			}
		}
		
		activityjson.put("menuLevel1", menuLevel1);
		activityjson.put("menuLevel2", menuLevel2);
		activityjson.put("menuLevel3", menuLevel3);
		
		String userSiteHQL = "from UserSite where uid = ?";
		
		userSiteList = userSiteService.findByHql(userSiteHQL, uid);
		
		if(userSiteList != null){
			for (int i = 0; i < userSiteList.size(); i++) {
				userSiteObj.put("userSite_sid", userSiteList.get(i).getSid());
				userSiteObj.put("status", userSiteList.get(i).getStatus());
				userSiteArr.add(userSiteObj);
			}
		}
		
		if(curPage < 1){
			
			curPage = 1;
		}
		
		int pageSize = page.getPageSize();
		
		String siteHQL = "";
		
		if(!StringUtils.isBlank(menuName1) && !StringUtils.isBlank(menuName2) && !StringUtils.isBlank(menuName3)){
			if("全部".equals(menuName1) && "全部".equals(menuName2) && "全部".equals(menuName3)){
				siteHQL = "from Site order by price";
			}else if (!"全部".equals(menuName2)) {
				siteHQL = "from Site where region = '" + menuName2 + "'" + " order by price";
			}else if ("免费".equals(menuName3)) {
				siteHQL = "from Site where price = '" + 0 + "'" + " order by price";
			}else if ("收费".equals(menuName3)) {
				siteHQL = "from Site where price != '" + 0 + "'" + " order by price";
			}else{
				siteHQL = "from Site where menuName = '" + menuName1 + "'" + " order by price";
			}
		}else {
			siteHQL = "from Site order by price desc";
		}
		
		int totalCount = siteService.findByHql(siteHQL, null).size();
		
		siteList = siteService.queryPage(siteHQL, pageSize, curPage);
		
		page.setTotalCount(totalCount);
		
		page.setTotalPageCount();
		
		page.setList(siteList);
		
		activityjson.put("code", "0");
		
		activityjson.put("message", "查询成功!");

		activityjson.put("userSitejson", userSiteArr);
		
		activityjson.put("page", page);
			
		ReturnJson.response(activityjson.toString(), response);
		
	}
	
	@RequestMapping("tosheshixq")
	public ModelAndView sheshiDetail(int sid){
		
		ModelAndView mv = new ModelAndView();
		
		Site site = siteService.findById((Serializable) sid);
		
		mv.addObject("site", site);
		
		mv.setViewName("sheshixq");
		
		return mv;
		
	}
	
	/**
	 * 预定场馆
	 * @param request
	 * @param response
	 * @param aid
	 */
	@RequestMapping("signUp")
	public void signUp(HttpServletRequest request, HttpServletResponse response,
			int sid, int status){
		
		HttpSession session = request.getSession();
		
		JSONObject userSitejson = new JSONObject();
		
		Boolean flag = SessionExpire.isSessionExpire(request);
		
		if(flag){
			
			int uid = 0;
			
			if(session.getAttribute("uid") != null){
				uid = (Integer) session.getAttribute("uid");
			}
			
			if(status == 0){
				
				UserSite userSite = new UserSite();
				
				userSite.setUid(uid);
				userSite.setSid(sid);
				userSite.setStatus(1);
				
				userSiteService.save(userSite);
				
				userSitejson.put("message", "预定成功!");
				
			}else if (status == 1) {
				
				String hql = "from UserSite where sid = ?";
				
				List<UserSite> userSiteList = userSiteService.findByHql(hql, sid);
				
				for (int i = 0; i < userSiteList.size(); i++) {
					
					userSiteService.delete((Serializable) userSiteList.get(i).getUsid());
					
				}
				
				userSitejson.put("message", "取消成功!");
				
			}
			
			userSitejson.put("code", "0");
			
		}else {
			
			userSitejson.put("code", "1");
			
			userSitejson.put("message", "请先登录!");
			
		}
		
		ReturnJson.response(userSitejson.toString(), response);
		
	}

}
