package tjweb.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Service;

import tjweb.dao.TJubDao;
import tjweb.model.Page;
import tjweb.model.TJub;

/*	Repository注解Dao访问类; 
 * 	Service注解业务逻辑处理类 ;
 * 	Resource注解表示使用某个bean资源
 * */

@Service(value="tJubService")
public class TJubService {
	@Resource(name="tJubDao")
	private TJubDao tJubDao;
	
	/* 添加举报*/
	public boolean addTJub(TJub tJub) {
		return tJubDao.addTJub(tJub);
	}
	
	/* 根据jubKindId：1:用户；2:爆料；3:闲值；4:评论、jubInfoId、userId查找某个举报*/
	public TJub getJubByJubKindIdAndJubInfoIdAndUserId(Integer jubKindId, Integer jubInfoId, Integer userId) {
		List<TJub> tJubList = tJubDao.getJubByJubKindIdAndJubInfoIdAndUserId(jubKindId, jubInfoId, userId);
		
		if (tJubList.size() > 0) {
			return tJubList.get(0);
		}else {
			return null;
		}
	}
	
	public List<TJub> getTJubListByPageAndXtgShenhe(Page page, final Integer j_tg_shenhe) {
		return tJubDao.getTJubListByPageAndJtgShenhe(page, j_tg_shenhe);
	}
	
	public int getRowCountByJtgShenhe(Integer j_tg_shenhe) {
		return tJubDao.getRowCountByJtgShenhe(j_tg_shenhe);
	}
	
	public TJub getTJubByJubId(Integer jubId) {
		List<TJub> tJubList = tJubDao.getTJubByJubId(jubId);
		if (tJubList.size() > 0) {
			return tJubList.get(0);
		}else {
			return null;
		}
	}
	
	public boolean updateTJub(TJub tJub) {
		return tJubDao.updateTJub(tJub);
	}
	
	public TJubDao gettJubDao() {
		return tJubDao;
	}

	public void settJubDao(TJubDao tJubDao) {
		this.tJubDao = tJubDao;
	}
}
