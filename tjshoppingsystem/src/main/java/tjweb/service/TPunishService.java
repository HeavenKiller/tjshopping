package tjweb.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import tjweb.dao.TPunishDao;
import tjweb.model.Page;
import tjweb.model.TPunish;

@Service(value="tPunishService")
public class TPunishService {

	@Resource(name="tPunishDao")
	private TPunishDao tPunishDao;
	
	public boolean addTPunished(TPunish tPunish) {
		return tPunishDao.addTPunished(tPunish);
	}
	
	public TPunish getPunishByUserId(Integer userId) {
		List<TPunish> tPunishList = tPunishDao.getPunishListByUserId(userId);
		
		if (tPunishList.size() > 0) {
			return tPunishList.get(0);
		}else {
			return null;
		}
	}
	
	public List<TPunish> getTPunishListByPage(Page page) {
		return tPunishDao.getTPunishListByPage(page);
	}
	
	public int getRowCountOfAllTPunishs() {
		return tPunishDao.getRowCountOfAllTPunishs();
	}
}
