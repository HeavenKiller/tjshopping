package tjweb.control;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.aspectj.weaver.ast.Var;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import tjweb.model.Page;
import tjweb.model.TAgree;
import tjweb.model.TBaol;
import tjweb.model.TComm;
import tjweb.model.TJub;
import tjweb.model.TPunish;
import tjweb.model.TShouc;
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
import tjweb.tools.GetIp;

/** 
 * 	Scope：表示实例是原型，这样会对每一个请求实例化，保证线程安全 Spring中使用 Controller注解表示该类是控制器 
 * 	Repository注解Dao访问类;
 *  Service注解业务逻辑处理类;
 *	Resource注解表示使用某个bean资源 
 * RequestMapping：表示对该类所有方法的请求URL，前面必须接上/user，如/user/login 表示对login方法的请求访问 
 */ 
@Scope("prototype")
@Controller
@RequestMapping(value="/user")
public class TUserController {
	
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
	private String message;
	
	/** 
     *  
     * Spring MVC中使用RequestMapping处理URL请求， 
     *     GET：表示查询；POST：表示添加操作 
     *     PUT：表示修改操作；DELETE：表示删除操作 
     * ResponseBody：表示返回对象或者值; 
     * consumes: 表示前端传过来的数据格式; 
     * produces：表示返回数据格式 
     */ 
	
	/* toRegister */
	@RequestMapping(value="/toRegister")
	public ModelAndView toRegister(){
		ModelAndView mv = new ModelAndView("register");
		
		return mv;
	}
	
	/* 注册 */
	@RequestMapping(value="/register",  method=RequestMethod.POST, produces="application/json")
	@ResponseBody
	public boolean addTUser(TUser tUser, HttpServletRequest request) throws Exception {
		boolean flag = false;
		boolean flagOne;
		boolean flagTwo;
		TUserInfo tUserInfo = new TUserInfo(0, 0, 1, 0, 0, 0, 0);
		
		tUser.setLastLoginIp(GetIp.getIp(request));
		tUser.setLastLoginTime(new Timestamp(new Date().getTime()));
		tUser.setUserLevel(2);		//0:管理员；1:审核员；2:用户
		tUser.setUserPunished(1);	//1:没被惩罚；0:被惩罚
		
		flagOne = tUserService.addTUser(tUser);
		
		if (flagOne) {
			tUserInfo.setUserId(tUser.getUserId());
			tUserInfo.setNickname(tUser.getNickname());
			tUserInfo.setUserImg("/images/S2.png");
			
			flagTwo = tUserInfoService.addTUserInfo(tUserInfo);
			
			if (flagTwo) {
				request.getSession().setAttribute("tUserInfo", tUserInfo);
				flag = true;
			}
		}
		return flag;
	}
	
	/* 绑定电话 */
	@RequestMapping(value="/addTel")
	@ResponseBody
	public boolean addTel(@RequestParam("userId") Integer userId, @RequestParam("tel") String tel, HttpServletRequest request) throws Exception {
		boolean flag = false;
		TUser tUser = tUserService.getTUserByUserId(userId);
		tUser.setTel(tel);
		
		flag = tUserService.updateTUser(tUser);
		
		return flag;
	}
	
	/* 添加简介 */
	@RequestMapping(value="/addIntro")
	@ResponseBody
	public boolean addIntro(@RequestParam("userId") Integer userId, String intro, HttpServletRequest request) throws Exception {
		boolean flag = false;
		TUserInfo tUserInfo = tUserInfoService.getTUserInfoByUserId(userId);
		tUserInfo.setIntro(intro);
		
		flag = tUserInfoService.updateTUserInfo(tUserInfo);
		
		return flag;
	}
	
	@RequestMapping(value="/addImage")
	@ResponseBody
	public String addImage(@RequestParam("userId") Integer userId,
			@RequestParam(value="userImageUpload", required=false) MultipartFile userImageUpload, 
			HttpServletRequest request) throws IllegalStateException, IOException{
		TUserInfo tUserInfo = tUserInfoService.getTUserInfoByUserId(userId);
		List<TComm> tCommList = tCommService.getTCommListByUserIdAndArtKindId(userId, 2);
		String imageSrc = tUserInfo.getUserImg();
		
		String pathRoot = request.getSession().getServletContext().getRealPath("");
		String savePath = "/userdoc/"+userId+"/userImage/"+"/";
		String path = "";
		
		
		if (!imageSrc.equals("/images/S1.png")) {
			File file = new File(pathRoot+imageSrc);
			if (file.exists()) {
				System.out.println(file.delete());
			}else {
				System.out.println("不存在");
			}
		}
		
		File file = new File(pathRoot+savePath);
		
		if (!userImageUpload.isEmpty()) {
			String uuid = UUID.randomUUID().toString().replaceAll("-", "");
			String contentType = userImageUpload.getContentType();
			String imageName = contentType.substring(contentType.indexOf("/")+1);
			if (!file.exists()) {
				file.mkdirs();
			}
			path = savePath+uuid+"."+imageName;
			userImageUpload.transferTo(new File(pathRoot+path));
		}
		
		for (TComm tComm : tCommList) {
			tComm.setUserImg(path);
			System.out.println("发送者："+tComm.getOneNickname()+";接受者："+tComm.getOtherNickname()+";内容："+tComm.getArtKindId());
			tCommService.updateTComm(tComm);
		}
		tUserInfo.setUserImg(path);
		tUserInfoService.updateTUserInfo(tUserInfo);
		
		
		return path;
	}
	
	
	
