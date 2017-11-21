package tjweb.model;

import java.sql.Timestamp;

/**
 * TShouc entity. @author MyEclipse Persistence Tools
 */

public class TShouc implements java.io.Serializable {

	// Fields

	private Integer shoucId;
	private Integer userId;
	private Integer artKindId;
	private Integer artId;
	private Timestamp shoucTime;

	// Constructors

	/** default constructor */
	public TShouc() {
	}

	/** minimal constructor */
	public TShouc(Integer userId, Integer artId) {
		this.userId = userId;
		this.artId = artId;
	}

	/** full constructor */
	public TShouc(Integer userId, Integer artKindId, Integer artId,
			Timestamp shoucTime) {
		this.userId = userId;
		this.artKindId = artKindId;
		this.artId = artId;
		this.shoucTime = shoucTime;
	}

	// Property accessors

	public Integer getShoucId() {
		return this.shoucId;
	}

	public void setShoucId(Integer shoucId) {
		this.shoucId = shoucId;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getArtKindId() {
		return this.artKindId;
	}

	public void setArtKindId(Integer artKindId) {
		this.artKindId = artKindId;
	}

	public Integer getArtId() {
		return this.artId;
	}

	public void setArtId(Integer artId) {
		this.artId = artId;
	}

	public Timestamp getShoucTime() {
		return this.shoucTime;
	}

	public void setShoucTime(Timestamp shoucTime) {
		this.shoucTime = shoucTime;
	}

}