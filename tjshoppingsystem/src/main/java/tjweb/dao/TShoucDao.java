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
import tjweb.model.TShouc;

/*	Repository注解Dao访问类; 
 * 	Service注解业务逻辑处理类 ;
 * 	Resource注解表示使用某个bean资源
 * */
@Repository(value="tShoucDao")
public class TShoucDao {

	@Resource(name="hibernateTemplate")
	private HibernateTemplate hibernateTemplate;
	
	/* 收藏 */
	public boolean addTShouc(TShouc tShouc) {
		try {
			hibernateTemplate.save(tShouc);
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
		
		return true;
	}
	/* 根据artKindId：1:用户；2:爆料；3:闲值；4:评论、artId、userId查找某个收藏信息 */
	@SuppressWarnings("unchecked")
	public List<TShouc> getShoucByArtKindIdAndArtIdAndUserId(Integer artKindId, Integer artId, Integer userId) {
		String queryString = "from TShouc where artKindId = :artKindId and artId = :artId and userId = :userId";
		String paramNames[] = {"artKindId", "artId", "userId"};
		Integer paramValues[] = {artKindId, artId, userId};
		List<TShouc> tShoucList = new ArrayList<TShouc>(); 
		
		tShoucList = (List<TShouc>) hibernateTemplate.findByNamedParam(queryString, paramNames, paramValues);
		
		return tShoucList;
	}
	
	/* 根据用户编号获得用户的总收藏数 */
	public int getRowCountByUserId(Integer userId) {
		String queryString = "select count(*) from TShouc where userId = "+userId;
		
		Long rowCount = (Long) hibernateTemplate.find(queryString).listIterator().next();
		
		return rowCount.intValue();
	}
	
	/* 将用户收藏的文章分页显示出来 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<TShouc> getTShoucsByPageAndUserId(Page page, final Integer userId) {
		List<TShouc> tShoucList = new ArrayList<>();
		final int pageNow = page.getPageNow();
		final int pageSize = page.getPageSize();
		
		tShoucList = hibernateTemplate.execute(new HibernateCallback() {

			@Override
			public Object doInHibernate(Session session)
					throws HibernateException {
				// TODO Auto-generated method stub
				String sql = "select * from t_shouc where user_id = "+userId+" limit "+(pageNow-1)*pageSize+","+pageSize;
				List<TShouc> tShoucs = session.createSQLQuery(sql).addEntity(TShouc.class).list();
				
				return tShoucs;
			}
		});
		
		return tShoucList;
	}
	
	/* 取消收藏 */
	public boolean deleteTShouc(TShouc tShouc) {
		try {
			List<TShouc> tShoucList = new ArrayList<TShouc>();
			TShouc newTShouc;
			tShoucList = getShoucByArtKindIdAndArtIdAndUserId(tShouc.getArtKindId(), tShouc.getArtId(), tShouc.getUserId());
			if (tShoucList.size() > 0) {
				newTShouc = tShoucList.get(0);
			}else {
				newTShouc = null;
			}
			hibernateTemplate.delete(newTShouc);
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
		
		return true;
	}
	
	public List<TShouc> getTShoucByShoucId(Integer shoucId) {
		String queryString = "from TShouc where shoucId = "+shoucId;
		
		@SuppressWarnings("unchecked")
		List<TShouc> tShoucList = (List<TShouc>) hibernateTemplate.find(queryString);
		
		return tShoucList;
	}
	
	public boolean deleteTShoucByShoucId(Integer shoucId) {
		try {
			List<TShouc> tShoucs = getTShoucByShoucId(shoucId);
			TShouc tShouc = new TShouc();
			
			if (tShoucs.size() > 0) {
				tShouc = tShoucs.get(0);
			}else {
				tShouc = null;
			}
			hibernateTemplate.delete(tShouc);
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