	/* 检查邮箱是否被注册 */
	@RequestMapping(value="/checkEmail", method=RequestMethod.GET, consumes="application/json", produces="application/json")
	@ResponseBody
	public boolean userIsExistByEmail(String email){
		boolean flag = tUserService.userIsExistByEmail(email);

		return flag;
	}
	
	/* 根据邮箱获得用户 */
	@RequestMapping(value="/getTUserByEmail", method=RequestMethod.GET, produces="application/json")
	@ResponseBody
	public TUser getTUserByEmail(String email){
		TUser tUser = tUserService.getTUserByEmail(email);
		System.out.println(tUser.getLastLoginTime());
		return tUser;
	}
	
	/* 签到 */
	@RequestMapping(value="/sign/{userId}", method=RequestMethod.GET, produces="application/json")
	@ResponseBody
	public boolean signByUserId(@PathVariable Integer userId, HttpServletRequest request){
		boolean flag = (boolean) request.getSession().getAttribute("signIsOrNot");
		TUser tUser = tUserService.getTUserByUserId(userId);
		TUserInfo tUserInfo = tUserInfoService.getTUserInfoByUserId(userId);
		
		if (flag) {
			tUser.setLastSignTime(new Timestamp(new Date().getTime()));
			tUserInfo.setCredit(tUserInfo.getCredit()+20);
			
			tUserService.updateTUser(tUser);	//签到
			tUserInfoService.updateTUserInfo(tUserInfo);	//签到增加积分
			
			flag = false;
			request.getSession().setAttribute("signIsOrNot", flag);
			request.getSession().setAttribute("tUserInfo", tUserInfo);
		}
		
		return flag;
	}
	
//	/* 登录：根据邮箱、密码查找用户 */
//	@RequestMapping(value="/getmTUserByEmailAndPassword",  method=RequestMethod.GET, produces="application/json")
//	@ResponseBody
//	public boolean getmTUserByEmailAndPassword(TUser tUser, HttpServletRequest request){
//		boolean flag = false;
//		TUser tUser2 = tUserService.getTUserByEmailAndPassword(tUser);
//		if (tUser2 != null) {
//			TUserInfo tUserInfo = tUserInfoService.getTUserInfoByUserId(tUser2.getUserId());
//			if (tUserInfo != null) {
//				request.getSession().setAttribute("tUserInfo", tUserInfo);
//				request.getSession().setAttribute("signIsOrNot", tUserService.signIsOrNot(tUser2));
//				flag = true;
//			}
//		}
//		
//		return flag;
//	}
	
	/* 登录：根据邮箱、密码查找用户 */
	@RequestMapping(value="/getmTUserByEmailAndPassword",  method=RequestMethod.GET)
	@ResponseBody
	public TUser getmTUserByEmailAndPassword(TUser tUser, HttpServletRequest request){
		TUser tUser2 = tUserService.getTUserByEmailAndPassword(tUser);
		if (tUser2 != null) {
			if (tUser2.getUserLevel().intValue() != 2) {	//0:管理员；1:审核员；2:用户
				request.getSession().setAttribute("tUser", tUser2);
			}else {
				TUserInfo tUserInfo = tUserInfoService.getTUserInfoByUserId(tUser2.getUserId());
				
				/* 判断用户是否被惩罚 */
				TPunish tPunish = tPunishService.getPunishByUserId(tUserInfo.getUserId());
				if (tPunish != null) {
					if (tPunish.getPEndTime().getTime() > new Date().getTime()) {
						System.out.println("userPunished");
						request.getSession().setAttribute("userPunished", true);
					}
				}
				
				if (tUserInfo != null) {
					request.getSession().setAttribute("tUserInfo", tUserInfo);
					request.getSession().setAttribute("signIsOrNot", tUserService.signIsOrNot(tUser2));
				}
			}
		}
		
		return tUser2;
	}
	
	//退出登录
	@RequestMapping(value="/exit")
	@ResponseBody
	public boolean exit(HttpServletRequest request){
		request.getSession().removeAttribute("tUserInfo");
		request.getSession().removeAttribute("signIsOrNot");
		request.getSession().removeAttribute("tUser");
		request.getSession().removeAttribute("userPunished");
		return true;
	}
	
