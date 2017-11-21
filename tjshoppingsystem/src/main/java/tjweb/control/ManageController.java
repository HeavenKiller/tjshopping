package tjweb.control;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import tjweb.model.Page;
import tjweb.model.TBaol;
import tjweb.model.TComm;
import tjweb.model.TJub;
import tjweb.model.TPunish;
import tjweb.model.TUser;
import tjweb.model.TUserInfo;
import tjweb.model.TXianz;
import tjweb.service.TAgreeService;
import tjweb.service.TBaolService;
import tjweb.service.TCommService;
import tjweb.service.TJubService;
import tjweb.service.TKindService;
import tjweb.service.TPunishService;
import tjweb.service.TShoucService;
import tjweb.service.TUserInfoService;
import tjweb.service.TUserService;
import tjweb.service.TXianzService;

/** 
 * 	Scope：表示实例是原型，这样会对每一个请求实例化，保证线程安全 Spring中使用 Controller注解表示该类是控制器 
 * 	Repository注解Dao访问类;
 *  Service注解业务逻辑处理类;
 *	Resource注解表示使用某个bean资源 
 * RequestMapping：表示对该类所有方法的请求URL，前面必须接上/user，如/user/login 表示对login方法的请求访问 
 */ 
@Scope("prototype")
@Controller
public class ManageController {
	@Resource
	private TUserService tUserService;
	@Resource
	private TUserInfoService tUserInfoService;
	@Resource
	private TBaolService tBaolService;
	@Resource
	private TKindService tKindService;
	@Resource
	private TJubService tJubService;
	@Resource
	private TAgreeService tAgreeService;
	@Resource
	private TShoucService tShoucService;
	@Resource
	private TCommService tCommService;
	@Resource
	private TXianzService tXianzService;
	@Resource
	private TPunishService tPunishService;
	
