package tjweb.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import tjweb.model.TMall;
/*	Repository注解Dao访问类; 
 * 	Service注解业务逻辑处理类 ;
 * 	Resource注解表示使用某个bean资源
 * */

@Repository(value="tMallDao")
public class TMallDao {
	
	@Resource(name="hibernateTemplate")
	private HibernateTemplate hibernateTemplate;
	
	public List<TMall> getTMalls() {
		List<TMall> tMallList = new ArrayList<TMall>();
		tMallList = (List<TMall>) hibernateTemplate.loadAll(TMall.class);
		
		return tMallList;
	}

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
}