	/* 提交闲置 */
	/*将参数中的image绑定到MultipartFile file1，此时CommonsMultipartResolver已经帮我们把附件内容填充到MultipartFile 中了，这里required = false最好设置为false，除非你确定这个参数一定会传递给controller，否则会抛出参数绑定异常。*/
	@RequestMapping(value="/addTXianz", method=RequestMethod.POST)
	public String addTXianz(TXianz tXianz, @RequestParam(value="XImgUpload", required=false) MultipartFile[] XImgs,
			@RequestParam(value="RImgUpload", required=false) MultipartFile[] RImgs,
			HttpServletRequest request) throws IllegalStateException, IOException {
		
		Integer newXianzId = tXianzService.getMaxXianzId()+1;
		//获得物理路径webapp所在的路径
		String pathRoot = request.getSession().getServletContext().getRealPath("");
		String saveXPath = "/userdoc/"+tXianz.getUserId()+"/xianz/"+newXianzId+"/xImg/";
		String saveRPath = "/userdoc/"+tXianz.getUserId()+"/xianz/"+newXianzId+"/rspz/";
		String Xpath = "";
		String Rpath = "";
		File fileX = new File(pathRoot+saveXPath);
		File fileR = new File(pathRoot+saveRPath);
		
		tXianz.setXianzTime(new Timestamp(new Date().getTime()));	//爆料时间
		tXianz.setXShoucNum(0);		//爆料被收藏数
		tXianz.setXCommNum(0);		//爆料被回复数
		tXianz.setXTgShenhe(0);		//爆料是否通过审核，0:正在审核；1:通过审核；2：不通过
		tXianz.setXianzPunished(1);	//爆料是否被惩罚，1:无；2:被惩罚，不能显示
		
		for (int i = 0; i < XImgs.length; i++) {
			MultipartFile xImg = XImgs[i];
			if (!xImg.isEmpty()) {
				String uuid = UUID.randomUUID().toString().replaceAll("-", "");
				String contentType = xImg.getContentType();
				String imageName = contentType.substring(contentType.indexOf("/")+1);
				if (!fileX.exists()) {
					fileX.mkdirs();
				}
				Xpath = saveXPath+uuid+"."+imageName;
				xImg.transferTo(new File(pathRoot+Xpath));
				if (tXianz.getXianzImgOne() == null) {
					tXianz.setXianzImgOne(Xpath);
				}else {
					if (tXianz.getXianzImgTwo() == null) {
						tXianz.setXianzImgTwo(Xpath);
					}else {
						if (tXianz.getXianzImgThree() == null) {
							tXianz.setXianzImgThree(Xpath);
						}else {
							if (tXianz.getXianzImgFour() == null) {
								tXianz.setXianzImgFour(Xpath);
	  						}else {
								tXianz.setXianzImgFive(Xpath);
							}
						}
					}
				}
			}
		}
		
		for (int i = 0; i < RImgs.length; i++) {
			MultipartFile rImg = RImgs[i];
			if (!rImg.isEmpty()) {
				String uuid = UUID.randomUUID().toString().replaceAll("-", "");
				String contentType = rImg.getContentType();
				String imageName = contentType.substring(contentType.indexOf("/")+1);
				if (!fileR.exists()) {
					fileR.mkdirs();
				}
				Rpath = saveRPath+uuid+"."+imageName;
				rImg.transferTo(new File(pathRoot+Rpath));
				if (tXianz.getRspzImgOne() == null) {
					tXianz.setRspzImgOne(Rpath);
				}else {
					if (tXianz.getRspzImgTwo() == null) {
						tXianz.setRspzImgTwo(Rpath);
					}else {
						if (tXianz.getRspzImgThree() == null) {
							tXianz.setRspzImgThree(Rpath);
						}else {
							if (tXianz.getRspzImgFour() == null) {
								tXianz.setRspzImgFour(Rpath);
	  						}else {
								tXianz.setRspzImgFive(Rpath);
							}
						}
					}
				}
			}
		}
		
		tXianzService.addTXianz(tXianz);
		return "redirect:/index";
	}
	
