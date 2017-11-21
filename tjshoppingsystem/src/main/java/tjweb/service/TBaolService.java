package tjweb.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import tjweb.dao.TBaolDao;
import tjweb.model.Page;
import tjweb.model.TBaol;
import tjweb.model.TComm;

/*	Repository注解Dao访问类; 
 * 	Service注解业务逻辑处理类 ;
 * 	Resource注解表示使用某个bean资源
 * */
@Service(value="tBaolService")
public class TBaolService {

	@Resource(name="tBaolDao")
	private TBaolDao tBaolDao;

	public boolean addTBaol(TBaol tBaol) {
		return tBaolDao.addTBaol(tBaol);
	}
	
	public Integer getMaxBaolId() {
		return tBaolDao.getMaxBaolId();
	}
	
	public int getRowCountOfAllTBaols() {
		return tBaolDao.getRowCountOfAllTBaols();
	}
	
	public List<TBaol> getTBaolsByPage(Page page) {
		return tBaolDao.getTBaolsByPage(page);
	}
	
	public List<TBaol> getNewTBaolIsInTime() {
		return tBaolDao.getNewTBaolIsInTime();
	}
	
	public TBaol getTBaolListByBaolIdAndBtgShenhe(Integer baolId, Integer b_tg_shenhe) {
		List<TBaol> tBaolList = tBaolDao.getTBaolListByBaolIdAndBtgShenhe(baolId, b_tg_shenhe);
		
		if (tBaolList.size() > 0) {
			return tBaolList.get(0);
		}else {
			return null;
		}
	}
	
	public TBaol getTBaolListByBaolId(Integer baolId) {
		List<TBaol> tBaolList = tBaolDao.getTBaolListByBaolId(baolId);
		
		if (tBaolList.size() > 0) {
			return tBaolList.get(0);
		}else {
			return null;
		}
	}
	
	public TBaol getTBaolListByCommId(Integer commId) {
		List<TBaol> tBaolList = tBaolDao.getTBaolListByCommId(commId);
		
		if (tBaolList.size() > 0) {
			System.out.println("getTBaolListByCommArtKindIdAndArtIdAndUserIdOne不为空");
			return tBaolList.get(0);
		}else {
			System.out.println("getTBaolListByCommArtKindIdAndArtIdAndUserIdOne空");
			return null;
		}
	}
	
	public List<TBaol> getTBaolsByPageAndUserIdAndBtgShenhe(Page page, Integer userId, Integer b_tg_shenhe) {
		return tBaolDao.getTBaolsByPageAndUserIdAndBtgShenhe(page, userId, b_tg_shenhe);
	}
	
	public int getRowCountByUserIdAndBtgShenhe(Integer userId, Integer b_tg_shenhe) {
		return tBaolDao.getRowCountByUserIdAndBtgShenhe(userId, b_tg_shenhe);
	}
	
	public List<TBaol> getTBaolsByPageAndKindIdAndBtgShenhe(Page page, final Integer kindId, final Integer b_tg_shenhe) {
		return tBaolDao.getTBaolsByPageAndKindIdAndBtgShenhe(page, kindId, b_tg_shenhe);
	}
	
	public int getRowCountByKindIdAndBtgShenhe(Integer kindId, Integer b_tg_shenhe) {
		return tBaolDao.getRowCountByKindIdAndBtgShenhe(kindId, b_tg_shenhe);
	}
	
	public List<TBaol> getTBaolListByKeyAndBtgShenhe(Page page, final String key, final Integer b_tg_shenhe) {
		return tBaolDao.getTBaolListByKeyAndBtgShenhe(page, key, b_tg_shenhe);
	}
	
	public int getRowCountByKeyAndBtgShenhe(String key, Integer b_tg_shenhe) {
		return tBaolDao.getRowCountByKeyAndBtgShenhe(key, b_tg_shenhe);
	}
	
	public List<TBaol> getTBaolsByPageAndMallIdAndBtgShenhe(Page page, final Integer mallId, final Integer b_tg_shenhe) {
		return tBaolDao.getTBaolsByPageAndMallIdAndBtgShenhe(page, mallId, b_tg_shenhe);
	}
	
	public int getRowCountByMallIdAndBtgShenhe(Integer mallId, Integer b_tg_shenhe) {
		return tBaolDao.getRowCountByMallIdAndBtgShenhe(mallId, b_tg_shenhe);
	}
	
	public List<TBaol> getTBaolListByPageAndBtgShenhe(Page page, final Integer b_tg_shenhe) {
		return tBaolDao.getTBaolListByPageAndBtgShenhe(page, b_tg_shenhe);
	}
	
	public int getRowCountByBtgShenhe(Integer b_tg_shenhe) {
		return tBaolDao.getRowCountByBtgShenhe(b_tg_shenhe);
	}
	
	public List<TBaol> getTBaolListByPageAndBtgShenheBelow(Page page, final Integer b_tg_shenhe) {
		return tBaolDao.getTBaolListByPageAndBtgShenheBelow(page, b_tg_shenhe);
	}
	
//	public List<TBaol> getTBaolListByPageAndBaolPunished(Page page, final Integer baolPunished) {
//		return tBaolDao.getTBaolListByPageAndBaolPunished(page, baolPunished);
//	}
	
//	public int getRowCountByBaolPunished(Integer baolPunished) {
//		return tBaolDao.getRowCountByBaolPunished(baolPunished);
//	}
	
	public boolean updateTBaol(TBaol tBaol) {
		return tBaolDao.updateTBaol(tBaol);
	}
	
	public TBaolDao gettBaolDao() {
		return tBaolDao;
	}

	public void settBaolDao(TBaolDao tBaolDao) {
		this.tBaolDao = tBaolDao;
	}
}
