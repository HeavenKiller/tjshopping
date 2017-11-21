package tjweb.model;

/**
 * TAddress entity. @author MyEclipse Persistence Tools
 */

public class TAddress implements java.io.Serializable {

	// Fields

	private Integer addressId;
	private String addressName;
	private Integer addressLevel;
	private Integer addressParentId;

	// Constructors

	/** default constructor */
	public TAddress() {
	}

	/** full constructor */
	public TAddress(String addressName, Integer addressLevel,
			Integer addressParentId) {
		this.addressName = addressName;
		this.addressLevel = addressLevel;
		this.addressParentId = addressParentId;
	}

	// Property accessors

	public Integer getAddressId() {
		return this.addressId;
	}

	public void setAddressId(Integer addressId) {
		this.addressId = addressId;
	}

	public String getAddressName() {
		return this.addressName;
	}

	public void setAddressName(String addressName) {
		this.addressName = addressName;
	}

	public Integer getAddressLevel() {
		return this.addressLevel;
	}

	public void setAddressLevel(Integer addressLevel) {
		this.addressLevel = addressLevel;
	}

	public Integer getAddressParentId() {
		return this.addressParentId;
	}

	public void setAddressParentId(Integer addressParentId) {
		this.addressParentId = addressParentId;
	}

}