	/* 提交爆料 */
	/*将参数中的baolImgUpload绑定到MultipartFile file1，此时CommonsMultipartResolver已经帮我们把附件内容填充到MultipartFile 中了，这里required = false最好设置为false，除非你确定这个参数一定会传递给controller，否则会抛出参数绑定异常。*/
	@RequestMapping(value="/addTBaol", method=RequestMethod.POST)
	public String addTBaol(TBaol tBaol, @RequestParam(value="baolImgUpload", required=false) MultipartFile[] baolImgs,
			HttpServletRequest request) throws IllegalStateException, IOException {
		
//		TUserInfo tUserInfo = tUserInfoService.getTUserInfoByUserId(tBaol.getUserId());
//		Integer baolNum = tUserInfo.getBaolNum();
//		tUserInfo.setBaolNum(baolNum+1);
		
		Integer newBaolId = tBaolService.getMaxBaolId()+1;
		//获得物理路径webapp所在的路径
		String pathRoot = request.getSession().getServletContext().getRealPath("");
		String savePath = "/userdoc/"+tBaol.getUserId()+"/baol/"+newBaolId+"/";
		String path = "";
		File file = new File(pathRoot+savePath);
		
		tBaol.setBaolTime(new Timestamp(new Date().getTime()));	//爆料时间
		tBaol.setBaolIsZhiNum(0);	//爆料值数目
		tBaol.setBaolIsNotzhiNum(0);//爆料不值数目
		tBaol.setBShoucNum(0);		//爆料被收藏数
		tBaol.setBCommNum(0);		//爆料被回复数
		tBaol.setBTgShenhe(0);		//爆料是否通过审核，0:正在审核；1:通过审核；2：不通过
		tBaol.setBaolPunished(1);	//爆料是否被惩罚，1:无；2:被惩罚，不能显示
		
		//ArrayList<String> baolImgPathList = new ArrayList<String>();		
		for (int i = 0; i < baolImgs.length; i++) {
			MultipartFile baolImg = baolImgs[i];
			if (!baolImg.isEmpty()) {
				String uuid = UUID.randomUUID().toString().replaceAll("-", "");
				String contentType = baolImg.getContentType();
				String imageName = contentType.substring(contentType.indexOf("/")+1);
				if (!file.exists()) {
					file.mkdirs();
				}
				path = savePath+uuid+"."+imageName;
				baolImg.transferTo(new File(pathRoot+path));
				if (tBaol.getBaolImgOne() == null) {
					tBaol.setBaolImgOne(path);
				}else {
					if (tBaol.getBaolImgTwo() == null) {
						tBaol.setBaolImgTwo(path);
					}else {
						if (tBaol.getBaolImgThree() == null) {
							tBaol.setBaolImgThree(path);
						}else {
							if (tBaol.getBaolImgFour() == null) {
								tBaol.setBaolImgFour(path);
	  						}else {
								tBaol.setBaolImgFive(path);
							}
						}
					}
				}
			}
		}
		tBaolService.addTBaol(tBaol);
//		tUserInfoService.updateTUserInfo(tUserInfo);
		return "redirect:/index";
	}
	
	/* 根据爆料编号展示爆料 */
	@RequestMapping(value="/showBaol")
	public ModelAndView showBaol(@RequestParam("baolId") Integer baolId, HttpServletRequest request){
		ModelAndView mv = new ModelAndView("showBaol");
		boolean isJubed = false;
		String isOrNot = "";	//是否赞同爆料
		boolean prevIsOrNot = false;
		boolean nextIsOrNot = false;
		Integer prevBaolId = baolId - 1;
		Integer nextBaolId = baolId + 1;
		
		int rowCount = tCommService.getRowCount(2, baolId);
		
		TUserInfo tUserInfo = (TUserInfo) request.getSession().getAttribute("tUserInfo");
		if (tUserInfo != null) {
			Integer userId = tUserInfo.getUserId();
			
			TJub tJub = tJubService.getJubByJubKindIdAndJubInfoIdAndUserId(2, baolId, userId);
			TAgree tAgree = tAgreeService.getAgreeByAgreeKindIdAndAgreeInfoIdAndUserId(2, baolId, userId);
			TShouc tShoucNext = tShoucService.getShoucByArtKindIdAndArtIdAndUserId(2, nextBaolId, userId);
			if (prevBaolId > 0) {
				TShouc tShoucPrev = tShoucService.getShoucByArtKindIdAndArtIdAndUserId(2, prevBaolId, userId);
				if (tShoucPrev != null) {
					prevIsOrNot = true;
				}
			}
			
			if (tJub != null) {
				isJubed = true;
			}
			if (tAgree != null) {
				isOrNot = tAgree.getIsOrNot()+"";	//0:不同意；1:同意
			}
			if (tShoucNext != null) {
				nextIsOrNot = true;
			}
		}
		
		TBaol tBaol = tBaolService.getTBaolListByBaolIdAndBtgShenhe(baolId, 1);
		mv.addObject("tBaol", tBaol);
		mv.addObject("tBaolPrev", tBaolService.getTBaolListByBaolIdAndBtgShenhe(prevBaolId, 1));
		mv.addObject("tBaolNext", tBaolService.getTBaolListByBaolIdAndBtgShenhe(nextBaolId, 1));
		mv.addObject("tBaolUserInfo", tUserInfoService.getTUserInfoByUserId(tBaol.getUserId()));
		mv.addObject("tKindList", tKindService.getAllKinds());
		mv.addObject("tKindLevelOneList", tKindService.getTKindByKindLevel(1));
		mv.addObject("tKindLevelTwoList", tKindService.getTKindByKindLevel(2));
		mv.addObject("rowCount", rowCount);
		mv.addObject("isJubed", isJubed);
		mv.addObject("isOrNot", isOrNot);
		mv.addObject("prevIsOrNot", prevIsOrNot);
		mv.addObject("nextIsOrNot", nextIsOrNot);
		return mv;
	}
	
