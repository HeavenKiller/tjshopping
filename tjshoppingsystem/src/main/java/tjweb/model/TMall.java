package tjweb.model;

/**
 * TMall entity. @author MyEclipse Persistence Tools
 */

public class TMall implements java.io.Serializable {

	// Fields

	private Integer mallId;
	private String mallName;

	// Constructors

	/** default constructor */
	public TMall() {
	}

	/** full constructor */
	public TMall(String mallName) {
		this.mallName = mallName;
	}

	// Property accessors

	public Integer getMallId() {
		return this.mallId;
	}

	public void setMallId(Integer mallId) {
		this.mallId = mallId;
	}

	public String getMallName() {
		return this.mallName;
	}

	public void setMallName(String mallName) {
		this.mallName = mallName;
	}

}