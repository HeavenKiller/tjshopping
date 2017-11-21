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
import tjweb.model.TBaol;
import tjweb.model.TComm;

/*	Repository注解Dao访问类; 
 * 	Service注解业务逻辑处理类 ;
 * 	Resource注解表示使用某个bean资源
 * */
@Repository(value="tBaolDao")
public class TBaolDao {

	@Resource(name="hibernateTemplate")
	private HibernateTemplate hibernateTemplate;

	/* 添加爆料 */
	public boolean addTBaol(TBaol tBaol) {
		try {
			hibernateTemplate.save(tBaol);
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
		
		return true;
	}
	
	/* 获得爆料表最大编号 */
	public Integer getMaxBaolId() {
		String queryString = "select max(baolId) from TBaol";
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
	public List<TBaol> getTBaolsByPage(Page page) {
		List<TBaol> tBaolList = new ArrayList<TBaol>();
		
		final int pageNow = page.getPageNow();
		final int pageSize = page.getPageSize();
		
		tBaolList = hibernateTemplate.execute(new HibernateCallback() {

			@Override
			public Object doInHibernate(Session session)
					throws HibernateException {
				// TODO Auto-generated method stub
				String sql = "select * from t_baol limit "+(pageNow-1)*pageSize+","+pageSize;
				
				List<TBaol> tBaols = session.createSQLQuery(sql).addEntity(TBaol.class).list();
				return tBaols;
			}
		});
		
		return tBaolList;
	}
	
	public int getRowCountOfAllTBaols() {
		String queryString = "select count(*) from TBaol";
		Long rowCount = (Long) hibernateTemplate.find(queryString).listIterator().next();
		
		return rowCount.intValue();
	}
	
	/* 获得所有爆料分页信息按照降序 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<TBaol> getTBaolListByPageAndBtgShenheBelow(Page page, final Integer b_tg_shenhe) {
		List<TBaol> tBaolList = new ArrayList<TBaol>();
		
		final int pageNow = page.getPageNow();
		final int pageSize = page.getPageSize();
		
		tBaolList = hibernateTemplate.execute(new HibernateCallback() {

			@Override
			public Object doInHibernate(Session session)
					throws HibernateException {
				// TODO Auto-generated method stub
				String sql = "select * from t_baol where b_tg_shenhe="+b_tg_shenhe+" order by baol_id desc limit "+(pageNow-1)*pageSize+","+pageSize;
				
				List<TBaol> tBaols = session.createSQLQuery(sql).addEntity(TBaol.class).list();
				return tBaols;
			}
		});
		
		return tBaolList;
	}
	
	/* 获取最新各种类爆料中前4条爆料 */
	@SuppressWarnings("unchecked")
	public List<TBaol> getNewTBaolIsInTime() {
		@SuppressWarnings("rawtypes")
		List<TBaol> tBaolList = hibernateTemplate.execute(new HibernateCallback() {
			@Override
			public Object doInHibernate(Session session)
					throws HibernateException {
				// TODO Auto-generated method stub
				String sql = "SELECT b1.* FROM t_baol b1 INNER JOIN (SELECT a.kind_id, a.baol_time FROM "+ 
						"(SELECT bb.* FROM t_baol bb, t_kind k WHERE bb.kind_id = k.`kind_id` AND (k.`kind_level`=1 OR k.`kind_level`=2) AND bb.`b_tg_shenhe`=1) a LEFT JOIN t_baol b "+
						"ON a.`kind_id`=b.`kind_id` AND a.`baol_time` <= b.`baol_time` GROUP BY a.`kind_id`, a.`baol_time` HAVING COUNT(b.`baol_time`)<=4)b2 "+
						"ON b1.`kind_id`=b2.`kind_id` AND b1.`baol_time`=b2.`baol_time` ORDER BY b1.`kind_id`, b1.`baol_time` DESC;";
				List<TBaol> tBaolList = session.createSQLQuery(sql).addEntity(TBaol.class).list();
				
				return tBaolList;
			}
		});
		
//		if(tBaolList != null && tBaolList.get(0) != null){
		if(tBaolList.size() > 0){
			//System.out.println(tBaolList.get(0).getBaolTitle());
			for(TBaol tBaol : tBaolList){
				System.out.println("商品编号："+tBaol.getKindId()+" 爆料标题："+tBaol.getBaolTitle()+" 爆料时间："+tBaol.getBaolTime());
			}
			return tBaolList;
		}else {
			return null;			
		}
	}
	
	/* 获得某个用户爆料分页信息 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<TBaol> getTBaolsByPageAndUserIdAndBtgShenhe(Page page, final Integer userId, final Integer b_tg_shenhe) {
		List<TBaol> tBaolList = new ArrayList<TBaol>();
		
		final int pageNow = page.getPageNow();
		final int pageSize = page.getPageSize();
		
		tBaolList = hibernateTemplate.execute(new HibernateCallback() {

			@Override
			public Object doInHibernate(Session session)
					throws HibernateException {
				// TODO Auto-generated method stub
				String sql = "select * from t_baol where user_id = "+userId+" and b_tg_shenhe = "+b_tg_shenhe+" limit "+(pageNow-1)*pageSize+","+pageSize;
				
				List<TBaol> tBaols = session.createSQLQuery(sql).addEntity(TBaol.class).list();
				return tBaols;
			}
		});
		
		if (tBaolList.size() > 0) {
			return tBaolList;
		}else {
			return null;
		}
	}
	
	/* 获取某个用户爆料的数目 */
	public int getRowCountByUserIdAndBtgShenhe(Integer userId, Integer b_tg_shenhe) {
		String queryString = "select count(*) from TBaol where userId="+userId+" and BTgShenhe = "+b_tg_shenhe;
		Long rowCount = (Long) hibernateTemplate.find(queryString).listIterator().next();
		
		return rowCount.intValue();
	}
	
//	public int getRowCountByUserIdAndBShenhe(Integer userId) {
//		String queryString = "select count(*) from TBaol where userId="+userId+" and b_tg_shenhe = 0";
//		Long rowCount = (Long) hibernateTemplate.find(queryString).listIterator().next();
//		
//		return rowCount.intValue();
//	}
	
	/*根据商品种类kindId找到对应的爆料信息*/
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<TBaol> getTBaolsByPageAndKindIdAndBtgShenhe(Page page, final Integer kindId, final Integer b_tg_shenhe) {
		List<TBaol> tBaolList = new ArrayList<TBaol>();
		
		final int pageNow = page.getPageNow();
		final int pageSize = page.getPageSize();
		
		tBaolList = hibernateTemplate.execute(new HibernateCallback() {

			@Override
			public Object doInHibernate(Session session)
					throws HibernateException {
				// TODO Auto-generated method stub
				String sql = "select * from t_baol where kind_id = "+kindId+" and b_tg_shenhe = "+b_tg_shenhe+" limit "+(pageNow-1)*pageSize+","+pageSize;
				
				List<TBaol> tBaols = session.createSQLQuery(sql).addEntity(TBaol.class).list();
				return tBaols;
			}
		});
		return tBaolList;
	}
	
	public int getRowCountByKindIdAndBtgShenhe(Integer kindId, Integer b_tg_shenhe) {
		String queryString = "select count(*) from TBaol where kindId="+kindId+" and BTgShenhe = "+b_tg_shenhe;
		Long rowCount = (Long) hibernateTemplate.find(queryString).listIterator().next();
		
		return rowCount.intValue();
	}
	
	/*根据商城种类mallId找到对应的爆料信息*/
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<TBaol> getTBaolsByPageAndMallIdAndBtgShenhe(Page page, final Integer mallId, final Integer b_tg_shenhe) {
		List<TBaol> tBaolList = new ArrayList<TBaol>();
		
		final int pageNow = page.getPageNow();
		final int pageSize = page.getPageSize();
		
		tBaolList = hibernateTemplate.execute(new HibernateCallback() {

			@Override
			public Object doInHibernate(Session session)
					throws HibernateException {
				// TODO Auto-generated method stub
				String sql = "select * from t_baol where mall_id = "+mallId+" and b_tg_shenhe = "+b_tg_shenhe+" limit "+(pageNow-1)*pageSize+","+pageSize;
				
				List<TBaol> tBaols = session.createSQLQuery(sql).addEntity(TBaol.class).list();
				return tBaols;
			}
		});
		return tBaolList;
	}
	
	public int getRowCountByMallIdAndBtgShenhe(Integer mallId, Integer b_tg_shenhe) {
		String queryString = "select count(*) from TBaol where mallId="+mallId+" and BTgShenhe = "+b_tg_shenhe;
		Long rowCount = (Long) hibernateTemplate.find(queryString).listIterator().next();
		
		return rowCount.intValue();
	}
	
	/* 通过关键字查找爆料信息 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<TBaol> getTBaolListByKeyAndBtgShenhe(Page page, final String key, final Integer b_tg_shenhe) {
		List<TBaol> tBaolList = new ArrayList<TBaol>();
		
		final int pageNow = page.getPageNow();
		final int pageSize = page.getPageSize();
		
		tBaolList = hibernateTemplate.execute(new HibernateCallback() {

			@Override
			public Object doInHibernate(Session session)
					throws HibernateException {
				// TODO Auto-generated method stub
				String sql = "select * from t_baol where baol_title like '%"+key+"%' and b_tg_shenhe = "+b_tg_shenhe+" limit "+(pageNow-1)*pageSize+","+pageSize;
				
				List<TBaol> tBaols = session.createSQLQuery(sql).addEntity(TBaol.class).list();
				return tBaols;
			}
		});
		return tBaolList;
	}
	
	public int getRowCountByKeyAndBtgShenhe(String key, Integer b_tg_shenhe) {
		String queryString = "select count(*) from TBaol where baolTitle like '%"+key+"%' and BTgShenhe = "+b_tg_shenhe;
		
		Long rowCount =  (Long) hibernateTemplate.find(queryString).listIterator().next();
		return rowCount.intValue();
	}
	
	/* 通过BtgShenhe的状态来查找爆料*/
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<TBaol> getTBaolListByPageAndBtgShenhe(Page page, final Integer b_tg_shenhe) {
		List<TBaol> tBaolList = new ArrayList<TBaol>();
		final int pageNow = page.getPageNow();
		final int pageSize = page.getPageSize();
		
		tBaolList = hibernateTemplate.execute(new HibernateCallback() {

			@Override
			public Object doInHibernate(Session session)
					throws HibernateException {
				// TODO Auto-generated method stub
				String sql = "select * from t_baol where b_tg_shenhe = "+b_tg_shenhe+" limit "+(pageNow-1)*pageSize+","+pageSize;
				
				List<TBaol> tBaols = session.createSQLQuery(sql).addEntity(TBaol.class).list();
				return tBaols;
			}
		});
		return tBaolList;
	}
	
	public int getRowCountByBtgShenhe(Integer b_tg_shenhe) {
		String queryString = "select count(*) from TBaol where BTgShenhe = "+b_tg_shenhe;
		Long rowCount = (Long) hibernateTemplate.find(queryString).listIterator().next();
		
		return rowCount.intValue();
	}
	
	/* 通过baolPunished的状态来查找爆料*/
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<TBaol> getTBaolListByPageAndBaolPunished(Page page, final Integer baolPunished) {
		List<TBaol> tBaolList = new ArrayList<TBaol>();
		final int pageNow = page.getPageNow();
		final int pageSize = page.getPageSize();
		
		tBaolList = hibernateTemplate.execute(new HibernateCallback() {

			@Override
			public Object doInHibernate(Session session)
					throws HibernateException {
				// TODO Auto-generated method stub
				String sql = "select * from t_baol where baol_punished = "+baolPunished+" limit "+(pageNow-1)*pageSize+","+pageSize;
				
				List<TBaol> tBaols = session.createSQLQuery(sql).addEntity(TBaol.class).list();
				return tBaols;
			}
		});
		return tBaolList;
	}
	
	public int getRowCountByBaolPunished(Integer baolPunished) {
		String queryString = "select count(*) from TBaol where baol_punished = "+baolPunished;
		Long rowCount = (Long) hibernateTemplate.find(queryString).listIterator().next();
		
		return rowCount.intValue();
	}
	
	
	
	
	/* 根据爆料编号获取爆料信息 */
	@SuppressWarnings("unchecked")
	public List<TBaol> getTBaolListByBaolIdAndBtgShenhe(Integer baolId, Integer b_tg_shenhe) {
		List<TBaol> tBaolList = new ArrayList<TBaol>();
		String queryString = "from TBaol where baolId ="+baolId+" and BTgShenhe = "+b_tg_shenhe;
		
		tBaolList = (List<TBaol>) hibernateTemplate.find(queryString);
		
		return tBaolList;
	}
	
	/* 根据爆料编号获取爆料信息 */
	@SuppressWarnings("unchecked")
	public List<TBaol> getTBaolListByBaolId(Integer baolId) {
		List<TBaol> tBaolList = new ArrayList<TBaol>();
		String queryString = "from TBaol where baolId like:baolId";
		
		tBaolList = (List<TBaol>) hibernateTemplate.findByNamedParam(queryString, "baolId", baolId);
		
		return tBaolList;
	}
	
	/* 根据子评论找到父评论再找到对应的文章 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<TBaol> getTBaolListByCommId(final Integer commId) {
		List<TBaol> tBaolList = new ArrayList<>();
		
		tBaolList = hibernateTemplate.execute(new HibernateCallback() {

			@Override
			public Object doInHibernate(Session session)
					throws HibernateException {
				// TODO Auto-generated method stub
				
				String sql = "SELECT * FROM (SELECT b.art_id FROM (SELECT t_comm.`comm_parent` FROM t_comm WHERE comm_id="+commId+")a, t_comm b WHERE b.`comm_id` = a.comm_parent)c, t_baol d WHERE d.`baol_id`=c.art_id";
				
				List<TBaol> tBaols = session.createSQLQuery(sql).addEntity(TBaol.class).list();
				
				return tBaols;
			}
		});
		
		return tBaolList;
	}
	
	
	public boolean updateTBaol(TBaol tBaol) {
		try {
			hibernateTemplate.saveOrUpdate(tBaol);
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
