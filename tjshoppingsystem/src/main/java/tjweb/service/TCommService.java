package tjweb.service;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import tjweb.dao.TCommDao;
import tjweb.model.Page;
import tjweb.model.TComm;

/*	Repository注解Dao访问类; 
 * 	Service注解业务逻辑处理类 ;
 * 	Resource注解表示使用某个bean资源
 * */
@Service(value="tCommService")
public class TCommService {

	@Resource(name="tCommDao")
	private TCommDao tCommDao;
	
	public boolean addTComm(TComm tComm) {
		return tCommDao.addTComm(tComm);
	}
	
	public TComm getTCommByCommId(Integer commId){
		List<TComm> tCommList = tCommDao.getTCommListByCommId(commId);
		
		if (tCommList.size() > 0) {
			return tCommList.get(0);
		}else {
			return null;
		}
	}
	
	public List<TComm> getTCommListByUserIdAndArtKindId(Integer userIdOne, Integer artKindId) {
		return tCommDao.getTCommListByUserIdAndArtKindId(userIdOne, artKindId);
	}
	
	public int getRowCount(Integer artKindId, Integer artId) {
		return tCommDao.getRowCount(artKindId, artId);
	}
	
	public int getRowCountByUserId(Integer userId) {
		return tCommDao.getRowCountByUserId(userId);
	}
	
	public List<TComm> getTCommsByPageAndUserId(Page page, Integer userId){
		return tCommDao.getTCommsByPageAndUserId(page, userId);
	}
	
	public List<TComm> getTCommsByPage(Page page, Integer artKindId, Integer artId) {
		return tCommDao.getTCommsByPage(page, artKindId, artId);
	}
	
	public List<TComm> getCommsForUserByPageAndUserId(Page page, Integer userId) {
		return tCommDao.getCommsForUserByPageAndUserId(page, userId);
	}
	
	public int getRowCountByUserIdOther(Integer userIdOther) {
		return tCommDao.getRowCountByUserIdOther(userIdOther);
	}
	
	public Integer getMaxCommId() {
		return tCommDao.getMaxCommId();
	}

	public boolean updateTComm(TComm tComm){
		return tCommDao.updateTComm(tComm);
	}
	
	public TCommDao gettCommDao() {
		return tCommDao;
	}

	public void settCommDao(TCommDao tCommDao) {
		this.tCommDao = tCommDao;
	}
}