	/* 举报 */
	@RequestMapping(value="/addTJub", method=RequestMethod.POST)
	@ResponseBody
	public boolean addTJub(TJub tJub){
		boolean flag = false;
		
		tJub.setJubTime(new Timestamp(new Date().getTime()));
		tJub.setJTgShenhe(0); //0正在审核；1通过审核；2不通过
		flag = tJubService.addTJub(tJub);
		
		return flag;
	}
	
	/* 点赞 */
	@RequestMapping(value="/addTAgree", method=RequestMethod.POST)
	@ResponseBody
	public boolean addTAgree(@RequestParam("num") Integer num, TAgree tAgree){
		boolean flagOne = false;
		boolean flagTwo = false;
		Integer infoId = tAgree.getAgreeInfoId();
		
		tAgree.setAgreeTime(new Timestamp(new Date().getTime()));
		flagOne = tAgreeService.addTAgree(tAgree);
		
		switch (tAgree.getAgreeKindId()) {
			case 1:								//1:用户
				break;							
			case 2:	TBaol tBaol = tBaolService.getTBaolListByBaolIdAndBtgShenhe(infoId, 1); 	//2:爆料
					if (tAgree.getIsOrNot() == 0) {							//不同意
						tBaol.setBaolIsNotzhiNum(num);
						flagTwo = tBaolService.updateTBaol(tBaol);
					}else {
						tBaol.setBaolIsZhiNum(num);
						flagTwo = tBaolService.updateTBaol(tBaol);
					}						
				break;
			case 3:								//3:闲值
				break;
			default:TComm tComm = tCommService.getTCommByCommId(infoId);							//4:评论
					if (tAgree.getIsOrNot() == 0) {
						tComm.setDisagreeNum(num);
						flagTwo = tCommService.updateTComm(tComm);
					}else {
						tComm.setAgreeNum(num);
						flagTwo = tCommService.updateTComm(tComm);
					}
				break;
		}
		
		if (flagOne && flagTwo) {
			return true;
		}else {
			return false;
		}
	}
	
	/* 收藏 */
	@RequestMapping(value="/addTShouc", method=RequestMethod.POST)
	@ResponseBody
	public boolean addTShouc(@RequestParam("num") Integer num, TShouc tShouc){
		boolean flagOne = false;
		boolean flagTwo = false;
		Integer artId = tShouc.getArtId();
		
		tShouc.setShoucTime(new Timestamp(new Date().getTime()));
		flagOne = tShoucService.addTShouc(tShouc);
		
		switch (tShouc.getArtKindId()) {
			case 1:								//1:用户
				break;							
			case 2:	TBaol tBaol = tBaolService.getTBaolListByBaolIdAndBtgShenhe(artId, 1); 	//2:爆料
					tBaol.setBShoucNum(num);
					flagTwo = tBaolService.updateTBaol(tBaol);
				break;
			case 3:								//3:闲值
				break;
			default:							//4:评论
				break;
		}
		
		if (flagOne && flagTwo) {
			TUserInfo tUserInfo = tUserInfoService.getTUserInfoByUserId(tShouc.getUserId());
			Integer shoucNum = tUserInfo.getShoucNum();
			shoucNum = shoucNum+1;
			tUserInfo.setShoucNum(shoucNum);
			tUserInfoService.updateTUserInfo(tUserInfo);
			return true;
		}else {
			return false;
		}
	}
	
	/* 取消收藏 */
	@RequestMapping(value="/deleteTShouc", method=RequestMethod.POST)
	@ResponseBody
	public boolean deleteTShouc(@RequestParam("num") Integer num, TShouc tShouc){
		boolean flagOne = false;
		boolean flagTwo = false;
		Integer artId = tShouc.getArtId();
		
		switch (tShouc.getArtKindId()) {
			case 1:								//1:用户
				break;							
			case 2:	TBaol tBaol = tBaolService.getTBaolListByBaolIdAndBtgShenhe(artId, 1); 	//2:爆料
					tBaol.setBShoucNum(num);
					flagTwo = tBaolService.updateTBaol(tBaol);
				break;
			case 3:								//3:闲值
				break;
			default:							//4:评论
				break;
		}
		
		flagOne = tShoucService.deleteTShouc(tShouc);
		
		System.out.println(flagOne);
		
		if (flagOne && flagTwo) {
			TUserInfo tUserInfo = tUserInfoService.getTUserInfoByUserId(tShouc.getUserId());
			Integer shoucNum = tUserInfo.getShoucNum();
			shoucNum = shoucNum-1;
			tUserInfo.setShoucNum(shoucNum);
			tUserInfoService.updateTUserInfo(tUserInfo);
			return true;
		}else {
			return false;
		}
	}
	
