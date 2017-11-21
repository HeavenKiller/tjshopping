package tjweb.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import tjweb.dao.TMallDao;
import tjweb.model.TMall;

/*	Repository注解Dao访问类; 
 * 	Service注解业务逻辑处理类 ;
 * 	Resource注解表示使用某个bean资源
 * */

@Service(value="tMallService")
public class TMallService {

	@Resource(name="tMallDao")
	private TMallDao tMallDao;

	public List<TMall> getTMalls() {
		return tMallDao.getTMalls();
	}
	
	public TMallDao gettMallDao() {
		return tMallDao;
	}

	public void settMallDao(TMallDao tMallDao) {
		this.tMallDao = tMallDao;
	}
}