	/* 展示信息 */
	@RequestMapping(value="manage")
	public ModelAndView manage(@RequestParam("artKindId") Integer artKindId,
			@RequestParam("pageNow") Integer pageNow) {
		ModelAndView mv = new ModelAndView("manage");
		Page page = new Page();
		int pageSize = 2;
		int rowCount = 0;
		int pageCount = 0;
		
		System.out.println(pageNow);
//		if(pageNow.intValue() < 0){
//			System.out.println("11111111111111");
//			pageNow = 1;
//		}
		
		page.setPageSize(pageSize);
		page.setPageNow(pageNow);
		
		List<TBaol> tBaolsPage = new ArrayList<>();
		List<TXianz> tXianzsPage = new ArrayList<>();
		List<TJub> tJubsPage = new ArrayList<>();
		List<TUser> tUsersPage = new ArrayList<>();
		List<TPunish> tPunishsPage = new ArrayList<>();
		Map<Object, Object> tJubFor = new HashMap<Object, Object>();
		Map<Object, Object> tPunishForUser = new HashMap<Object, Object>();
		
		switch (artKindId) {
			case 1://用户
			
			break;
			case 11://	审核员
				rowCount = tUserService.getRowCountByUserLevel(1);
				tUsersPage = tUserService.getTUserListByPageAndUserLevel(page, 1);
				mv.addObject("tUsersPage", tUsersPage);
				break;
			case 12://	用户
				rowCount = tUserService.getRowCountByUserLevel(2);
				tUsersPage = tUserService.getTUserListByPageAndUserLevel(page, 2);
				mv.addObject("tUsersPage", tUsersPage);
				break;
			case 13://	惩罚信息查看
				rowCount = tPunishService.getRowCountOfAllTPunishs();
				tPunishsPage = tPunishService.getTPunishListByPage(page);
				
				for (TPunish tPunish : tPunishsPage) {
					TUser tUser = tUserService.getTUserByUserId(tPunish.getUserId());
					tPunishForUser.put(tPunish.getPunishId(), tUser);
				}
				mv.addObject("tPunishsPage", tPunishsPage);
				mv.addObject("tPunishForUser", tPunishForUser);
				break;
				
			case 2://爆料
				
				break;

			case 21://	审核爆料
				rowCount = tBaolService.getRowCountByBtgShenhe(0);
				tBaolsPage = tBaolService.getTBaolListByPageAndBtgShenhe(page, 0);
				mv.addObject("tBaolsPage", tBaolsPage);
				break;
			case 22://	查看爆料
				rowCount = tBaolService.getRowCountOfAllTBaols();
				tBaolsPage = tBaolService.getTBaolsByPage(page);
				mv.addObject("tBaolsPage", tBaolsPage);
				break;
			case 23://	查看不通过的爆料
				rowCount = tBaolService.getRowCountByBtgShenhe(2);
				tBaolsPage = tBaolService.getTBaolListByPageAndBtgShenhe(page, 2);
				mv.addObject("tBaolsPage", tBaolsPage);
				break;
			case 24://	查看被惩罚的爆料0:正在审核；1：通过审核2：没通过3：被惩罚
				rowCount = tBaolService.getRowCountByBtgShenhe(3);
				tBaolsPage = tBaolService.getTBaolListByPageAndBtgShenhe(page, 3);
				mv.addObject("tBaolsPage", tBaolsPage);
				break;
				
			case 3://闲置
				
				break;
			case 31://	审核闲置
				rowCount = tXianzService.getRowCountByXtgShenhe(0);
				tXianzsPage = tXianzService.getTXianzListByPageAndXtgShenhe(page, 0);
				mv.addObject("tXianzsPage", tXianzsPage);
				break;
			case 32://	查看闲置
				rowCount = tXianzService.getRowCountOfAllTXianzs();
				tXianzsPage = tXianzService.getTXianzsByPage(page);
				mv.addObject("tXianzsPage", tXianzsPage);
				break;
			case 33://	查看不通过的闲置
				rowCount = tXianzService.getRowCountByXtgShenhe(2);
				tXianzsPage = tXianzService.getTXianzListByPageAndXtgShenhe(page, 2);
				mv.addObject("tXianzsPage", tXianzsPage);
				break;
			case 34://	查看被惩罚的闲置
				rowCount = tXianzService.getRowCountByXtgShenhe(3);
				tXianzsPage = tXianzService.getTXianzListByPageAndXtgShenhe(page, 3);
				mv.addObject("tXianzsPage", tXianzsPage);
				break;
			case 4://举报
				
				break;
			case 41://	审核举报
				rowCount = tJubService.getRowCountByJtgShenhe(0);
				tJubsPage = tJubService.getTJubListByPageAndXtgShenhe(page, 0);
				for (TJub tJub : tJubsPage) {
					switch (tJub.getJubKindId()) {
					case 2://爆料
						TBaol tBaol = tBaolService.getTBaolListByBaolId(tJub.getJubInfoId());
						tJubFor.put(tJub.getJubId(), tBaol);
						break;
					case 3://闲置
						TXianz tXianz = tXianzService.getTXianzByXianzId(tJub.getJubInfoId());
						tJubFor.put(tJub.getJubId(), tXianz);
						break;
					case 4://评论
						TComm tComm = tCommService.getTCommByCommId(tJub.getJubInfoId());
						tJubFor.put(tJub.getJubId(), tComm);
						break;
					default:
						break;
					}
				}
				mv.addObject("tJubFor", tJubFor);
				mv.addObject("tJubsPage", tJubsPage);
				break;
			case 42:// 举报不通过	
				rowCount = tJubService.getRowCountByJtgShenhe(2);
				tJubsPage = tJubService.getTJubListByPageAndXtgShenhe(page, 2);
				for (TJub tJub : tJubsPage) {
					switch (tJub.getJubKindId()) {
					case 2://爆料
						TBaol tBaol = tBaolService.getTBaolListByBaolId(tJub.getJubInfoId());
						tJubFor.put(tJub.getJubId(), tBaol);
						break;
					case 3://闲置
						TXianz tXianz = tXianzService.getTXianzByXianzId(tJub.getJubInfoId());
						tJubFor.put(tJub.getJubId(), tXianz);
						break;
					case 4://评论
						TComm tComm = tCommService.getTCommByCommId(tJub.getJubInfoId());
						tJubFor.put(tJub.getJubId(), tComm);
						break;
					default:
						break;
					}
				}
				mv.addObject("tJubFor", tJubFor);
				mv.addObject("tJubsPage", tJubsPage);
				break;
			default:
			break;
		}
		pageCount = (rowCount-1)/pageSize+1;
		System.out.println("pageNow"+pageNow+";rowCount:"+rowCount);
		
		mv.addObject("pageCount", pageCount);
		mv.addObject("pageNow", pageNow);
		mv.addObject("rowCount", rowCount);
		mv.addObject("artKindId", artKindId);
		
		return mv;
	}
	
