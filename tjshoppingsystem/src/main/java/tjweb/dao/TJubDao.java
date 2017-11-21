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
import tjweb.model.TJub;
import tjweb.model.TXianz;

/*	Repository注解Dao访问类; 
 * 	Service注解业务逻辑处理类 ;
 * 	Resource注解表示使用某个bean资源
 * */
@Repository(value="tJubDao")
public class TJubDao {
	@Resource(name="hibernateTemplate")
	private HibernateTemplate hibernateTemplate;
	
	/* 添加举报 */
	public boolean addTJub(TJub tJub) {
		try {
			hibernateTemplate.save(tJub);
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
		return true;
	}

	/* 根据jubKindId：1:用户；2:爆料；3:闲值；4:评论、jubInfoId、userId查找某个举报*/
	@SuppressWarnings("unchecked")
	public List<TJub> getJubByJubKindIdAndJubInfoIdAndUserId(Integer jubKindId, Integer jubInfoId, Integer userId) {
		String queryString = "from TJub where jubKindId = :jubKindId and jubInfoId = :jubInfoId and userId = :userId";
		String paramNames[] = {"jubKindId", "jubInfoId", "userId"};
		Integer paramValues[] = {jubKindId, jubInfoId, userId};
		List<TJub> tJubList = new ArrayList<TJub>();
		
		tJubList = (List<TJub>) hibernateTemplate.findByNamedParam(queryString, paramNames, paramValues);
		
		return tJubList;
	}
	
	/* 通过JtgShenhe的状态来查找举报*/
	public int getRowCountByJtgShenhe(Integer j_tg_shenhe) {
		String queryString = "select count(*) from TJub where JTgShenhe = "+j_tg_shenhe;
		Long rowCount = (Long) hibernateTemplate.find(queryString).listIterator().next();
		
		return rowCount.intValue();
	}
	
	/* 通过JtgShenhe的状态来查找爆料*/
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<TJub> getTJubListByPageAndJtgShenhe(Page page, final Integer j_tg_shenhe) {
		List<TJub> tJubList = new ArrayList<TJub>();
		final int pageNow = page.getPageNow();
		final int pageSize = page.getPageSize();
		
		tJubList = hibernateTemplate.execute(new HibernateCallback() {

			@Override
			public Object doInHibernate(Session session)
					throws HibernateException {
				// TODO Auto-generated method stub
				String sql = "select * from t_jub where j_tg_shenhe = "+j_tg_shenhe+" limit "+(pageNow-1)*pageSize+","+pageSize;
				
				List<TJub> tJubs = session.createSQLQuery(sql).addEntity(TJub.class).list();
				return tJubs;
			}
		});
		return tJubList;
	}
	
	@SuppressWarnings("unchecked")
	public List<TJub> getTJubByJubId(Integer jubId) {
		List<TJub> tJubList = new ArrayList<TJub>();
		String queryString = "from TJub where jubId like :jubId";
		
		tJubList = (List<TJub>) hibernateTemplate.findByNamedParam(queryString, "jubId", jubId);
		
		return tJubList;
	}
	
	public boolean updateTJub(TJub tJub) {
		try {
			hibernateTemplate.saveOrUpdate(tJub);
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
