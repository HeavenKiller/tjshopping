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
import tjweb.model.TComm;
import tjweb.model.TPunish;
import tjweb.model.TUser;

/*	Repository注解Dao访问类; 
 * 	Service注解业务逻辑处理类 ;
 * 	Resource注解表示使用某个bean资源
 * */
@Repository(value="tPunishDao")
public class TPunishDao {
	
	@Resource(name="hibernateTemplate")
	private HibernateTemplate hibernateTemplate;
	
	public boolean addTPunished(TPunish tPunish) {
		try {
			hibernateTemplate.save(tPunish);
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
		
		return true;
	}
	
	@SuppressWarnings("unchecked")
	public List<TPunish> getPunishListByUserId(Integer userId) {
		List<TPunish> tPunishList = new ArrayList<TPunish>();
		String queryString = "from TPunish where userId = "+userId+" order by punishId desc";
		
		tPunishList = (List<TPunish>) hibernateTemplate.find(queryString);
		
		return tPunishList;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<TPunish> getTPunishListByPage(Page page) {
		List<TPunish> tPunishList = new ArrayList<>();
		
		final int pageNow = page.getPageNow();
		final int pageSize = page.getPageSize();
		
		tPunishList = hibernateTemplate.execute(new HibernateCallback() {

			@Override
			public Object doInHibernate(Session session)
					throws HibernateException {
				// TODO Auto-generated method stub
				String sql = "select * from t_punish limit "+(pageNow-1)*pageSize+","+pageSize;
				
				List<TPunish> tPunishs = session.createSQLQuery(sql).addEntity(TPunish.class).list();
				return tPunishs;
			}
		});
		
		return tPunishList;
	}
	
	public int getRowCountOfAllTPunishs() {
		String queryString = "select count(*) from TPunish";
		Long rowCount = (Long) hibernateTemplate.find(queryString).listIterator().next();
		
		return rowCount.intValue();
	}

}