	/* 取消收藏 */
	@RequestMapping(value="/deleteTShoucByShoucId", method=RequestMethod.POST)
	@ResponseBody
	public boolean deleteTShoucByShoucId(@RequestParam("shoucId") Integer shoucId){
		boolean flag = false;
		boolean flagOne = false;
		boolean flagTwo = false;
		TShouc tShouc = tShoucService.getTShoucByShoucId(shoucId);
		TUserInfo tUserInfo = tUserInfoService.getTUserInfoByUserId(tShouc.getUserId());
		Integer artKindId = tShouc.getArtKindId();
		TBaol tBaol = null;
		
		if (artKindId == 2) {
			tBaol = tBaolService.getTBaolListByBaolIdAndBtgShenhe(tShouc.getArtId(), 1);
			tBaol.setBShoucNum(tBaol.getBShoucNum()-1);
		}
		
		tUserInfo.setShoucNum(tUserInfo.getShoucNum()-1);
		flag = tShoucService.deleteTShouc(tShouc);
		
		if (flag) {
			flagOne = tUserInfoService.updateTUserInfo(tUserInfo);
			if (artKindId == 2) {
				flagTwo = tBaolService.updateTBaol(tBaol);
			}
		}
		
		
		if (flagOne && flagTwo) {
			return true;
		}else {
			return false;
		}
	}
	
	
	/* 评论 */
	@RequestMapping(value="/addTComm", method=RequestMethod.POST)
	@ResponseBody
	public Integer addTComm(@RequestParam("num") Integer num, TComm tComm) {
		boolean flagTwo = false; 
		Integer maxCommId = 0;
		
		Integer artId = tComm.getArtId();
		
		switch (tComm.getArtKindId()) {
			case 1:								//1:用户
				break;							
			case 2:	TBaol tBaol = tBaolService.getTBaolListByBaolIdAndBtgShenhe(artId, 1); 	//2:爆料
					tBaol.setBCommNum(num);
					tComm.setCommParent(0);
					flagTwo = tBaolService.updateTBaol(tBaol);
				break;
			case 3:								//3:闲值
				break;
			default:flagTwo = true;							//4:评论
				break;
		}
		
		if (flagTwo) {
			tComm.setAgreeNum(0);
			tComm.setDisagreeNum(0);
			tComm.setCommPunished(1);
			tComm.setCommTime(new Timestamp(new Date().getTime()));
			
			tCommService.addTComm(tComm);
			maxCommId = tCommService.getMaxCommId();
			
			
			
			TUserInfo tUserInfo = tUserInfoService.getTUserInfoByUserId(tComm.getUserIdOne());
			Integer commNum = tUserInfo.getCommNum();
			commNum = commNum+1;
			tUserInfo.setCommNum(commNum);
			tUserInfoService.updateTUserInfo(tUserInfo);
			
			System.out.println(maxCommId);
		}
		
		return maxCommId;
	}
	
	@RequestMapping(value="updateTCommByCommParent")
	@ResponseBody
	public boolean updateTCommByCommParent(@RequestParam("commId") Integer commId, @RequestParam("commParent") Integer commParent){
		boolean flag = false;
		System.out.println("updateTCommByCommParent"+commId+commParent);
		TComm tComm = tCommService.getTCommByCommId(commId);
		
		tComm.setCommParent(commParent);
		flag = tCommService.updateTComm(tComm);
		
		return flag;
	}
	
	/* 评论分页 */
	@RequestMapping(value="getTCommsByPage", method=RequestMethod.GET)
	@ResponseBody
	public List<TComm> getTCommsByPage(@RequestParam("artKindId") Integer artKindId ,@RequestParam("artId") Integer artId, Page page){
		List<TComm> tCommsPage = new ArrayList<TComm>();
		
		int rowCount = tCommService.getRowCount(artKindId, artId);
		int pageSize = page.getPageSize();
		int pageCount = (rowCount-1)/pageSize+1;
		
		page.setPageCount(pageCount);
		page.setRowCount(rowCount);
		
		switch (artKindId) {
			case 1://用户
				
				break;
			case 2://爆料
				tCommsPage = tCommService.getTCommsByPage(page, artKindId, artId);
				break;
			case 3://闲值
				
				break;
			default://评论
				break;
		}
		
		return tCommsPage;
	}
	
