package tjweb.model;

import java.sql.Timestamp;

/**
 * TPunish entity. @author MyEclipse Persistence Tools
 */

public class TPunish implements java.io.Serializable {

	// Fields

	private Integer punishId;
	private Integer userId;
	private String userPReason;
	private Timestamp PBeginTime;
	private Timestamp PEndTime;

	// Constructors

	/** default constructor */
	public TPunish() {
	}

	/** minimal constructor */
	public TPunish(Integer userId) {
		this.userId = userId;
	}

	/** full constructor */
	public TPunish(Integer userId, String userPReason, Timestamp PBeginTime,
			Timestamp PEndTime) {
		this.userId = userId;
		this.userPReason = userPReason;
		this.PBeginTime = PBeginTime;
		this.PEndTime = PEndTime;
	}

	// Property accessors

	public Integer getPunishId() {
		return this.punishId;
	}

	public void setPunishId(Integer punishId) {
		this.punishId = punishId;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserPReason() {
		return this.userPReason;
	}

	public void setUserPReason(String userPReason) {
		this.userPReason = userPReason;
	}

	public Timestamp getPBeginTime() {
		return this.PBeginTime;
	}

	public void setPBeginTime(Timestamp PBeginTime) {
		this.PBeginTime = PBeginTime;
	}

	public Timestamp getPEndTime() {
		return this.PEndTime;
	}

	public void setPEndTime(Timestamp PEndTime) {
		this.PEndTime = PEndTime;
	}

}