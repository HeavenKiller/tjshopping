package tjweb.control;


import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.MvcNamespaceHandler;

import tjweb.model.Page;
import tjweb.model.TBaol;
import tjweb.model.TKind;
import tjweb.model.TMall;
import tjweb.service.TBaolService;
import tjweb.service.TKindService;
import tjweb.service.TMallService;

/** 
 * 	Scope：表示实例是原型，这样会对每一个请求实例化，保证线程安全 Spring中使用 Controller注解表示该类是控制器 
 * 	Repository注解Dao访问类;
 *  Service注解业务逻辑处理类;
 *	Resource注解表示使用某个bean资源 
 * RequestMapping：表示对该类所有方法的请求URL，前面必须接上/user，如/user/login 表示对login方法的请求访问 
 */ 

@Scope("prototype")
@Controller
public class IndexController {
	@Resource
	private TKindService tKindService;
	@Resource
	private TMallService tMallService;
	@Resource
	private TBaolService tBaolService;
	
	@RequestMapping(value="index")
	public ModelAndView showIndex(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("index");
		
		mv.addObject("tKindLevelOneList", tKindService.getTKindByKindLevel(1));
		mv.addObject("tKindLevelTwoList", tKindService.getTKindByKindLevel(2));
		mv.addObject("tNewBaolList", tBaolService.getNewTBaolIsInTime());
		
		return mv;
 	}
	
	@RequestMapping(value="pbaol")
	public ModelAndView showPbaol(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("pbaol");
		
		mv.addObject("tKindLevelOneList", tKindService.getTKindByKindLevel(1));
		mv.addObject("tKindLevelTwoList", tKindService.getTKindByKindLevel(2));
		mv.addObject("tKindLevelThreeList", tKindService.getTKindByKindLevel(3));
		mv.addObject("tMallList", tMallService.getTMalls());
		
		return mv;
 	}
	
	@RequestMapping(value="pxianz")
	public ModelAndView showPxianz(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("pxianz");
		
		mv.addObject("tKindLevelOneList", tKindService.getTKindByKindLevel(1));
		mv.addObject("tKindLevelTwoList", tKindService.getTKindByKindLevel(2));
		mv.addObject("tKindLevelThreeList", tKindService.getTKindByKindLevel(3));
		
		return mv;
 	}
	
	@RequestMapping(value="showArt")
	public ModelAndView showArt(@RequestParam("info") String info, @RequestParam("pageNow") Integer pageNow,
			HttpServletRequest request){
		ModelAndView mv = new ModelAndView("showArt");
		
		Page page = new Page();
		int pageSize = 3;
		int rowCount = 0;
		int pageCount = 0;
		int num = 0;
		
		page.setPageSize(pageSize);
		page.setPageNow(pageNow);
		
		List<TBaol> tBaolList = new ArrayList<>(); 
		
		List<TKind> tKindList = tKindService.getAllKinds();
		List<TKind> tKindLevelOneList = tKindService.getTKindByKindLevel(1);
		List<TMall> tMallList = tMallService.getTMalls();
		
		if ("精选".equals(info)) {	//精选
			tBaolList = tBaolService.getNewTBaolIsInTime();
		}else {
			if ("爆料".equals(info)) {	//爆料
				rowCount = tBaolService.getRowCountByBtgShenhe(1);
				tBaolList = tBaolService.getTBaolListByPageAndBtgShenhe(page, 1);
			}else {
				if ("发现".equals(info)) {
					rowCount = tBaolService.getRowCountByBtgShenhe(1);
					tBaolList =tBaolService.getTBaolListByPageAndBtgShenheBelow(page, 1);
				}else {
					for (TKind tKind : tKindList) {
						if (info.equals(tKind.getKindName())) {
							rowCount = tBaolService.getRowCountByKindIdAndBtgShenhe(tKind.getKindId(), 1);
							tBaolList = tBaolService.getTBaolsByPageAndKindIdAndBtgShenhe(page, tKind.getKindId(), 1);
							num++;
							break;
						}
					}
					
					if (num == 0) {
						for (TMall tMall : tMallList) {
							if (info.equals(tMall.getMallName())) {
								rowCount = tBaolService.getRowCountByMallIdAndBtgShenhe(tMall.getMallId(), 1);
								tBaolList = tBaolService.getTBaolsByPageAndMallIdAndBtgShenhe(page, tMall.getMallId(), 1);
								num++;
								break;
							}
						}
					}
					
					if (num == 0) {
						rowCount = tBaolService.getRowCountByKeyAndBtgShenhe(info, 1);
						tBaolList = tBaolService.getTBaolListByKeyAndBtgShenhe(page, info, 1);
					}
				}
			}
			
		}
		
		
		
		pageCount = (rowCount-1)/pageSize+1;
		page.setPageCount(pageCount);
		page.setPageNow(rowCount);
		
		mv.addObject("info", info);
		mv.addObject("pageCount", pageCount);
		mv.addObject("pageNow", pageNow);
		mv.addObject("rowCount", rowCount);
		mv.addObject("tKindList", tKindList);
		mv.addObject("tKindLevelOneList", tKindLevelOneList);
		mv.addObject("tMallList", tMallList);
		mv.addObject("tBaolList", tBaolList);
		
		return mv;
	}
	
	
}
