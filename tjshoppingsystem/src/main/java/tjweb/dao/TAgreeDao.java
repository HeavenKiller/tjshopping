package tjweb.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import tjweb.model.TAgree;

/*	Repository注解Dao访问类; 
 * 	Service注解业务逻辑处理类 ;
 * 	Resource注解表示使用某个bean资源
 * */
@Repository(value="tAgreeDao")
public class TAgreeDao {

	@Resource(name="hibernateTemplate")
	private HibernateTemplate hibernateTemplate;
	
	/* 添加点赞 */
	public boolean addTAgree(TAgree tAgree) {
		try {
			hibernateTemplate.save(tAgree);
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
		return true;
	}

	/* 根据agreeKindId：1:用户；2:爆料；3:闲值；4:评论、agreeInfoId、userId查找某个点赞信息*/
	@SuppressWarnings("unchecked")
	public List<TAgree> getAgreeByAgreeKindIdAndAgreeInfoIdAndUserId(Integer agreeKindId, Integer agreeInfoId, Integer userId) {
		String queryString = "from TAgree where agreeKindId = :agreeKindId and agreeInfoId = :agreeInfoId and userId = :userId";
		String paramNames[] = {"agreeKindId", "agreeInfoId", "userId"};
		Integer paramValues[] = {agreeKindId, agreeInfoId, userId};
		List<TAgree> tAgreeList = new ArrayList<TAgree>();
		
		tAgreeList = (List<TAgree>) hibernateTemplate.findByNamedParam(queryString, paramNames, paramValues);
		
		return tAgreeList;
	}

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
}
