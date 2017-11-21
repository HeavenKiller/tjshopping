package tjweb.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import tjweb.dao.TUserInfoDao;
import tjweb.model.TUserInfo;

/*	Repository注解Dao访问类; 
 * 	Service注解业务逻辑处理类 ;
 * 	Resource注解表示使用某个bean资源
 * */
@Service(value="tUserInfoService")
public class TUserInfoService {
	
	@Resource(name="tUserInfoDao")
	private TUserInfoDao tUserInfoDao;
	
	/* 添加用户信息 */
	public boolean addTUserInfo(TUserInfo tUserInfo) {
		return tUserInfoDao.addTUserInfo(tUserInfo);
	}
	
	/* 根据用户编号获取用户信息 */
	public TUserInfo getTUserInfoByUserId(Integer userId) {
		List<TUserInfo> tUserInfoList = tUserInfoDao.getTUserInfoByUserId(userId);
		
		if (tUserInfoList.size() > 0) {
			return tUserInfoList.get(0);
		}
		
		return null;
	}
	
	/* 更新用户信息 */
	public boolean updateTUserInfo(TUserInfo tUserInfo) {
		return tUserInfoDao.updateTUserInfo(tUserInfo);
	}

	public TUserInfoDao gettUserInfoDao() {
		return tUserInfoDao;
	}

	public void settUserInfoDao(TUserInfoDao tUserInfoDao) {
		this.tUserInfoDao = tUserInfoDao;
	}
	
	
}
