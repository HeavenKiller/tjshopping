package tjweb.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import tjweb.model.TUserInfo;

/*	Repository注解Dao访问类; 
 * 	Service注解业务逻辑处理类 ;
 * 	Resource注解表示使用某个bean资源
 * */
@Repository(value="tUserInfoDao")
public class TUserInfoDao {

	@Resource(name="hibernateTemplate")
	private HibernateTemplate hibernateTemplate;

	/* 添加用户信息 */
	public boolean addTUserInfo(TUserInfo tUserInfo) {
		try {
			System.out.println("TUserInfoDao:"+tUserInfo.getUserId());
			hibernateTemplate.save(tUserInfo);
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
		
		return true;
	}
	
	/* 根据用户编号获取用户信息 */
	@SuppressWarnings("unchecked")
	public List<TUserInfo> getTUserInfoByUserId(Integer userId){
		List<TUserInfo> tUserInfoList = new ArrayList<TUserInfo>();
		String queryString = "from TUserInfo where userId like:userId";
		
		tUserInfoList = (List<TUserInfo>) hibernateTemplate.findByNamedParam(queryString, "userId", userId);
		return tUserInfoList;
	}
	
	/* 更新用户信息  */
	public boolean updateTUserInfo(TUserInfo tUserInfo) {
		try {
			hibernateTemplate.saveOrUpdate(tUserInfo);
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
		
		return true;
	}
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
}
