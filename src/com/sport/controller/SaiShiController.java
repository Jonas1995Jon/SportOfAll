package com.sport.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sport.entity.Activity;
import com.sport.service.ActivityService;

@Controller
@RequestMapping("saishi")
public class SaiShiController {
	
	@Autowired
	@Qualifier("activityService")
	private ActivityService activityService;
	
	@RequestMapping("tosaishi")
	public ModelAndView tosaishi() throws ParseException{
		
		ModelAndView mv = new ModelAndView();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		String currentTime = sdf.format(new java.util.Date());
		
		String hql = "from Activity where endTime > " + currentTime + " order by beginTime desc";
		
		List<Activity> activities = activityService.queryPage(hql, 2, 1);
		
		for (int i = 0; i < activities.size(); i++) {
			String beginTime = sdf.format(activities.get(i).getBeginTime());
			String endTime = sdf.format(activities.get(i).getEndTime());
			activities.get(i).setBeginTime(new Date(sdf.parse(beginTime).getTime()));
			activities.get(i).setEndTime(new Date(sdf.parse(endTime).getTime()));
		}
		
		mv.addObject("activities", activities);
		
		mv.setViewName("saishi");
		
		return mv;
		
	}
	
	

}
