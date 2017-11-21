package tjweb.model;

/**
 * TUserInfo entity. @author MyEclipse Persistence Tools
 */

public class TUserInfo implements java.io.Serializable {

	// Fields

	private Integer userId;
	private String nickname;
	private String userImg;
	private Integer credit;
	private Integer exp;
	private Integer level;
	private String intro;
	private Integer baolNum;
	private Integer xianzNum;
	private Integer commNum;
	private Integer shoucNum;

	// Constructors

	/** default constructor */
	public TUserInfo() {
	}
	
	/* */
	public TUserInfo(Integer credit,
			Integer exp, Integer level, Integer baolNum,
			Integer xianzNum, Integer commNum, Integer shoucNum) {
		this.credit = credit;
		this.exp = exp;
		this.level = level;
		this.baolNum = baolNum;
		this.xianzNum = xianzNum;
		this.commNum = commNum;
		this.shoucNum = shoucNum;
	}
	
	
	/** full constructor */
	public TUserInfo(String nickname, String userImg, Integer credit,
			Integer exp, Integer level, String intro, Integer baolNum,
			Integer xianzNum, Integer commNum, Integer shoucNum) {
		this.nickname = nickname;
		this.userImg = userImg;
		this.credit = credit;
		this.exp = exp;
		this.level = level;
		this.intro = intro;
		this.baolNum = baolNum;
		this.xianzNum = xianzNum;
		this.commNum = commNum;
		this.shoucNum = shoucNum;
	}

	// Property accessors

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getNickname() {
		return this.nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getUserImg() {
		return this.userImg;
	}

	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}

	public Integer getCredit() {
		return this.credit;
	}

	public void setCredit(Integer credit) {
		this.credit = credit;
	}

	public Integer getExp() {
		return this.exp;
	}

	public void setExp(Integer exp) {
		this.exp = exp;
	}

	public Integer getLevel() {
		return this.level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public String getIntro() {
		return this.intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public Integer getBaolNum() {
		return this.baolNum;
	}

	public void setBaolNum(Integer baolNum) {
		this.baolNum = baolNum;
	}

	public Integer getXianzNum() {
		return this.xianzNum;
	}

	public void setXianzNum(Integer xianzNum) {
		this.xianzNum = xianzNum;
	}

	public Integer getCommNum() {
		return this.commNum;
	}

	public void setCommNum(Integer commNum) {
		this.commNum = commNum;
	}

	public Integer getShoucNum() {
		return this.shoucNum;
	}

	public void setShoucNum(Integer shoucNum) {
		this.shoucNum = shoucNum;
	}

}