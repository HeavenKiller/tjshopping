package tjweb.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import tjweb.model.TKind;

/*	Repository注解Dao访问类; 
 * 	Service注解业务逻辑处理类 ;
 * 	Resource注解表示使用某个bean资源
 * */
@Repository(value="tKindDao")
public class TKindDao {

	@Resource(name="hibernateTemplate")
	private HibernateTemplate hibernateTemplate;
	
	/* 根据商品级别获取商品分类信息按照搜索数排降序  */
	@SuppressWarnings("unchecked")
	public List<TKind> getTKindByKindLevel(Integer kindLevel) {
		List<TKind> tKindList = new ArrayList<TKind>();
		String queryString = "from TKind where kindLevel =:kindLevel order by searchNum desc";
		
		tKindList = (List<TKind>) hibernateTemplate.findByNamedParam(queryString, "kindLevel", kindLevel);
		return tKindList;
	}
	
	/* 获取全部分类 */
	public List<TKind> getAllKinds() {
		List<TKind> tKindList = new ArrayList<TKind>();
		
		tKindList = (List<TKind>) hibernateTemplate.loadAll(TKind.class);
		
		return tKindList;		
	}
	

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	
}
