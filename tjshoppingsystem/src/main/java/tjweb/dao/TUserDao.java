package tjweb.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import tjweb.model.Page;
import tjweb.model.TUser;

/*	Repository注解Dao访问类; 
 * 	Service注解业务逻辑处理类 ;
 * 	Resource注解表示使用某个bean资源
 * */
@Repository(value="tUserDao")
public class TUserDao {
	//hibernateTemplate是Spring提供的Hibernate Dao操作类，在applicationContext中已经完成bean注入，所以此处直接可以拿过来使用
	@Resource(name="hibernateTemplate")
	private HibernateTemplate hibernateTemplate;
	
	/* 用户注册 */
	public boolean addTUser(TUser tUser) {
		try {
			hibernateTemplate.save(tUser);
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
		
		return true;
	}
	
	//根据邮箱获得用户
	@SuppressWarnings("unchecked")
	public List<TUser> getTUserByEmail(String email) {
		List<TUser> tUserList = new ArrayList<TUser>();
		String queryString = "from TUser where email like:email";

		tUserList = (List<TUser>) hibernateTemplate.findByNamedParam(queryString, "email", email);
		
		return tUserList;
	}
	
	//根据用户编号获取用户
	@SuppressWarnings("unchecked")
	public List<TUser> getTUserByUserId(Integer userId) {
		List<TUser> tUserList = new ArrayList<TUser>();
		
		String queryString = "from TUser where userId like:userId";
		tUserList = (List<TUser>) hibernateTemplate.findByNamedParam(queryString, "userId", userId);
		return tUserList;
	}
	
	//根据邮箱、密码获得用户
	public List<TUser> getTUserByEmailAndPassword(TUser tUser) {
		String queryString = "from TUser where email = :email and password = :password";
		String paramNames[] = {"email", "password"};
		String paramValues[] = {tUser.getEmail(), tUser.getPassword()};
		
		@SuppressWarnings("unchecked")
		List<TUser> tUserList = (List<TUser>) hibernateTemplate.findByNamedParam(queryString, paramNames, paramValues);
		
		return tUserList;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<TUser> getTUserListByPageAndUserLevel(Page page, final Integer userLevel) {
		List<TUser> tUserList = new ArrayList<>();
		
		final int pageNow = page.getPageNow();
		final int pageSize = page.getPageSize();
		
		tUserList = hibernateTemplate.execute(new HibernateCallback() {

			@Override
			public Object doInHibernate(Session session)
					throws HibernateException {
				// TODO Auto-generated method stub
				String sql = "select * from t_user where user_level="+userLevel+" limit "+(pageNow-1)*pageSize+","+pageSize;
				
				List<TUser> tUsers = session.createSQLQuery(sql).addEntity(TUser.class).list();
				return tUsers;
			}
		});
		
		return tUserList;
	}
	
	public int getRowCountByUserLevel(Integer userLevel) {
		String queryString = "select count(*) from TUser where userLevel ="+userLevel;
		Long rowCount = (Long) hibernateTemplate.find(queryString).listIterator().next();
		
		return rowCount.intValue();
	}
	
	/* 更新用户 */
	public boolean updateTUser(TUser tUser) {
		try {
			hibernateTemplate.saveOrUpdate(tUser);
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
