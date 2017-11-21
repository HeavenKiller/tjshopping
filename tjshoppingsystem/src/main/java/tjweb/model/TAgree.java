package tjweb.model;

import java.sql.Timestamp;

/**
 * TAgree entity. @author MyEclipse Persistence Tools
 */

public class TAgree implements java.io.Serializable {

	// Fields

	private Integer agreeId;
	private Integer userId;
	private Integer agreeKindId;
	private Integer agreeInfoId;
	private Timestamp agreeTime;
	private Integer isOrNot;

	// Constructors

	/** default constructor */
	public TAgree() {
	}

	/** minimal constructor */
	public TAgree(Integer userId) {
		this.userId = userId;
	}

	/** full constructor */
	public TAgree(Integer userId, Integer agreeKindId, Integer agreeInfoId,
			Timestamp agreeTime, Integer isOrNot) {
		this.userId = userId;
		this.agreeKindId = agreeKindId;
		this.agreeInfoId = agreeInfoId;
		this.agreeTime = agreeTime;
		this.isOrNot = isOrNot;
	}

	// Property accessors

	public Integer getAgreeId() {
		return this.agreeId;
	}

	public void setAgreeId(Integer agreeId) {
		this.agreeId = agreeId;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getAgreeKindId() {
		return this.agreeKindId;
	}

	public void setAgreeKindId(Integer agreeKindId) {
		this.agreeKindId = agreeKindId;
	}

	public Integer getAgreeInfoId() {
		return this.agreeInfoId;
	}

	public void setAgreeInfoId(Integer agreeInfoId) {
		this.agreeInfoId = agreeInfoId;
	}

	public Timestamp getAgreeTime() {
		return this.agreeTime;
	}

	public void setAgreeTime(Timestamp agreeTime) {
		this.agreeTime = agreeTime;
	}

	public Integer getIsOrNot() {
		return this.isOrNot;
	}

	public void setIsOrNot(Integer isOrNot) {
		this.isOrNot = isOrNot;
	}

}