	@RequestMapping(value="setBtgReasonByArtKindIdAndArtId")
	@ResponseBody
	public boolean setBtgReasonByArtKindIdAndArtId(@RequestParam("artKindId")Integer artKindId, 
			@RequestParam("artId") Integer artId, @RequestParam("status") Integer status, 
			@RequestParam("BtgReason") String BtgReason) {
		boolean flag = false;
		TUserInfo tUserInfo = new TUserInfo();
		
		switch (artKindId) {
		case 21://爆料
			TBaol tBaol = tBaolService.getTBaolListByBaolId(artId);
			tUserInfo = tUserInfoService.getTUserInfoByUserId(tBaol.getUserId());
			if (status.intValue() == 1) {
				tUserInfo.setBaolNum(tUserInfo.getBaolNum().intValue()+1);
				tUserInfo.setCredit(tUserInfo.getCredit().intValue()+20);
				tUserInfo.setExp(tUserInfo.getExp().intValue()+10);
				flag = tUserInfoService.updateTUserInfo(tUserInfo);
			}
			if (status.intValue() == 2) {
				tBaol.setBBtgReason(BtgReason);
			}
			
			tBaol.setBTgShenhe(status);
			
			flag = tBaolService.updateTBaol(tBaol);
			
			break;
		case 31://闲置
			
			System.out.println("31");
			TXianz tXianz = tXianzService.getTXianzByXianzId(artId);
			tUserInfo = tUserInfoService.getTUserInfoByUserId(tXianz.getUserId());
			if (status.intValue() == 1) {
				tUserInfo.setXianzNum(tUserInfo.getXianzNum().intValue()+1);
				tUserInfo.setCredit(tUserInfo.getCredit().intValue()+20);
				tUserInfo.setExp(tUserInfo.getExp().intValue()+10);
				flag = tUserInfoService.updateTUserInfo(tUserInfo);
			}
			
			if (status.intValue() == 2) {
				tXianz.setXBtgReason(BtgReason);
			}
			tXianz.setXTgShenhe(status);
			flag = tXianzService.updateTXianz(tXianz);
			break;
		case 41://举报
			TJub tJub = tJubService.getTJubByJubId(artId);
			tUserInfo = tUserInfoService.getTUserInfoByUserId(tJub.getUserId());
			if (status.intValue() == 1) {
				TUserInfo tUserInfo2 = new TUserInfo();
				tUserInfo.setXianzNum(tUserInfo.getXianzNum().intValue()+1);
				tUserInfo.setCredit(tUserInfo.getCredit().intValue()+20);
				tUserInfo.setExp(tUserInfo.getExp().intValue()+10);
				flag = tUserInfoService.updateTUserInfo(tUserInfo);
				TPunish tPunish = new TPunish();
				switch (tJub.getJubKindId()) {
					case 2://爆料
						TBaol tBaolNew = tBaolService.getTBaolListByBaolId(tJub.getJubInfoId());
						tBaolNew.setBTgShenhe(3);
						tBaolNew.setBBtgReason(tJub.getJubReason());
						tPunish.setUserId(tBaolNew.getUserId());
						tPunish.setUserPReason(tBaolNew.getBaolTitle()+"因"+tJub.getJubReason()+"而被惩罚");
						tPunish.setPBeginTime(new Timestamp(new Date().getTime()));
						tPunish.setPEndTime(new Timestamp(new Date().getTime()+60));
						tPunishService.addTPunished(tPunish);
						tUserInfo2.setBaolNum(tUserInfo2.getBaolNum().intValue()-1);
						tUserInfoService.updateTUserInfo(tUserInfo2);
						tBaolService.updateTBaol(tBaolNew);
						break;
					case 3://闲置
						TXianz tXianzNew = tXianzService.getTXianzByXianzId(tJub.getJubInfoId());
						tXianzNew.setXTgShenhe(3);
						tXianzNew.setXBtgReason(tJub.getJubReason());
						tPunish.setUserId(tXianzNew.getUserId());
						tPunish.setUserPReason(tXianzNew.getXianzTitle()+"因"+tJub.getJubReason()+"而被惩罚");
						tPunish.setPBeginTime(new Timestamp(new Date().getTime()));
						tPunish.setPEndTime(new Timestamp(new Date().getTime()+60));
						tPunishService.addTPunished(tPunish);
						tXianzService.updateTXianz(tXianzNew);
						break;
					case 4://评论
						TComm tComm = tCommService.getTCommByCommId(tJub.getJubInfoId());
						tComm.setCommPunished(2);
						tPunish.setUserId(tComm.getUserIdOne());
						tPunish.setUserPReason(tComm.getComm()+"因"+tJub.getJubReason()+"而被惩罚");
						tPunish.setPBeginTime(new Timestamp(new Date().getTime()));
						tPunish.setPEndTime(new Timestamp(new Date().getTime()+3600000));
						tPunishService.addTPunished(tPunish);
						tUserInfo2.setCommNum(tUserInfo2.getCommNum().intValue()-1);
						tUserInfoService.updateTUserInfo(tUserInfo2);
						tCommService.updateTComm(tComm);
						break;
					default:
						break;
				}
			}
			if (status.intValue() == 2) {
				tJub.setJBtgReason(BtgReason);
			}
			
			tJub.setJTgShenhe(status);
			flag = tJubService.updateTJub(tJub);
		default:
			break;
		}
		
		return flag;
	}
	
