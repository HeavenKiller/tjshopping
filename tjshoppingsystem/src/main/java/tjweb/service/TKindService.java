package tjweb.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import tjweb.dao.TKindDao;
import tjweb.model.TKind;

@Service(value="tKindService")
public class TKindService {

	@Resource(name="tKindDao")
	private TKindDao tKindDao;
	
	public List<TKind> getTKindByKindLevel(Integer kindLevel) {
		return tKindDao.getTKindByKindLevel(kindLevel);
	}
	
	public List<TKind> getAllKinds() {
		return tKindDao.getAllKinds();
	}

	public TKindDao gettKindDao() {
		return tKindDao;
	}

	public void settKindDao(TKindDao tKindDao) {
		this.tKindDao = tKindDao;
	}
	
	
	
}
