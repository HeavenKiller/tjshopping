package tjweb.control;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import tjweb.service.TKindService;

@Scope("prototype")
@Controller
public class TKindController {
	@Resource(name="tKindService")
	private TKindService tKindService;
	
	@RequestMapping("/showTKindOfKindLevelOne")
	public ModelAndView showTKindOfKindLevelOne(){
		ModelAndView mv = new ModelAndView("index");
		
		mv.addObject("tKindList", tKindService.getTKindByKindLevel(1));
		
		return mv;
 	}

	public TKindService gettKindService() {
		return tKindService;
	}

	public void settKindService(TKindService tKindService) {
		this.tKindService = tKindService;
	}
	
	
}
