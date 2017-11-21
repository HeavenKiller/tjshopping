package tjweb.model;

import java.sql.Timestamp;

/**
 * TXianz entity. @author MyEclipse Persistence Tools
 */

public class TXianz implements java.io.Serializable {

	// Fields

	private Integer xianzId;
	private String xianzUrl;
	private String xianzTitle;
	private Double ZPrice;
	private Double RPrice;
	private Integer kindId;
	private Integer chengseId;
	private Integer addressId;
	private Timestamp xianzTime;
	private String ZReason;
	private String RWay;
	private String isOrNotSend;
	private String isOrNotCutp;
	private String xianzIntro;
	private String xianzImgOne;
	private String xianzImgTwo;
	private String xianzImgThree;
	private String xianzImgFour;
	private String xianzImgFive;
	private String rspzImgOne;
	private String rspzImgTwo;
	private String rspzImgThree;
	private String rspzImgFour;
	private String rspzImgFive;
	private Integer XShoucNum;
	private Integer XCommNum;
	private Integer XTgShenhe;
	private String XBtgReason;
	private Integer xianzPunished;
	private String xianzPReason;
	private Integer userId;

	// Constructors

	/** default constructor */
	public TXianz() {
	}

	/** minimal constructor */
	public TXianz(Integer kindId, Integer userId) {
		this.kindId = kindId;
		this.userId = userId;
	}

	/** full constructor */
	public TXianz(String xianzUrl, String xianzTitle, Double ZPrice,
			Double RPrice, Integer kindId, Integer chengseId,
			Integer addressId, Timestamp xianzTime, String ZReason,
			String RWay, String isOrNotSend, String isOrNotCutp,
			String xianzIntro, String xianzImgOne, String xianzImgTwo,
			String xianzImgThree, String xianzImgFour, String xianzImgFive,
			String rspzImgOne, String rspzImgTwo, String rspzImgThree,
			String rspzImgFour, String rspzImgFive, Integer XShoucNum,
			Integer XCommNum, Integer XTgShenhe, String XBtgReason,
			Integer xianzPunished, String xianzPReason, Integer userId) {
		this.xianzUrl = xianzUrl;
		this.xianzTitle = xianzTitle;
		this.ZPrice = ZPrice;
		this.RPrice = RPrice;
		this.kindId = kindId;
		this.chengseId = chengseId;
		this.addressId = addressId;
		this.xianzTime = xianzTime;
		this.ZReason = ZReason;
		this.RWay = RWay;
		this.isOrNotSend = isOrNotSend;
		this.isOrNotCutp = isOrNotCutp;
		this.xianzIntro = xianzIntro;
		this.xianzImgOne = xianzImgOne;
		this.xianzImgTwo = xianzImgTwo;
		this.xianzImgThree = xianzImgThree;
		this.xianzImgFour = xianzImgFour;
		this.xianzImgFive = xianzImgFive;
		this.rspzImgOne = rspzImgOne;
		this.rspzImgTwo = rspzImgTwo;
		this.rspzImgThree = rspzImgThree;
		this.rspzImgFour = rspzImgFour;
		this.rspzImgFive = rspzImgFive;
		this.XShoucNum = XShoucNum;
		this.XCommNum = XCommNum;
		this.XTgShenhe = XTgShenhe;
		this.XBtgReason = XBtgReason;
		this.xianzPunished = xianzPunished;
		this.xianzPReason = xianzPReason;
		this.userId = userId;
	}

	// Property accessors

	public Integer getXianzId() {
		return this.xianzId;
	}

	public void setXianzId(Integer xianzId) {
		this.xianzId = xianzId;
	}

	public String getXianzUrl() {
		return this.xianzUrl;
	}

	public void setXianzUrl(String xianzUrl) {
		this.xianzUrl = xianzUrl;
	}

	public String getXianzTitle() {
		return this.xianzTitle;
	}

	public void setXianzTitle(String xianzTitle) {
		this.xianzTitle = xianzTitle;
	}

	public Double getZPrice() {
		return this.ZPrice;
	}

	public void setZPrice(Double ZPrice) {
		this.ZPrice = ZPrice;
	}

	public Double getRPrice() {
		return this.RPrice;
	}

	public void setRPrice(Double RPrice) {
		this.RPrice = RPrice;
	}

	public Integer getKindId() {
		return this.kindId;
	}

	public void setKindId(Integer kindId) {
		this.kindId = kindId;
	}

