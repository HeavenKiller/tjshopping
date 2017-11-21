package tjweb.model;

/**
 * TKind entity. @author MyEclipse Persistence Tools
 */

public class TKind implements java.io.Serializable {

	// Fields

	private Integer kindId;
	private String kindName;
	private Integer kindLevel;
	private Integer kindParentId;
	private Integer searchNum;

	// Constructors

	/** default constructor */
	public TKind() {
	}

	/** full constructor */
	public TKind(String kindName, Integer kindLevel, Integer kindParentId,
			Integer searchNum) {
		this.kindName = kindName;
		this.kindLevel = kindLevel;
		this.kindParentId = kindParentId;
		this.searchNum = searchNum;
	}

	// Property accessors

	public Integer getKindId() {
		return this.kindId;
	}

	public void setKindId(Integer kindId) {
		this.kindId = kindId;
	}

	public String getKindName() {
		return this.kindName;
	}

	public void setKindName(String kindName) {
		this.kindName = kindName;
	}

	public Integer getKindLevel() {
		return this.kindLevel;
	}

	public void setKindLevel(Integer kindLevel) {
		this.kindLevel = kindLevel;
	}

	public Integer getKindParentId() {
		return this.kindParentId;
	}

	public void setKindParentId(Integer kindParentId) {
		this.kindParentId = kindParentId;
	}

	public Integer getSearchNum() {
		return this.searchNum;
	}

	public void setSearchNum(Integer searchNum) {
		this.searchNum = searchNum;
	}

}