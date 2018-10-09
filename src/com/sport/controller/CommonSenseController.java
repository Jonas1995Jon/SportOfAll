package com.sport.controller;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sport.entity.CommonSense;
import com.sport.entity.Page;
import com.sport.service.CommonSenseService;
import com.sport.utils.ReturnJson;

@Controller
@RequestMapping("sense")
public class CommonSenseController {
	
	@Autowired
	@Qualifier("commonSenseService")
	private CommonSenseService commonSenseService;
	
	@RequestMapping("tocommonsense")
	public ModelAndView tocommonsense(){
		
		ModelAndView mv = new ModelAndView();
		
		/*String hql = "from CommonSense order by cid desc";
		
		List<CommonSense> commonSenses = commonSenseService.findByHql(hql, null);
		
		mv.addObject("commonSenses", commonSenses);*/
		
		mv.setViewName("changshi");
		
		return mv;
		
	}
	
	@RequestMapping("tocommonsensepage")
	public void tocommonsensepage(HttpServletResponse response,
			int curPage){
		
		SimpleDateFormat sft = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		Page<CommonSense> page = new Page<CommonSense>();
		
		if(curPage <= 0){
			curPage = page.getCurrentPageNo();
		}else {
			page.setCurrentPageNo(curPage);
		}
		
		int pageSize = page.getPageSize();
		
		if(curPage > 1){
			page.setPrePageNo();
		}
		
		page.setTotalCount(gettotalCount());
		
		page.setTotalPageCount();
		
		if(curPage > 0 && curPage < page.getTotalPageCount()){
			page.setNextPageNo();
		}
		
		JSONObject commonSensesJson = new JSONObject();
		
		JSONObject dateObj = new JSONObject();
		JSONArray dateArr = new JSONArray();
		
		String hql = "from CommonSense order by view desc, date desc";
		
		List<CommonSense> commonSenseList = commonSenseService.queryPage(hql, pageSize, curPage);
		
		if(commonSenseList.size() > 0){
			commonSensesJson.put("code", 0);
			commonSensesJson.put("message", "查询成功!");
		}else {
			commonSensesJson.put("code", 1);
			commonSensesJson.put("message", "暂无数据!");
		}
		
		String date = "";
		
		for (int i = 0; i < commonSenseList.size(); i++) {
			date = sft.format(commonSenseList.get(i).getDate());
			dateObj.put("date", date);
			dateArr.add(dateObj);
		}
		
		commonSensesJson.put("dates", dateArr);
		
		page.setList(commonSenseList);
		
		commonSensesJson.put("page", page);
		
		ReturnJson.response(commonSensesJson.toString(), response);
	} 
	
	@RequestMapping("tocommonsensexq")
	public ModelAndView tocommonsensexq(int cid){
		
		ModelAndView mv = new ModelAndView();
		
		CommonSense commonSense = commonSenseService.findById((Serializable) cid);
		
		commonSense.setView(commonSense.getView()+1);
		
		commonSenseService.update(commonSense);
		
		mv.addObject("commonSense", commonSense);
		
		mv.setViewName("changshixq");
		
		return mv;
		
	}
	
	public int gettotalCount() {
		
		String hql = "from CommonSense";
		
		List<CommonSense> commonSenses = new ArrayList<CommonSense>();
		
		commonSenses = commonSenseService.findByHql(hql, null);
		
		return commonSenses.size();
		
	}

}
