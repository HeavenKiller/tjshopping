package tjweb.model;

import java.sql.Timestamp;

/**
 * TBaol entity. @author MyEclipse Persistence Tools
 */

public class TBaol implements java.io.Serializable {

	// Fields

	private Integer baolId;
	private String baolUrl;
	private String baolTitle;
	private Double baolPrice;
	private Integer kindId;
	private Integer mallId;
	private String baolImgOne;
	private String baolImgTwo;
	private String baolImgThree;
	private String baolImgFour;
	private String baolImgFive;
	private Timestamp baolTime;
	private String baolBrand;
	private String baolPriceAdv;
	private String baolGoodsAdv;
	private Integer baolOtherInfo;
	private Integer baolIsZhiNum;
	private Integer baolIsNotzhiNum;
	private Integer BShoucNum;
	private Integer BCommNum;
	private Integer BTgShenhe;
	private String BBtgReason;
	private Integer baolPunished;
	private String baolPReason;
	private Integer userId;

	// Constructors

	/** default constructor */
	public TBaol() {
	}

	/** minimal constructor */
	public TBaol(Integer kindId, Integer mallId, Integer userId) {
		this.kindId = kindId;
		this.mallId = mallId;
		this.userId = userId;
	}

	/** full constructor */
	public TBaol(String baolUrl, String baolTitle, Double baolPrice,
			Integer kindId, Integer mallId, String baolImgOne,
			String baolImgTwo, String baolImgThree, String baolImgFour,
			String baolImgFive, Timestamp baolTime, String baolBrand,
			String baolPriceAdv, String baolGoodsAdv, Integer baolOtherInfo,
			Integer baolIsZhiNum, Integer baolIsNotzhiNum, Integer BShoucNum,
			Integer BCommNum, Integer BTgShenhe, String BBtgReason,
			Integer baolPunished, String baolPReason, Integer userId) {
		this.baolUrl = baolUrl;
		this.baolTitle = baolTitle;
		this.baolPrice = baolPrice;
		this.kindId = kindId;
		this.mallId = mallId;
		this.baolImgOne = baolImgOne;
		this.baolImgTwo = baolImgTwo;
		this.baolImgThree = baolImgThree;
		this.baolImgFour = baolImgFour;
		this.baolImgFive = baolImgFive;
		this.baolTime = baolTime;
		this.baolBrand = baolBrand;
		this.baolPriceAdv = baolPriceAdv;
		this.baolGoodsAdv = baolGoodsAdv;
		this.baolOtherInfo = baolOtherInfo;
		this.baolIsZhiNum = baolIsZhiNum;
		this.baolIsNotzhiNum = baolIsNotzhiNum;
		this.BShoucNum = BShoucNum;
		this.BCommNum = BCommNum;
		this.BTgShenhe = BTgShenhe;
		this.BBtgReason = BBtgReason;
		this.baolPunished = baolPunished;
		this.baolPReason = baolPReason;
		this.userId = userId;
	}

	// Property accessors

	public Integer getBaolId() {
		return this.baolId;
	}

	public void setBaolId(Integer baolId) {
		this.baolId = baolId;
	}

	public String getBaolUrl() {
		return this.baolUrl;
	}

	public void setBaolUrl(String baolUrl) {
		this.baolUrl = baolUrl;
	}

	public String getBaolTitle() {
		return this.baolTitle;
	}

	public void setBaolTitle(String baolTitle) {
		this.baolTitle = baolTitle;
	}

	public Double getBaolPrice() {
		return this.baolPrice;
	}

	public void setBaolPrice(Double baolPrice) {
		this.baolPrice = baolPrice;
	}

	public Integer getKindId() {
		return this.kindId;
	}

	public void setKindId(Integer kindId) {
		this.kindId = kindId;
	}

	public Integer getMallId() {
		return this.mallId;
	}

	public void setMallId(Integer mallId) {
		this.mallId = mallId;
	}

	public String getBaolImgOne() {
		return this.baolImgOne;
	}

	public void setBaolImgOne(String baolImgOne) {
		this.baolImgOne = baolImgOne;
	}

	public String getBaolImgTwo() {
		return this.baolImgTwo;
	}

	public void setBaolImgTwo(String baolImgTwo) {
		this.baolImgTwo = baolImgTwo;
	}

	public String getBaolImgThree() {
		return this.baolImgThree;
	}

	public void setBaolImgThree(String baolImgThree) {
		this.baolImgThree = baolImgThree;
	}

	public String getBaolImgFour() {
		return this.baolImgFour;
	}

	public void setBaolImgFour(String baolImgFour) {
		this.baolImgFour = baolImgFour;
	}

	public String getBaolImgFive() {
		return this.baolImgFive;
	}

	public void setBaolImgFive(String baolImgFive) {
		this.baolImgFive = baolImgFive;
	}

	public Timestamp getBaolTime() {
		return this.baolTime;
	}

	public void setBaolTime(Timestamp baolTime) {
		this.baolTime = baolTime;
	}

	public String getBaolBrand() {
		return this.baolBrand;
	}

	public void setBaolBrand(String baolBrand) {
		this.baolBrand = baolBrand;
	}

	public String getBaolPriceAdv() {
		return this.baolPriceAdv;
	}

	public void setBaolPriceAdv(String baolPriceAdv) {
		this.baolPriceAdv = baolPriceAdv;
	}

	public String getBaolGoodsAdv() {
		return this.baolGoodsAdv;
	}

	public void setBaolGoodsAdv(String baolGoodsAdv) {
		this.baolGoodsAdv = baolGoodsAdv;
	}

	public Integer getBaolOtherInfo() {
		return this.baolOtherInfo;
	}

	public void setBaolOtherInfo(Integer baolOtherInfo) {
		this.baolOtherInfo = baolOtherInfo;
	}

	public Integer getBaolIsZhiNum() {
		return this.baolIsZhiNum;
	}

	public void setBaolIsZhiNum(Integer baolIsZhiNum) {
		this.baolIsZhiNum = baolIsZhiNum;
	}

	public Integer getBaolIsNotzhiNum() {
		return this.baolIsNotzhiNum;
	}

	public void setBaolIsNotzhiNum(Integer baolIsNotzhiNum) {
		this.baolIsNotzhiNum = baolIsNotzhiNum;
	}

	public Integer getBShoucNum() {
		return this.BShoucNum;
	}

	public void setBShoucNum(Integer BShoucNum) {
		this.BShoucNum = BShoucNum;
	}

	public Integer getBCommNum() {
		return this.BCommNum;
	}

	public void setBCommNum(Integer BCommNum) {
		this.BCommNum = BCommNum;
	}

	public Integer getBTgShenhe() {
		return this.BTgShenhe;
	}

	public void setBTgShenhe(Integer BTgShenhe) {
		this.BTgShenhe = BTgShenhe;
	}

	public String getBBtgReason() {
		return this.BBtgReason;
	}

	public void setBBtgReason(String BBtgReason) {
		this.BBtgReason = BBtgReason;
	}

	public Integer getBaolPunished() {
		return this.baolPunished;
	}

	public void setBaolPunished(Integer baolPunished) {
		this.baolPunished = baolPunished;
	}

	public String getBaolPReason() {
		return this.baolPReason;
	}

	public void setBaolPReason(String baolPReason) {
		this.baolPReason = baolPReason;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

}