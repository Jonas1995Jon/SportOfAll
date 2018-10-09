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

import com.sport.entity.Club;
import com.sport.entity.Page;
import com.sport.entity.UserClub;
import com.sport.service.ClubService;
import com.sport.service.UserClubService;
import com.sport.utils.LuanMa;
import com.sport.utils.ReturnJson;
import com.sport.utils.SessionExpire;

@Controller
@RequestMapping("zuzhi")
public class ZuzhiController {
	
	@Autowired
	@Qualifier("clubService")
	private ClubService clubService;
	
	@Autowired
	@Qualifier("userClubService")
	private UserClubService userClubService;
	
	@RequestMapping("tozuzhi")
	public ModelAndView tozuzhi(String search){
		
		String newSearch = LuanMa.luanMa(search);
		
		ModelAndView mv = new ModelAndView();
		
		String hql = "from Club order by view desc";
		
		List<Club> clubs = clubService.queryPage(hql, 3, 1);
		
		mv.addObject("search", newSearch);
		
		mv.addObject("clubs", clubs);
		
		mv.setViewName("zuzhi");
		
		return mv;
		
	}
	
	@RequestMapping("tozuzhipage")
	public void tozuzhipage(HttpServletRequest request,
			HttpServletResponse response, int curPage, String search){
		
		
		
		HttpSession session = request.getSession();
		
		int uid = 0;
		
		if(session.getAttribute("uid") != null){
			uid = (Integer) session.getAttribute("uid");
		}
		
		JSONObject clubJson = new JSONObject();
		
		JSONObject dateObj = new JSONObject();
		JSONArray dateArr = new JSONArray();
		
		JSONObject userClubObj = new JSONObject();
		JSONArray userClubArr = new JSONArray();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Page<Club> page = new Page<Club>();
		
		if(curPage <=0 ){
			curPage = page.getCurrentPageNo();
		}
		
		int pageSize = page.getPageSize();
		
		String hql = "";
		
		if (!StringUtils.isBlank(search)) {
			hql = "from Club where clubName like '%"+ search +"%' order by createTime desc";
		} else {
			hql = "from Club order by createTime desc";
		}
		
		List<Club> clubs = clubService.queryPage(hql, pageSize, curPage);
		
		if(clubs.size() <= 0){
			clubJson.put("messages", "暂无数据!");
		}else {
			clubJson.put("messages", "找到" + clubs.size() + "条记录");
			for (int i = 0; i < clubs.size(); i++) {
				String date = sdf.format(clubs.get(i).getCreateTime());
				dateObj.put("createTime", date);
				dateArr.add(dateObj);
			}
		}
		
		int totalCount = gettotalCount(hql);
		
		page.setTotalCount(totalCount);
		
		page.setTotalPageCount();
		
		page.setList(clubs);
		
		String userClubHql = "from UserClub where uid = ?";
		
		List<UserClub> userClubs = userClubService.findByHql(userClubHql, uid);
		
		if(userClubs.size() > 0 && userClubs != null){
			for (int i = 0; i < userClubs.size(); i++) {
				userClubObj.put("userClub_clubid", userClubs.get(i).getClubid());
				userClubObj.put("status", userClubs.get(i).getStatus());
				userClubArr.add(userClubObj);
			}
		}
		
		clubJson.put("code", 0);
		
		clubJson.put("page", page);
		
		clubJson.put("dates", dateArr);
		
		clubJson.put("userClubs", userClubArr);
		
		ReturnJson.response(clubJson.toString(), response);
		
	}
	
	@RequestMapping("tozuzhixq")
	public ModelAndView tozuzhiDetail(int clubid){
		
		ModelAndView mv = new ModelAndView();
		
		String hql = "from Club order by view desc";
		
		List<Club> clubs = clubService.queryPage(hql, 3, 1);
		
		Club club = clubService.findById((Serializable) clubid);
		
		mv.addObject("clubs", clubs);
		
		mv.addObject("club", club);
		
		mv.setViewName("zuzhixq");
		
		return mv;
		
	}
	
	@RequestMapping("addClub")
	public void addClub(HttpServletRequest request, HttpServletResponse response,
			int clubid, int status){
		
		HttpSession session = request.getSession();
		
		JSONObject userActivityjson = new JSONObject();
		
		Boolean flag = SessionExpire.isSessionExpire(request);
		
		if(flag){
			
			int uid = 0;
			
			if(session.getAttribute("uid") != null){
				uid = (Integer) session.getAttribute("uid");
			}
			
			if(status == 0){
				
				UserClub userActivity = new UserClub();
				
				userActivity.setUid(uid);
				userActivity.setClubid(clubid);
				userActivity.setStatus(1);
				
				userClubService.save(userActivity);
				
				userActivityjson.put("message", "成功加入俱乐部!");
				
			}else if (status == 1) {
				
				String hql = "from UserClub where clubid = ?";
				
				List<UserClub> userActivityList = userClubService.findByHql(hql, clubid);
				
				for (int i = 0; i < userActivityList.size(); i++) {
					
					userClubService.delete((Serializable) userActivityList.get(i).getUcid());
					
				}
				
				userActivityjson.put("message", "退出成功!");
				
			}
			
			userActivityjson.put("code", "0");
			
		}else {
			
			userActivityjson.put("code", "1");
			
			userActivityjson.put("message", "请先登录!");
			
		}
		
		ReturnJson.response(userActivityjson.toString(), response);
		
	}
	
	public int gettotalCount(String hql) {
		
		List<Club> clubs = new ArrayList<Club>();
		
		clubs = clubService.findByHql(hql, null);
		
		return clubs.size();
		
	}

}