	public TUserService gettUserService() {
		return tUserService;
	}
	public void settUserService(TUserService tUserService) {
		this.tUserService = tUserService;
	}
	public TUserInfoService gettUserInfoService() {
		return tUserInfoService;
	}
	public void settUserInfoService(TUserInfoService tUserInfoService) {
		this.tUserInfoService = tUserInfoService;
	}
	public TBaolService gettBaolService() {
		return tBaolService;
	}
	public void settBaolService(TBaolService tBaolService) {
		this.tBaolService = tBaolService;
	}
	public TKindService gettKindService() {
		return tKindService;
	}
	public void settKindService(TKindService tKindService) {
		this.tKindService = tKindService;
	}
	public TJubService gettJubService() {
		return tJubService;
	}
	public void settJubService(TJubService tJubService) {
		this.tJubService = tJubService;
	}
	public TAgreeService gettAgreeService() {
		return tAgreeService;
	}
	public void settAgreeService(TAgreeService tAgreeService) {
		this.tAgreeService = tAgreeService;
	}
	public TShoucService gettShoucService() {
		return tShoucService;
	}
	public void settShoucService(TShoucService tShoucService) {
		this.tShoucService = tShoucService;
	}
	public TCommService gettCommService() {
		return tCommService;
	}
	public void settCommService(TCommService tCommService) {
		this.tCommService = tCommService;
	}
	public TXianzService gettXianzService() {
		return tXianzService;
	}
	public void settXianzService(TXianzService tXianzService) {
		this.tXianzService = tXianzService;
	}
}
