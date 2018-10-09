package com.sport.controller;

import java.io.Serializable;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sport.entity.Page;
import com.sport.entity.Menus;
import com.sport.entity.ZhiDaoYuan;
import com.sport.service.SaiShiMenuService;
import com.sport.service.ZhiDaoYuanService;
import com.sport.utils.LuanMa;
import com.sport.utils.ReturnJson;

@Controller
@RequestMapping("zhidaoyuan")
public class ZhiDaoYuanController {
	
	@Autowired
	@Qualifier("saiShiMenuService")
	private SaiShiMenuService saiShiMenuService;
	
	@Autowired
	@Qualifier("zhiDaoYuanService")
	private ZhiDaoYuanService zhiDaoYuanService;
	
	@RequestMapping("tozhidaoyuan")
	public ModelAndView tozdy(String search){
		
		String newSearch = LuanMa.luanMa(search);
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("search", newSearch);
		
		mv.setViewName("zhidaoyuan");
		
		return mv;
		
	}
	
	@RequestMapping("tozdypage")
	public void tozdypage(HttpServletResponse response,
			int curPage, String menuName, String search){
		
		Page<ZhiDaoYuan> page = new Page<ZhiDaoYuan>();
		
		if(curPage <= 0){
			curPage = page.getCurrentPageNo();
		}
		
		int pageSize = 8;
		
		page.setPageSize(pageSize);
		
		JSONObject menuObj = new JSONObject();
		
		String MenuHql = "from Menus";
		
		List<Menus> saiShiMenus = saiShiMenuService.findByHql(MenuHql, null);
		
		String zhiDaoYuanHql = "";
		
		if (!StringUtils.isBlank(search)) {
			zhiDaoYuanHql = "from ZhiDaoYuan where name like '%" + search  + "%' order by levelNum desc";
		}else if(!StringUtils.isBlank(menuName)){
			if("全部".equals(menuName)){
				zhiDaoYuanHql = "from ZhiDaoYuan";
			}else {
				zhiDaoYuanHql = "from ZhiDaoYuan where menuName = '" + menuName + "' order by levelNum desc";
			}
		}else {
			zhiDaoYuanHql = "from ZhiDaoYuan";
		}
		
		List<ZhiDaoYuan> totalCount = zhiDaoYuanService.findByHql(zhiDaoYuanHql, null);
		
		List<ZhiDaoYuan> zhiDaoYuans = zhiDaoYuanService.queryPage(zhiDaoYuanHql, pageSize, curPage);
		
		page.setTotalCount(totalCount.size());
		
		page.setTotalPageCount();
		
		page.setList(zhiDaoYuans);
		
		menuObj.put("code", 0);
		
		menuObj.put("saiShiMenus", saiShiMenus);
		
		menuObj.put("page", page);
		
		ReturnJson.response(menuObj.toString(), response);
		
	}
	
	@RequestMapping("tozhidaoyuanxq")
	public ModelAndView tozdyDetail(int zid){
		
		ModelAndView mv = new ModelAndView();
		
		String hql = "from ZhiDaoYuan order by levelNum desc";
		
		List<ZhiDaoYuan> zdys = zhiDaoYuanService.queryPage(hql, 3, 1);
		
		ZhiDaoYuan zhiDaoYuan = zhiDaoYuanService.findById((Serializable) zid);
		
		mv.addObject("zdys", zdys);
		
		mv.addObject("zhiDaoYuan", zhiDaoYuan);
		
		mv.setViewName("zhidaoyuanxq");
		
		return mv;
		
	}

}
