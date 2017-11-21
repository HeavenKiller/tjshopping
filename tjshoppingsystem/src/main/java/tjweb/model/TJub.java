package tjweb.model;

import java.sql.Timestamp;

/**
 * TJub entity. @author MyEclipse Persistence Tools
 */

public class TJub implements java.io.Serializable {

	// Fields

	private Integer jubId;
	private Integer jubKindId;
	private Integer jubInfoId;
	private String jubReason;
	private Timestamp jubTime;
	private Integer userId;
	private Integer JTgShenhe;
	private String JBtgReason;

	// Constructors

	/** default constructor */
	public TJub() {
	}

	/** minimal constructor */
	public TJub(Integer jubInfoId, Integer userId) {
		this.jubInfoId = jubInfoId;
		this.userId = userId;
	}

	/** full constructor */
	public TJub(Integer jubKindId, Integer jubInfoId, String jubReason,
			Timestamp jubTime, Integer userId, Integer JTgShenhe,
			String JBtgReason) {
		this.jubKindId = jubKindId;
		this.jubInfoId = jubInfoId;
		this.jubReason = jubReason;
		this.jubTime = jubTime;
		this.userId = userId;
		this.JTgShenhe = JTgShenhe;
		this.JBtgReason = JBtgReason;
	}

	// Property accessors

	public Integer getJubId() {
		return this.jubId;
	}

	public void setJubId(Integer jubId) {
		this.jubId = jubId;
	}

	public Integer getJubKindId() {
		return this.jubKindId;
	}

	public void setJubKindId(Integer jubKindId) {
		this.jubKindId = jubKindId;
	}

	public Integer getJubInfoId() {
		return this.jubInfoId;
	}

	public void setJubInfoId(Integer jubInfoId) {
		this.jubInfoId = jubInfoId;
	}

	public String getJubReason() {
		return this.jubReason;
	}

	public void setJubReason(String jubReason) {
		this.jubReason = jubReason;
	}

	public Timestamp getJubTime() {
		return this.jubTime;
	}

	public void setJubTime(Timestamp jubTime) {
		this.jubTime = jubTime;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getJTgShenhe() {
		return this.JTgShenhe;
	}

	public void setJTgShenhe(Integer JTgShenhe) {
		this.JTgShenhe = JTgShenhe;
	}

	public String getJBtgReason() {
		return this.JBtgReason;
	}

	public void setJBtgReason(String JBtgReason) {
		this.JBtgReason = JBtgReason;
	}

}