	@RequestMapping(value="getCommIsJubedMap", method=RequestMethod.GET)
	@ResponseBody
	public Map<Integer, Boolean> getCommIsJubedMap(@RequestParam("artKindId") Integer artKindId ,@RequestParam("artId") Integer artId, @RequestParam("userId") Integer userId, Page page) {
		Map<Integer, Boolean> commIsJubedMap = new HashMap<Integer, Boolean>();	//存放评论是否被举报
		
		List<TComm> tCommsPage = tCommService.getTCommsByPage(page, artKindId, artId);
		
		if (tCommsPage != null) {
			for (TComm tComm : tCommsPage) {
				TJub tJubComm = tJubService.getJubByJubKindIdAndJubInfoIdAndUserId(4, tComm.getCommId(), userId);
				if (tJubComm != null) {
					commIsJubedMap.put(tComm.getCommId(), true);
				}else {
					commIsJubedMap.put(tComm.getCommId(), false);
				}
			}
		}
		
		return commIsJubedMap;
	}
	
	@RequestMapping(value="getCommIsOrNotAgreedMap", method=RequestMethod.GET)
	@ResponseBody
	public Map<Integer, Integer> getCommIsOrNotAgreedMap(@RequestParam("artKindId") Integer artKindId ,@RequestParam("artId") Integer artId, @RequestParam("userId") Integer userId, Page page) {
		Map<Integer, Integer> commIsOrNotAgreedMap = new HashMap<>();
		
		List<TComm> tCommsPage = tCommService.getTCommsByPage(page, artKindId, artId);
		
		if (tCommsPage != null) {
			for (TComm tComm : tCommsPage) {
				TAgree tAgreeComm = tAgreeService.getAgreeByAgreeKindIdAndAgreeInfoIdAndUserId(4, tComm.getCommId(), userId);
				
				if (tAgreeComm != null) {
					commIsOrNotAgreedMap.put(tComm.getCommId(), tAgreeComm.getIsOrNot());
				}
			}
		}
		
		return commIsOrNotAgreedMap;
	}
	

