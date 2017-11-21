package tjweb.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.tags.EscapeBodyTag;

import tjweb.dao.TShoucDao;
import tjweb.model.Page;
import tjweb.model.TShouc;

/*	Repository注解Dao访问类; 
 * 	Service注解业务逻辑处理类 ;
 * 	Resource注解表示使用某个bean资源
 * */
@Service(value="tShoucService")
public class TShoucService {
	
	@Resource(name="tShoucDao")
	private TShoucDao tShoucDao;
	
	public boolean addTShouc(TShouc tShouc) {
		return tShoucDao.addTShouc(tShouc);
	}
	
	public TShouc getShoucByArtKindIdAndArtIdAndUserId(Integer artKindId, Integer artId, Integer userId) {
		List<TShouc> tShoucList = new ArrayList<TShouc>();
		
		tShoucList = tShoucDao.getShoucByArtKindIdAndArtIdAndUserId(artKindId, artId, userId);
		if (tShoucList.size() > 0) {
			return tShoucList.get(0);
		}else {
			return null;
		}
	}
	
	public int getRowCountByUserId(Integer userId) {
		return tShoucDao.getRowCountByUserId(userId);
	}
	
	public List<TShouc> getTShoucsByPageAndUserId(Page page, Integer userId) {
		return tShoucDao.getTShoucsByPageAndUserId(page, userId);
	}
	
	public TShouc getTShoucByShoucId(Integer shoucId) {
		List<TShouc> tShoucs = tShoucDao.getTShoucByShoucId(shoucId);
		
		if (tShoucs.size() > 0) {
			return tShoucs.get(0);
		}else {
			return null;
		}
	}
	
	public boolean deleteTShouc(TShouc tShouc) {
		return tShoucDao.deleteTShouc(tShouc);
	}

	public boolean deleteTShoucByShoucId(Integer shoucId) {
		return tShoucDao.deleteTShoucByShoucId(shoucId);
	}
	
	public TShoucDao gettShoucDao() {
		return tShoucDao;
	}

	public void settShoucDao(TShoucDao tShoucDao) {
		this.tShoucDao = tShoucDao;
	}
}
