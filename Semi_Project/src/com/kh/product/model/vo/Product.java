package com.kh.product.model.vo;

public class Product {
	private int proNo;//	PRO_NO	NUMBER
	private String proName;//	PRO_NAME	VARCHAR2(100 BYTE)
	private String proCode;//	PRO_CODE	VARCHAR2(100 BYTE)
	private String proImage;//	PRO_IMAGE	VARCHAR2(100 BYTE)
	private String proMaker;//	PRO_MAKER	VARCHAR2(100 BYTE)
	private String proDes;//	PRO_DES	VARCHAR2(1000 BYTE)
	private String cateBno;//	CATE_BNO	NUMBER
	private String cateSno;//	CATE_SNO	NUMBER
	private String proSize;//	PRO_SIZE	VARCHAR2(10 BYTE)
	private int proPrice;//	PRO_PRICE	NUMBER
	private int proAmount;//	PRO_AMOUNT	NUMBER
	private String proLevel;//	PRO_LEVEL	NUMBER
	private int deliveryPrice;//	DELIVERY_PRICE	NUMBER
	private int proCount;//	PRO_COUNT	NUMBER
	private int sell;//	SELL	NUMBER
	private String status;//	PRO_STATUS	CHAR(2 BYTE)
	
	public Product() {
		super();
	}

	public Product(int proNo, String proName, String proCode, String proImage, String proMaker, String proDes,
			String cateBno, String cateSno, String proSize, int proPrice, int proAmount, String proLevel,
			int deliveryPrice, int proCount, int sell, String status) {
		super();
		this.proNo = proNo;
		this.proName = proName;
		this.proCode = proCode;
		this.proImage = proImage;
		this.proMaker = proMaker;
		this.proDes = proDes;
		this.cateBno = cateBno;
		this.cateSno = cateSno;
		this.proSize = proSize;
		this.proPrice = proPrice;
		this.proAmount = proAmount;
		this.proLevel = proLevel;
		this.deliveryPrice = deliveryPrice;
		this.proCount = proCount;
		this.sell = sell;
		this.status = status;
	}

	public int getProNo() {
		return proNo;
	}

	public void setProNo(int proNo) {
		this.proNo = proNo;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public String getProCode() {
		return proCode;
	}

	public void setProCode(String proCode) {
		this.proCode = proCode;
	}

	public String getProImage() {
		return proImage;
	}

	public void setProImage(String proImage) {
		this.proImage = proImage;
	}

	public String getProMaker() {
		return proMaker;
	}

	public void setProMaker(String proMaker) {
		this.proMaker = proMaker;
	}

	public String getProDes() {
		return proDes;
	}

	public void setProDes(String proDes) {
		this.proDes = proDes;
	}

	public String getCateBno() {
		return cateBno;
	}

	public void setCateBno(String cateBno) {
		this.cateBno = cateBno;
	}

	public String getCateSno() {
		return cateSno;
	}

	public void setCateSno(String cateSno) {
		this.cateSno = cateSno;
	}

	public String getProSize() {
		return proSize;
	}

	public void setProSize(String proSize) {
		this.proSize = proSize;
	}

	public int getProPrice() {
		return proPrice;
	}

	public void setProPrice(int proPrice) {
		this.proPrice = proPrice;
	}

	public int getProAmount() {
		return proAmount;
	}

	public void setProAmount(int proAmount) {
		this.proAmount = proAmount;
	}

	public String getProLevel() {
		return proLevel;
	}

	public void setProLevel(String proLevel) {
		this.proLevel = proLevel;
	}

	public int getDeliveryPrice() {
		return deliveryPrice;
	}

	public void setDeliveryPrice(int deliveryPrice) {
		this.deliveryPrice = deliveryPrice;
	}

	public int getProCount() {
		return proCount;
	}

	public void setProCount(int proCount) {
		this.proCount = proCount;
	}

	public int getSell() {
		return sell;
	}

	public void setSell(int sell) {
		this.sell = sell;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Product [proNo=" + proNo + ", proName=" + proName + ", proCode=" + proCode + ", proImage=" + proImage
				+ ", proMaker=" + proMaker + ", proDes=" + proDes + ", cateBno=" + cateBno + ", cateSno=" + cateSno
				+ ", proSize=" + proSize + ", proPrice=" + proPrice + ", proAmount=" + proAmount + ", proLevel="
				+ proLevel + ", deliveryPrice=" + deliveryPrice + ", proCount=" + proCount + ", sell=" + sell
				+ ", status=" + status + "]";
	}
	
	
	
	


	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