	@RequestMapping(value="showUserInfo")
	public ModelAndView showUserInfo(@RequestParam("userId") Integer userId, @RequestParam("artKindId") Integer artKindId, @RequestParam("pageNow") Integer pageNow, HttpServletRequest request){
		ModelAndView mv = new ModelAndView("showUserInfo");
		Page page = new Page();
		int pageSize = 1;
		int rowCount = 0;
		int pageCount = 0;
		
		page.setPageSize(pageSize);
		page.setPageNow(pageNow);
		
		List<TBaol> tBaolsPage = new ArrayList<>();
		List<TComm> tCommsPage = new ArrayList<>();
		List<TShouc> tShoucsPage = new ArrayList<>();
		List<TXianz> tXianzsPage = new ArrayList<>();
		
		Map<Integer, TBaol> tBaolsForTComms = new HashMap<>();
		Map<Integer, TBaol> tBaolsForTShoucs = new HashMap<>();
		
		TUserInfo tUserInfoForArt = tUserInfoService.getTUserInfoByUserId(userId);
		
		int baolShenheNum = tBaolService.getRowCountByUserIdAndBtgShenhe(userId, 0);
		int baolBtgNum = tBaolService.getRowCountByUserIdAndBtgShenhe(userId, 2);
		int commForUserNum = tCommService.getRowCountByUserIdOther(userId);
		int xianzShenheNum = tXianzService.getRowCountByUserIdAndXtgShenhe(userId, 0);
		int xianzBtgNum = tXianzService.getRowCountByUserIdAndXtgShenhe(userId, 2);
		
		switch (artKindId) {
			case 1:				//消息
				rowCount = 0;
				tCommsPage = tCommService.getCommsForUserByPageAndUserId(page, userId);
				//System.out.println("rowCount"+rowCount);
				TBaol tBaolu = null;
				for (TComm tComm : tCommsPage) {
					if (tComm.getArtKindId() == 4) {
						tBaolu = tBaolService.getTBaolListByCommId(tComm.getCommId());
					}
					if (tComm.getArtKindId() == 2) {
						tBaolu = tBaolService.getTBaolListByBaolIdAndBtgShenhe(tComm.getArtId(), 1);
					}
					tBaolsForTComms.put(tComm.getCommId(), tBaolu);
				}
				
				mv.addObject("tCommsPage", tCommsPage);
				mv.addObject("tBaolsForTComms", tBaolsForTComms);
				break;
			case 2:				//爆料
				rowCount = tBaolService.getRowCountByUserIdAndBtgShenhe(userId, 1);
				tBaolsPage = tBaolService.getTBaolsByPageAndUserIdAndBtgShenhe(page, userId, 1);
				mv.addObject("tBaolsPage", tBaolsPage);
				break;
			case 3:				//闲值
				rowCount = tXianzService.getRowCountByUserIdAndXtgShenhe(userId, 1);
				tXianzsPage = tXianzService.getTXianzsByPageAndUserIdAndXtgShenhe(page, userId, 1);
				mv.addObject("tXianzsPage", tXianzsPage);
				break;
			case 4:				//评论
				rowCount = tCommService.getRowCountByUserId(userId);
				tCommsPage = tCommService.getTCommsByPageAndUserId(page, userId);
				TBaol tBaol = null;
				for (TComm tComm : tCommsPage) {
					if (tComm.getArtKindId() == 4) {
						tBaol = tBaolService.getTBaolListByCommId(tComm.getCommId());
					}
					if (tComm.getArtKindId() == 2) {
						tBaol = tBaolService.getTBaolListByBaolIdAndBtgShenhe(tComm.getArtId(), 1);
					}
					tBaolsForTComms.put(tComm.getCommId(), tBaol);
				}
				
				mv.addObject("tCommsPage", tCommsPage);
				mv.addObject("tBaolsForTComms", tBaolsForTComms);
				break;
			case 5:				//收藏
				rowCount = tShoucService.getRowCountByUserId(userId);
				tShoucsPage = tShoucService.getTShoucsByPageAndUserId(page, userId);
				TBaol tBaolc = null;
				for (TShouc tShouc : tShoucsPage) {
					if (tShouc.getArtKindId() == 2) {
						tBaolc = tBaolService.getTBaolListByBaolIdAndBtgShenhe(tShouc.getArtId(), 1);
					}
					tBaolsForTShoucs.put(tShouc.getShoucId(), tBaolc);
				}
				
				mv.addObject("tShoucsPage", tShoucsPage);
				mv.addObject("tBaolsForTShoucs", tBaolsForTShoucs);
				break;	
			case 6:				//爆料审核中
				rowCount = baolShenheNum;	
				tBaolsPage = tBaolService.getTBaolsByPageAndUserIdAndBtgShenhe(page, userId, 0);
				mv.addObject("tBaolsPage", tBaolsPage);
				break;
			case 7:				//闲置审核中
				rowCount = xianzShenheNum;
				tXianzsPage = tXianzService.getTXianzsByPageAndUserIdAndXtgShenhe(page, userId, 0);
				mv.addObject("tXianzsPage", tXianzsPage);
				
				break;
			case 8:				//爆料失败
				rowCount = baolBtgNum;	
				tBaolsPage = tBaolService.getTBaolsByPageAndUserIdAndBtgShenhe(page, userId, 2);
				mv.addObject("tBaolsPage", tBaolsPage);
				break;
			case 9:				//闲置失败
				rowCount = xianzBtgNum;
				tXianzsPage = tXianzService.getTXianzsByPageAndUserIdAndXtgShenhe(page, userId, 2);
				mv.addObject("tXianzsPage", tXianzsPage);
				break;
			case 10:			//个人信息
				TUser tUser = tUserService.getTUserByUserId(userId);
				mv.addObject("tUser", tUser);
				break;
			default:
				break;
		}
		
		pageCount = (rowCount-1)/pageSize+1;
		
		mv.addObject("tUserInfoForArt", tUserInfoForArt);
		mv.addObject("tKindList", tKindService.getAllKinds());
		mv.addObject("pageCount", pageCount);
		mv.addObject("pageNow", pageNow);
		mv.addObject("rowCount", rowCount);
		mv.addObject("artKindId", artKindId);
		mv.addObject("baolShenheNum", baolShenheNum);
		mv.addObject("baolBtgNum", baolBtgNum);
		mv.addObject("commForUserNum", commForUserNum);
		mv.addObject("xianzShenheNum", xianzShenheNum);
		mv.addObject("xianzBtgNum", xianzBtgNum);
//		for (TComm tComm : tCommsPage) {
//			TBaol tBaol1 = null;
//			
//			tBaol1 = tBaolsForTComms.get(tComm.getCommId());
//			
//			System.out.println("commId:"+tComm.getCommId()+"; baolId:"+tBaol1.getBaolId()+"; baolTitle:"+tBaol1.getBaolTitle());
//		}
		
//		if (artKindId == 4) {
//			mv.addObject("tBaolsForTComms", tBaolsForTComms);
//		}
		
		return mv;
	}
	
	@RequestMapping(value="payExpForOther", method=RequestMethod.GET)
	@ResponseBody
	public boolean payExpForOther(@RequestParam("gUserId") Integer gUserId, 
			@RequestParam("dUserId") Integer dUserId) {
		TUserInfo gUserInfo = tUserInfoService.getTUserInfoByUserId(gUserId);
		TUserInfo dUserInfo = tUserInfoService.getTUserInfoByUserId(dUserId);
		
		if (gUserInfo.getCredit().intValue() > 10) {
			gUserInfo.setCredit(gUserInfo.getCredit().intValue()-10);
			dUserInfo.setCredit(dUserInfo.getCredit().intValue()+10);
			tUserInfoService.updateTUserInfo(dUserInfo);
			tUserInfoService.updateTUserInfo(gUserInfo);
			
			return true;
		}
		
		return false;
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

	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
}
