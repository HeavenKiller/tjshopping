package tjweb.model;

import java.sql.Timestamp;

/**
 * TComm entity. @author MyEclipse Persistence Tools
 */

public class TComm implements java.io.Serializable {

	// Fields

	private Integer commId;
	private Integer userIdOne;
	private Integer userIdOther;
	private Timestamp commTime;
	private Integer agreeNum;
	private Integer disagreeNum;
	private Integer artKindId;
	private Integer artId;
	private Integer commPunished;
	private String comm;
	private String oneNickname;
	private String otherNickname;
	private String userImg;
	private Integer commParent;

	// Constructors

	/** default constructor */
	public TComm() {
	}

	/** minimal constructor */
	public TComm(Integer userIdOne, Integer userIdOther, Integer artId,
			Integer commParent) {
		this.userIdOne = userIdOne;
		this.userIdOther = userIdOther;
		this.artId = artId;
		this.commParent = commParent;
	}

	/** full constructor */
	public TComm(Integer userIdOne, Integer userIdOther, Timestamp commTime,
			Integer agreeNum, Integer disagreeNum, Integer artKindId,
			Integer artId, Integer commPunished, String comm,
			String oneNickname, String otherNickname, String userImg,
			Integer commParent) {
		this.userIdOne = userIdOne;
		this.userIdOther = userIdOther;
		this.commTime = commTime;
		this.agreeNum = agreeNum;
		this.disagreeNum = disagreeNum;
		this.artKindId = artKindId;
		this.artId = artId;
		this.commPunished = commPunished;
		this.comm = comm;
		this.oneNickname = oneNickname;
		this.otherNickname = otherNickname;
		this.userImg = userImg;
		this.commParent = commParent;
	}

	// Property accessors

	public Integer getCommId() {
		return this.commId;
	}

	public void setCommId(Integer commId) {
		this.commId = commId;
	}

	public Integer getUserIdOne() {
		return this.userIdOne;
	}

	public void setUserIdOne(Integer userIdOne) {
		this.userIdOne = userIdOne;
	}

	public Integer getUserIdOther() {
		return this.userIdOther;
	}

	public void setUserIdOther(Integer userIdOther) {
		this.userIdOther = userIdOther;
	}

	public Timestamp getCommTime() {
		return this.commTime;
	}

	public void setCommTime(Timestamp commTime) {
		this.commTime = commTime;
	}

	public Integer getAgreeNum() {
		return this.agreeNum;
	}

	public void setAgreeNum(Integer agreeNum) {
		this.agreeNum = agreeNum;
	}

	public Integer getDisagreeNum() {
		return this.disagreeNum;
	}

	public void setDisagreeNum(Integer disagreeNum) {
		this.disagreeNum = disagreeNum;
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

	public Integer getCommPunished() {
		return this.commPunished;
	}

	public void setCommPunished(Integer commPunished) {
		this.commPunished = commPunished;
	}

	public String getComm() {
		return this.comm;
	}

	public void setComm(String comm) {
		this.comm = comm;
	}

	public String getOneNickname() {
		return this.oneNickname;
	}

	public void setOneNickname(String oneNickname) {
		this.oneNickname = oneNickname;
	}

	public String getOtherNickname() {
		return this.otherNickname;
	}

	public void setOtherNickname(String otherNickname) {
		this.otherNickname = otherNickname;
	}

	public String getUserImg() {
		return this.userImg;
	}

	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}

	public Integer getCommParent() {
		return this.commParent;
	}

	public void setCommParent(Integer commParent) {
		this.commParent = commParent;
	}

}