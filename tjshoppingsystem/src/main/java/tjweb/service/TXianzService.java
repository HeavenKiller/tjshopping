package tjweb.service;



import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import tjweb.dao.TXianzDao;
import tjweb.model.Page;
import tjweb.model.TXianz;

@Service(value="tXianzService")
public class TXianzService {

	@Resource(name="tXianzDao")
	private TXianzDao tXianzDao;
	
	/* 添加闲置 */
	public boolean addTXianz(TXianz tXianz) {
		return tXianzDao.addTXianz(tXianz);
	}
	
	/* 获得闲置表最大编号 */
	public Integer getMaxXianzId() {
		return tXianzDao.getMaxXianzId();
	}
	
	public List<TXianz> getTXianzsByPage(Page page) {
		return tXianzDao.getTXianzsByPage(page);
	}
	
	public int getRowCountOfAllTXianzs() {
		return tXianzDao.getRowCountOfAllTXianzs();
	}
	
	public TXianz getTXianzByXianzId(Integer xianzId) {
		List<TXianz> tXianzList = tXianzDao.getTXianzByXianzId(xianzId);
		if (tXianzList.size() > 0) {
			return tXianzList.get(0);
		}else {
			return null;
		}
	}
	
	public List<TXianz> getTXianzsByPageAndUserIdAndXtgShenhe(Page page, final Integer userId, final Integer x_tg_shenhe) {
		return tXianzDao.getTXianzsByPageAndUserIdAndXtgShenhe(page, userId, x_tg_shenhe);
	}
	
	public int getRowCountByUserIdAndXtgShenhe(Integer userId, Integer x_tg_shenhe) {
		return tXianzDao.getRowCountByUserIdAndXtgShenhe(userId, x_tg_shenhe);
	}
	
	public List<TXianz> getTXianzListByPageAndXtgShenhe(Page page, final Integer x_tg_shenhe) {
		return tXianzDao.getTXianzListByPageAndXtgShenhe(page, x_tg_shenhe);
	}
	
	public int getRowCountByXtgShenhe(Integer x_tg_shenhe) {
		return tXianzDao.getRowCountByXtgShenhe(x_tg_shenhe);
	}
	
	public boolean updateTXianz(TXianz tXianz) {
		return tXianzDao.updateTXianz(tXianz);
	}
}
