package tjweb.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
/*	Repository注解Dao访问类; 
 * 	Service注解业务逻辑处理类 ;
 * 	Resource注解表示使用某个bean资源
 * */

import tjweb.model.Page;
import tjweb.model.TBaol;
import tjweb.model.TXianz;

@Repository(value="tXianzDao")
public class TXianzDao {
	@Resource(name="hibernateTemplate")
	private HibernateTemplate hibernateTemplate;
	
	/* 添加闲置 */
	public boolean addTXianz(TXianz tXianz) {
		try {
			hibernateTemplate.save(tXianz);
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
		
		return true;
	}
	
	/* 获得闲置表最大编号 */
	public Integer getMaxXianzId() {
		String queryString = "select max(xianzId) from TXianz";
		@SuppressWarnings("unchecked")
		List<Integer> iList =  (List<Integer>) hibernateTemplate.find(queryString);
		if(iList != null && iList.get(0) != null){
			return iList.get(0);
		}else {
			return 0;	
		}
	}
	
	/* 获得所有爆料分页信息 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<TXianz> getTXianzsByPage(Page page) {
		List<TXianz> tXianzList = new ArrayList<TXianz>();
		
		final int pageNow = page.getPageNow();
		final int pageSize = page.getPageSize();
		
		tXianzList = hibernateTemplate.execute(new HibernateCallback() {

			@Override
			public Object doInHibernate(Session session)
					throws HibernateException {
				// TODO Auto-generated method stub
				String sql = "select * from t_xianz limit "+(pageNow-1)*pageSize+","+pageSize;
				
				List<TXianz> tXianzs = session.createSQLQuery(sql).addEntity(TXianz.class).list();
				return tXianzs;
			}
		});
		
		return tXianzList;
	}
	
	public int getRowCountOfAllTXianzs() {
		String queryString = "select count(*) from TXianz";
		Long rowCount = (Long) hibernateTemplate.find(queryString).listIterator().next();
		
		return rowCount.intValue();
	}
	
	/* 根据用户编号和审核状态获得用户分页闲置信息 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<TXianz> getTXianzsByPageAndUserIdAndXtgShenhe(Page page, final Integer userId, final Integer x_tg_shenhe) {
		List<TXianz> tXianzList = new ArrayList<TXianz>();
		
		final int pageNow = page.getPageNow();
		final int pageSize = page.getPageSize();
		
		tXianzList = hibernateTemplate.execute(new HibernateCallback() {

			@Override
			public Object doInHibernate(Session session)
					throws HibernateException {
				// TODO Auto-generated method stub
				String sql = "select * from t_xianz where user_id = "+userId+" and x_tg_shenhe = "+x_tg_shenhe+" limit "+(pageNow-1)*pageSize+","+pageSize;
				
				List<TXianz> tXianzs = session.createSQLQuery(sql).addEntity(TXianz.class).list();
				return tXianzs;
			}
		});
		
		return tXianzList;
	}
	
	/* 获取某个用户通过审核闲置的数目 */
	public int getRowCountByUserIdAndXtgShenhe(Integer userId, Integer x_tg_shenhe) {
		String queryString = "select count(*) from TXianz where userId="+userId+" and x_tg_shenhe = "+x_tg_shenhe;
		Long rowCount = (Long) hibernateTemplate.find(queryString).listIterator().next();
		
		return rowCount.intValue();
	}
	
	/* 通过XtgShenhe的状态来查找爆料*/
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<TXianz> getTXianzListByPageAndXtgShenhe(Page page, final Integer x_tg_shenhe) {
		List<TXianz> tXianzList = new ArrayList<TXianz>();
		final int pageNow = page.getPageNow();
		final int pageSize = page.getPageSize();
		
		tXianzList = hibernateTemplate.execute(new HibernateCallback() {

			@Override
			public Object doInHibernate(Session session)
					throws HibernateException {
				// TODO Auto-generated method stub
				String sql = "select * from t_xianz where x_tg_shenhe = "+x_tg_shenhe+" limit "+(pageNow-1)*pageSize+","+pageSize;
				
				List<TXianz> tXianzs = session.createSQLQuery(sql).addEntity(TXianz.class).list();
				return tXianzs;
			}
		});
		return tXianzList;
	}
	
	public int getRowCountByXtgShenhe(Integer x_tg_shenhe) {
		String queryString = "select count(*) from TXianz where XTgShenhe = "+x_tg_shenhe;
		Long rowCount = (Long) hibernateTemplate.find(queryString).listIterator().next();
		
		return rowCount.intValue();
	}
	
	/* 根据闲置编号获得闲置*/
	@SuppressWarnings("unchecked")
	public List<TXianz> getTXianzByXianzId(Integer xianzId) {
		List<TXianz> tXianzList = new ArrayList<TXianz>();
		String queryString = "from TXianz where xianzId like:xianzId";
		
		tXianzList = (List<TXianz>) hibernateTemplate.findByNamedParam(queryString, "xianzId", xianzId);
		
		return tXianzList;
	}
	
	public boolean updateTXianz(TXianz tXianz) {
		try {
			hibernateTemplate.saveOrUpdate(tXianz);
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
		
		return true;
	}
}
