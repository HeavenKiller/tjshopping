package tjweb.model;

import java.sql.Timestamp;

/**
 * TUser entity. @author MyEclipse Persistence Tools
 */

public class TUser implements java.io.Serializable {

	// Fields

	private Integer userId;
	private String nickname;
	private String password;
	private String email;
	private String tel;
	private Timestamp lastLoginTime;
	private Timestamp lastSignTime;
	private String lastLoginIp;
	private Integer userLevel;
	private Integer userPunished;

	// Constructors

	/** default constructor */
	public TUser() {
	}

	/** full constructor */
	public TUser(String nickname, String password, String email, String tel,
			Timestamp lastLoginTime, Timestamp lastSignTime,
			String lastLoginIp, Integer userLevel, Integer userPunished) {
		this.nickname = nickname;
		this.password = password;
		this.email = email;
		this.tel = tel;
		this.lastLoginTime = lastLoginTime;
		this.lastSignTime = lastSignTime;
		this.lastLoginIp = lastLoginIp;
		this.userLevel = userLevel;
		this.userPunished = userPunished;
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

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Timestamp getLastLoginTime() {
		return this.lastLoginTime;
	}

	public void setLastLoginTime(Timestamp lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	public Timestamp getLastSignTime() {
		return this.lastSignTime;
	}

	public void setLastSignTime(Timestamp lastSignTime) {
		this.lastSignTime = lastSignTime;
	}

	public String getLastLoginIp() {
		return this.lastLoginIp;
	}

	public void setLastLoginIp(String lastLoginIp) {
		this.lastLoginIp = lastLoginIp;
	}

	public Integer getUserLevel() {
		return this.userLevel;
	}

	public void setUserLevel(Integer userLevel) {
		this.userLevel = userLevel;
	}

	public Integer getUserPunished() {
		return this.userPunished;
	}

	public void setUserPunished(Integer userPunished) {
		this.userPunished = userPunished;
	}

}