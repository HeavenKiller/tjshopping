package tjweb.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import tjweb.dao.TUserDao;
import tjweb.model.Page;
import tjweb.model.TUser;
import tjweb.tools.TimeFormat;

/*	Repository注解Dao访问类; 
 * 	Service注解业务逻辑处理类 ;
 * 	Resource注解表示使用某个bean资源
 * */
@Service(value="tUserService")
public class TUserService {

	@Resource(name="tUserDao")
	private TUserDao tUserDao;
	
	/* 用户注册 */
	public boolean addTUser(TUser tUser) {
		return tUserDao.addTUser(tUser);
	}
	
	/* 判断邮箱是否被注册 */
	public boolean userIsExistByEmail(String email) {
		boolean flag;
		
		if (getTUserByEmail(email) == null) {
			flag = true;	//邮箱 没被注册
			System.out.println("邮箱没被注册");
		}else {
			flag = false;	//邮箱被注册
			System.out.println("邮箱被注册");
		}
		return flag;
	}
	
	/* 根据邮箱获得用户 */
	public TUser getTUserByEmail(String email) {
		List<TUser> tUserList = tUserDao.getTUserByEmail(email);
		if (tUserList.size() > 0) {
			return tUserList.get(0);
		}
		return null;
	}
	
	/* 根据用户编号获取用户 */
	public TUser getTUserByUserId(Integer userId) {
		List<TUser> tUserList = tUserDao.getTUserByUserId(userId);
		if (tUserList.size() > 0) {
			return tUserList.get(0);
		}
		
		return null;
	}
	
	/* 根据邮箱、密码获得用户 */
	public TUser getTUserByEmailAndPassword(TUser tUser) {
		List<TUser> tUserList = tUserDao.getTUserByEmailAndPassword(tUser);
		if (tUserList.size() > 0) {
			return tUserList.get(0);
		}
		return null;
	}
	
	/* 判断用户是否签到 */
	public boolean signIsOrNot(TUser tUser) {
		boolean flag;
		String uDate;
		String cDate = TimeFormat.dateToString(new Date());
		
		if (tUser.getLastSignTime() != null) {
			uDate =TimeFormat.timeStampToString(tUser.getLastSignTime());
			if (!cDate.equals(uDate)) {
				flag = true;	//没签到
			}else {
				flag = false;	//已签到
			}
		}else {
			flag = true;		//没签到
		}
		
		return flag;
	}
	
	public List<TUser> getTUserListByPageAndUserLevel(Page page, final Integer userLevel) {
		return tUserDao.getTUserListByPageAndUserLevel(page, userLevel);
	}
	
	public int getRowCountByUserLevel(Integer userLevel) {
		return tUserDao.getRowCountByUserLevel(userLevel);
	}
	
	public boolean updateTUser(TUser tUser) {
		return tUserDao.updateTUser(tUser);
	}

	public TUserDao gettUserDao() {
		return tUserDao;
	}

	public void settUserDao(TUserDao tUserDao) {
		this.tUserDao = tUserDao;
	}
	
}
