package com.sport.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sport.entity.HotSearch;
import com.sport.service.HotSearchService;
import com.sport.utils.ReturnJson;

@Controller
@RequestMapping("hot")
public class HotSearchController {
	
	@Autowired
	@Qualifier("hotSearchService")
	private HotSearchService hotSearchService;
	
	@RequestMapping("hotsearch")
	public void hotsearch(HttpServletResponse response){
		
		String hql = "from HotSearch";
		
		List<HotSearch> hotlist = new ArrayList<HotSearch>();
		
		JSONArray hotsearjson = new JSONArray();
		
		JSONObject hotsearObj = new JSONObject();
		
		try {
			
			hotlist = hotSearchService.queryPage(hql, 5, 1);
			
			JSONObject json = new JSONObject();
			
			if(hotlist.size() != 0){
				for (int i=0; i<hotlist.size(); i++) {
					json.put("sid", hotlist.get(i).getSid());
					json.put("sname", hotlist.get(i).getSname());
					json.put("count", hotlist.get(i).getCount());
					hotsearjson.add(json);
				}
				
				hotsearObj.put("hotsjson", hotsearjson);
				hotsearObj.put("code", "0");
				hotsearObj.put("message", "header加载成功!");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		ReturnJson.response(hotsearObj.toString(), response);
		
	}

}
