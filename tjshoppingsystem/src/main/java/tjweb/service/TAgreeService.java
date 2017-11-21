package tjweb.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import tjweb.dao.TAgreeDao;
import tjweb.model.TAgree;

/*	Repository注解Dao访问类; 
 * 	Service注解业务逻辑处理类 ;
 * 	Resource注解表示使用某个bean资源
 * */
@Service(value="tAgreeService")
public class TAgreeService {
	
	@Resource(name = "tAgreeDao")
	private TAgreeDao tAgreeDao;
	
	/* 添加点赞 */
	public boolean addTAgree(TAgree tAgree) {
		return tAgreeDao.addTAgree(tAgree);
	}
	
	/* 根据agreeKindId：1:用户；2:爆料；3:闲值；4:评论、agreeInfoId、userId查找某个点赞信息*/
	public TAgree getAgreeByAgreeKindIdAndAgreeInfoIdAndUserId(Integer agreeKindId, Integer agreeInfoId, Integer userId) {
		List<TAgree> tAgreeList = new ArrayList<TAgree>();
		tAgreeList = tAgreeDao.getAgreeByAgreeKindIdAndAgreeInfoIdAndUserId(agreeKindId, agreeInfoId, userId);
		
		if (tAgreeList.size() > 0) {
			return tAgreeList.get(0);
		}else {
			return null;
		}
	}

	public TAgreeDao gettAgreeDao() {
		return tAgreeDao;
	}

	public void settAgreeDao(TAgreeDao tAgreeDao) {
		this.tAgreeDao = tAgreeDao;
	}
}