	public Integer getChengseId() {
		return this.chengseId;
	}

	public void setChengseId(Integer chengseId) {
		this.chengseId = chengseId;
	}

	public Integer getAddressId() {
		return this.addressId;
	}

	public void setAddressId(Integer addressId) {
		this.addressId = addressId;
	}

	public Timestamp getXianzTime() {
		return this.xianzTime;
	}

	public void setXianzTime(Timestamp xianzTime) {
		this.xianzTime = xianzTime;
	}

	public String getZReason() {
		return this.ZReason;
	}

	public void setZReason(String ZReason) {
		this.ZReason = ZReason;
	}

	public String getRWay() {
		return this.RWay;
	}

	public void setRWay(String RWay) {
		this.RWay = RWay;
	}

	public String getIsOrNotSend() {
		return this.isOrNotSend;
	}

	public void setIsOrNotSend(String isOrNotSend) {
		this.isOrNotSend = isOrNotSend;
	}

	public String getIsOrNotCutp() {
		return this.isOrNotCutp;
	}

	public void setIsOrNotCutp(String isOrNotCutp) {
		this.isOrNotCutp = isOrNotCutp;
	}

	public String getXianzIntro() {
		return this.xianzIntro;
	}

	public void setXianzIntro(String xianzIntro) {
		this.xianzIntro = xianzIntro;
	}

	public String getXianzImgOne() {
		return this.xianzImgOne;
	}

	public void setXianzImgOne(String xianzImgOne) {
		this.xianzImgOne = xianzImgOne;
	}

	public String getXianzImgTwo() {
		return this.xianzImgTwo;
	}

	public void setXianzImgTwo(String xianzImgTwo) {
		this.xianzImgTwo = xianzImgTwo;
	}

	public String getXianzImgThree() {
		return this.xianzImgThree;
	}

	public void setXianzImgThree(String xianzImgThree) {
		this.xianzImgThree = xianzImgThree;
	}

	public String getXianzImgFour() {
		return this.xianzImgFour;
	}

	public void setXianzImgFour(String xianzImgFour) {
		this.xianzImgFour = xianzImgFour;
	}

	public String getXianzImgFive() {
		return this.xianzImgFive;
	}

	public void setXianzImgFive(String xianzImgFive) {
		this.xianzImgFive = xianzImgFive;
	}

	public String getRspzImgOne() {
		return this.rspzImgOne;
	}

	public void setRspzImgOne(String rspzImgOne) {
		this.rspzImgOne = rspzImgOne;
	}

	public String getRspzImgTwo() {
		return this.rspzImgTwo;
	}

	public void setRspzImgTwo(String rspzImgTwo) {
		this.rspzImgTwo = rspzImgTwo;
	}

	public String getRspzImgThree() {
		return this.rspzImgThree;
	}

	public void setRspzImgThree(String rspzImgThree) {
		this.rspzImgThree = rspzImgThree;
	}

	public String getRspzImgFour() {
		return this.rspzImgFour;
	}

	public void setRspzImgFour(String rspzImgFour) {
		this.rspzImgFour = rspzImgFour;
	}

	public String getRspzImgFive() {
		return this.rspzImgFive;
	}

	public void setRspzImgFive(String rspzImgFive) {
		this.rspzImgFive = rspzImgFive;
	}

	public Integer getXShoucNum() {
		return this.XShoucNum;
	}

	public void setXShoucNum(Integer XShoucNum) {
		this.XShoucNum = XShoucNum;
	}

	public Integer getXCommNum() {
		return this.XCommNum;
	}

	public void setXCommNum(Integer XCommNum) {
		this.XCommNum = XCommNum;
	}

	public Integer getXTgShenhe() {
		return this.XTgShenhe;
	}

	public void setXTgShenhe(Integer XTgShenhe) {
		this.XTgShenhe = XTgShenhe;
	}

	public String getXBtgReason() {
		return this.XBtgReason;
	}

	public void setXBtgReason(String XBtgReason) {
		this.XBtgReason = XBtgReason;
	}

	public Integer getXianzPunished() {
		return this.xianzPunished;
	}

	public void setXianzPunished(Integer xianzPunished) {
		this.xianzPunished = xianzPunished;
	}

	public String getXianzPReason() {
		return this.xianzPReason;
	}

	public void setXianzPReason(String xianzPReason) {
		this.xianzPReason = xianzPReason;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

}