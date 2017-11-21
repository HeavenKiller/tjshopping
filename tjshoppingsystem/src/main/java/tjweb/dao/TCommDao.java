package tjweb.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import tjweb.model.Page;
import tjweb.model.TComm;

/*	Repository注解Dao访问类; 
 * 	Service注解业务逻辑处理类 ;
 * 	Resource注解表示使用某个bean资源
 * */
@Repository(value="tCommDao")
public class TCommDao {

	@Resource(name="hibernateTemplate")
	private HibernateTemplate hibernateTemplate;

	public boolean addTComm(TComm tComm) {
		try {
			hibernateTemplate.save(tComm);
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
		
		return true;
	}
	
	@SuppressWarnings("unchecked")
	public List<TComm> getTCommListByCommId(Integer commId) {
		List<TComm> tCommList = new ArrayList<TComm>();
		//String queryString = "from TComm where commId like:commId";
		String queryString = "from TComm where comm_punished = 1 and commId like:commId";
		tCommList = (List<TComm>) hibernateTemplate.findByNamedParam(queryString, "commId", commId);
		
		return tCommList;
	}
	
	@SuppressWarnings("unchecked")
	public List<TComm> getTCommListByUserIdAndArtKindId(Integer userIdOne, Integer artKindId) {
		List<TComm> tCommList = new ArrayList<TComm>();
		String queryString = "from TComm where comm_punished = 1 and userIdOne = "+userIdOne+" and artKindId = "+artKindId;
		
		tCommList = (List<TComm>) hibernateTemplate.find(queryString);
		
		return tCommList;
	}
	
	/* 获得评论的总条数，不包括子评论 */
	public int getRowCount(Integer artKindId, Integer artId) {
		String queryString = "select count(*) from TComm where comm_punished = 1 and artKindId = "+artKindId+" and artId = "+artId;
		Long rowCount = (Long) hibernateTemplate.find(queryString).listIterator().next();
		
		return rowCount.intValue();
	}
	
	/* 获得某个用户的评论数 */
	public int getRowCountByUserId(Integer userId) {
		String queryString = "select count(*) from TComm where comm_punished = 1 and userIdOne = "+userId;
		Long rowCount = (Long) hibernateTemplate.find(queryString).listIterator().next();
		
		return rowCount.intValue();
	}
	
	/* 获得某个用户的消息数 */
	@SuppressWarnings("unchecked")
	public int getRowCountByUserIdOther(Integer userIdOther) {
		String queryStringOne = "from TComm where comm_punished = 1 and commParent != 1 and userIdOne ="+userIdOther;
		String queryStringOther = "from TComm where comm_punished = 1 and commParent != 1 and userIdOther ="+userIdOther;
		List<TComm> tCommList = new ArrayList<TComm>();
		List<TComm> tCommListOne = (List<TComm>) hibernateTemplate.find(queryStringOne);
		List<TComm> tCommListOther = (List<TComm>) hibernateTemplate.find(queryStringOther);
		
		if (tCommListOne.size() > 0 && tCommListOther.size() > 0) {
			
			for (TComm tCommOther : tCommListOther) {
				int num = 0;
				for (TComm tCommOne : tCommListOne) {
					if (tCommOther.getUserIdOne().intValue() == tCommOne.getUserIdOther().intValue() && tCommOther.getCommId().intValue() == tCommOne.getArtId().intValue()) {
						num++;
					}
				}
				
				if (num == 0) {
					tCommList.add(tCommOther);
				}
			}
			return tCommList.size();
		}else {
			return tCommListOther.size();
		}
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<TComm> getTCommsByPage(Page page, final Integer artKindId, final Integer artId) {
		List<TComm> tCommList = new ArrayList<TComm>();
		final int pageNow = page.getPageNow();
		final int pageSize = page.getPageSize();
		tCommList = hibernateTemplate.execute(new HibernateCallback() {

			@Override
			public Object doInHibernate(Session session)
					throws HibernateException {
				// TODO Auto-generated method stub
				String sql = "select b.* from t_comm b, (select * from t_comm where comm_punished = 1 and " +
						"art_kind_id = "+artKindId+" and art_id = "+artId+" limit "+(pageNow-1)*pageSize+","+pageSize+") a " +
								"where (b.art_kind_id = 4 and b.comm_parent = a.comm_id) or (b.art_kind_id = 2 and b.comm_id = a.comm_id) order by b.comm_time desc";
				List<TComm> tComms = session.createSQLQuery(sql).addEntity(TComm.class).list();
				return tComms;
			}
		});
		
		return tCommList;
	}
	
	@SuppressWarnings("unchecked")
	public List<TComm> getCommsForUserByPageAndUserId(Page page, Integer userId) {
		List<TComm> tCommList = new ArrayList<>();
		
		String queryStringOne = "from TComm where comm_punished = 1 and commParent != 1 and userIdOne ="+userId;
		String queryStringOther = "from TComm where comm_punished = 1 and commParent != 1 and userIdOther ="+userId;
		
		List<TComm> tCommListOne = (List<TComm>) hibernateTemplate.find(queryStringOne);
		List<TComm> tCommListOther = (List<TComm>) hibernateTemplate.find(queryStringOther);
		
		if (tCommListOne.size() > 0 && tCommListOther.size() > 0) {
			
			for (TComm tCommOther : tCommListOther) {
				int num = 0;
				for (TComm tCommOne : tCommListOne) {
					if (tCommOther.getUserIdOne().intValue() == tCommOne.getUserIdOther().intValue() && tCommOther.getCommId().intValue() == tCommOne.getArtId().intValue()) {
						num++;
					}
				}
				System.out.println(num);
				System.out.println();
				if (num == 0) {
					tCommList.add(tCommOther);
				}
			}
			return tCommList;
		}else {
			return tCommListOther;
		}
	}
	
	/* 获取某个用户的评论 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<TComm> getTCommsByPageAndUserId(Page page, final Integer userId) {
		List<TComm> tCommList = new ArrayList<TComm>();
		final int pageNow = page.getPageNow();
		final int pageSize = page.getPageSize();
		tCommList = hibernateTemplate.execute(new HibernateCallback() {

			@Override
			public Object doInHibernate(Session session)
					throws HibernateException {
				// TODO Auto-generated method stub
				String sql = "select * from t_comm where comm_punished = 1 and " +
						"user_id_one = "+userId+" limit "+(pageNow-1)*pageSize+","+pageSize;
				List<TComm> tComms = session.createSQLQuery(sql).addEntity(TComm.class).list();
				return tComms;
			}
		});
		return tCommList;
	}
	
	/* 获得评论表最大编号 */
	public Integer getMaxCommId() {
		String queryString = "select max(commId) from TComm";
		@SuppressWarnings("unchecked")
		List<Integer> iList =  (List<Integer>) hibernateTemplate.find(queryString);
		if(iList != null && iList.get(0) != null){
			return iList.get(0);
		}else {
			return 0;			
		}
	}
	
	public boolean updateTComm(TComm tComm) {
		try {
			hibernateTemplate.saveOrUpdate(tComm);
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
